<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Company;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth; 

use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Spatie\Permission\Models\Permission;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $perPage  = $request->size;
      $sortBy   = $request->sortBy?$request->sortBy:"name";
      $sort     = $request->sort?$request->sort:"ASC";
      if($this->getUser()->hasRole('super-admin')){
        $objData  = Company::orderBy($sortBy, $sort)->paginate($perPage); // $request->all()$request->all()
      }else{
        $objData  = [
          'message' => "Permission denied"
        ];
      }
      // elseif ($this->getUser()->can('list-company')) {
      //   $objData  = Company::orderBy($sortBy, $sort)->paginate($perPage)->where('id',$this->getUser()->company_id);
      // }
      return response()->json([
        "objData" => $objData
      ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      if($this->getUser()->can('create-company') || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(Company::$createRules);
        if($validatedData){
          Company::create($validatedData);
          return response()->json([
              "objData" => [
                  'message' => "Company created"
              ]
          ], 200);
        }
      }else{
        return response()->json([
            "error" => [
                'message' => "Permission denied"
            ]
        ], 403);
      }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      if(($this->getUser()->can('view-company') && $this->getUser()->company_id == $id) || $this->getUser()->hasRole('super-admin')){
        $objData = [
          "content" => Company::find($id)
        ];
        if(!$objData["content"]){
          $objData    = [
            "message"=> "Company not found"
          ];
        } 
        return response()->json([
            "objData" => $objData
        ], 200);
      }else{
        return response()->json([
          "error" => [
            'message' => "Permission denied"
          ]
        ], 403);
      }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
      //check if role superadmin or permission create-company
      if(($this->getUser()->can('edit-company')  && $this->getUser()->company_id == $id)|| $this->getUser()->hasRole('super-admin')){
        $company=Company::find($id);
        if($company){
          $rule = ($company->email != $request->email) ? Company::$createRules : Company::$updateRules;
          $validatedData = $request->validate($rule);
          if($validatedData){
            $company->update($validatedData);
            $objData    = [
              "message"=> "Company updated"
            ];
          }
        }else{
          $objData    = [
            "message"=> "Company not found"
          ];
        }
        return response()->json([
            "objData" => $objData
        ], 200);
      }else{
        return response()->json([
          "error" => [
            'message' => "Permission denied"
          ]
        ], 403);
      }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
  public function destroy($id)
  {
    if(($this->getUser()->can('delete-company')  && $this->getUser()->company_id == $id)|| $this->getUser()->hasRole('super-admin')){
      $company=Company::find($id);
      if($company){
        $company->addresses()->delete();
        foreach($company->files as $file){
          if(isset($file['Vehicle'])){
            $vId=$file['Vehicle'][0]->id;
            $veh=Vehicle::find($vId);
            if(count($file->protocol) > 0){
              $file->protocol()->delete();
            }
            $veh->tiers()->delete();
            $veh->delete();
          }
          if(isset($file->d_documents) && $file->d_documents != ''){
            $docs=explode(',',ltrim($file->d_documents,','));
            foreach ($docs as $key => $value) {
              $path='uploads/'.$this->getUser()->company_id.'/documents/'.$value;
              if(file_exists($path)){
                unlink($path);
              }
            }
          }
          if(isset($file->p_photos) && $file->p_photos != ''){
            $photos=explode(',',ltrim($file->p_photos,','));
            foreach ($photos as $key => $value) {
              $path='uploads/'.$this->getUser()->company_id.'/photos/'.$value;
              if(file_exists($path)){
                unlink($path);
              }
            }
          }
          $file->delete();
         }
        $company->vehicles()->delete();
        $company->QuestionTypes()->delete();     
        $company->delete();
        return response()->json([
          "objData" => [
            'message' => "Company Deleted"
          ]
        ], 403);
      }else{return response()->json([
        "objData" => [
          'message' => "Company not Found"
        ]
      ], 403);
      }
    }else{
      return response()->json([
        "objData" => [
          'message' => "Permission denied"
        ]
      ], 403);
    }
  }

  public function getUser(){
    return app('auth')->user();
  }

  public function search(Request $request)
  {
    if(!$this->getUser()->hasRole('super-admin') && !$this->getUser()->can('list-company')){
      return response()->json([
        "objData" => [
          'message' => "Permission denied"
        ]
      ], 401);
    }
    $query = "%".$request["query"]."%";
    
    $objData  = Company::where('name',  'LIKE', $query)
      ->orWhere('director',   'LIKE', $query)
      ->orWhere('register',   'LIKE', $query)
      ->orWhere('person',     'LIKE', $query)
      ->orWhere('tax_number', 'LIKE', $query)
      ->orWhere('email',      'LIKE', $query)
      ->orWhere('phone',      'LIKE', $query)
      ->orWhere('homepage',   'LIKE', $query)
      ->orWhere('mobile',     'LIKE', $query)
      ->orWhere('fax',        'LIKE', $query)
      ->orWhere('country',    'LIKE', $query)
      ->orWhere('city',       'LIKE', $query)
      ->orWhere('street_no',  'LIKE', $query)
      ->orWhere('mailbox',    'LIKE', $query)
      ->get();
    return response()->json([
      "objData" => $objData
    ], 200);
  }

}


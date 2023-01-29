<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CompanyProfile;
class CompanyProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $message='';
      $status='';
       if($this->getUser()->hasRole('super-admin') || $this->getUser()->can('list-company-profile')){
          $companies=CompanyProfile::all();
          $message=($companies->isNotEmpty()) ? $companies : 'Company profile not found';
          $status=($companies->isNotEmpty()) ? 200 : 404;
             }
          //    elseif ($this->getUser()->can('list-company-profile')) {
          // $companies=CompanyProfile::all()->where('id',$this->getUser()->company_id);
          // $message=($companies->isNotEmpty()) ? $companies : 'Company profile not found';
          // $status=($companies->isNotEmpty()) ? 200 : 404;
          //    }
        
        else{
             $message='Permission denied';
          $status=403;
        }
              return response()->json([
            'responseMessage' => $message,
            'responseStatus'  => $status,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        

    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($this->getUser()->can('create-company-profile') || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(CompanyProfile::$createRules);
         // return $validatedData;
        if($validatedData){

         $letterhead='';
  if(isset($request->cp_letterhead)){
    $file=$request->file('cp_letterhead');
     $destinationPath = 'uploads/company_profile/letterhead';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_letterhead']=$file->getClientOriginalName();
       }
 if(isset($request->cp_letterfoot)){
    $file=$request->file('cp_letterfoot');
     $destinationPath = 'uploads/company_profile/letterfoot';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_letterfoot']=$file->getClientOriginalName();
       }
 if(isset($request->cp_signature)){
    $file=$request->file('cp_signature');
     $destinationPath = 'uploads/company_profile/signature';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_signature']=$file->getClientOriginalName();
       }
        if(isset($request->cp_rubber_stamp)){
    $file=$request->file('cp_rubber_stamp');
     $destinationPath = 'uploads/company_profile/rubber_stamp';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_rubber_stamp']=$file->getClientOriginalName();
       }




            CompanyProfile::create($validatedData);
                return response()->json([
            'responseMessage' => 'Company profile created',
            'responseStatus'  => 200,
        ]);
        }
}
  else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       $company=CompanyProfile::find($id);
         if(!$company){
             return response()->json([
            'responseMessage' => 'Company profile not found',
            'responseStatus'  => 404,
        ]);
         }

      if($this->getUser()->can('view-company-profile') || $this->getUser()->hasRole('super-admin')){

        return response()->json([
            'responseMessage' => $company,
            'responseStatus'  =>200,
        ]);
}


        else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         $company=CompanyProfile::find($id);
         if(!$company){
             return response()->json([
            'responseMessage' => 'Company profile not found',
            'responseStatus'  => 404,
        ]);
         }
        if($this->getUser()->can('edit-company-profile') || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(CompanyProfile::$createRules);
         // return $validatedData;
        if($validatedData){

         $letterhead='';
  if(isset($request->cp_letterhead)){
    $file=$request->file('cp_letterhead');
     $destinationPath = 'uploads/company_profile/letterhead';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_letterhead']=$file->getClientOriginalName();
       }
 if(isset($request->cp_letterfoot)){
    $file=$request->file('cp_letterfoot');
     $destinationPath = 'uploads/company_profile/letterfoot';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_letterfoot']=$file->getClientOriginalName();
       }
 if(isset($request->cp_signature)){
    $file=$request->file('cp_signature');
     $destinationPath = 'uploads/company_profile/signature';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_signature']=$file->getClientOriginalName();
       }
        if(isset($request->cp_rubber_stamp)){
    $file=$request->file('cp_rubber_stamp');
     $destinationPath = 'uploads/company_profile/rubber_stamp';
     // $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['cp_rubber_stamp']=$file->getClientOriginalName();
       }




            $company->update($validatedData);
                return response()->json([
            'responseMessage' => 'Company profile updated',
            'responseStatus'  => 200,
        ]);
        }
}
  else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $company=CompanyProfile::find($id);
         if(!$company){
             return response()->json([
            'responseMessage' => 'Company profile not found',
            'responseStatus'  => 404,
        ]);
         }

      if($this->getUser()->can('delete-company-profile') || $this->getUser()->hasRole('super-admin')){

      if(isset($company->cp_letterhead) && $company->cp_letterhead != ''){
  $path='uploads/company_profile/letterhead/'.$company->cp_letterhead;
if(file_exists($path)){
  unlink($path);
}
    }
     if(isset($company->cp_letterfoot) && $company->cp_letterfoot != ''){
  $path='uploads/company_profile/letterfoot/'.$company->cp_letterfoot;
if(file_exists($path)){
  unlink($path);
}
    }
      if(isset($company->cp_signature) && $company->cp_signature != ''){
  $path='uploads/company_profile/signature/'.$company->cp_signature;
if(file_exists($path)){
  unlink($path);
}
    }
       if(isset($company->cp_rubber_stamp) && $company->cp_rubber_stamp != ''){
  $path='uploads/company_profile/rubber_stamp/'.$company->cp_rubber_stamp;
if(file_exists($path)){
  unlink($path);
}
    }
         
      $company->delete();
     return response()->json([
            'responseMessage' => 'Company profile deleted',
            'responseStatus'  => 200,
        ]);
      }
       else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
    }
      public function getUser(){
    return app('auth')->user();
    }

}

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
    public function index()
    {
      
      $message='';
      $status='';
       if($this->getUser()->hasRole('super-admin')){
          $companies=Company::all();
          $message=($companies->isNotEmpty()) ? $companies : 'Company not found';
          $status=($companies->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-company')) {
          $companies=Company::all()->where('id',$this->getUser()->company_id);
          $message=($companies->isNotEmpty()) ? $companies : 'Company not found';
          $status=($companies->isNotEmpty()) ? 200 : 404;
             }
        
        else{
             $message='Permission denied';
          $status=403;
        }
              return response()->json([
            'responseMessage' => $message,
            'responseStatus'  => $status,
        ]);
        // return 'r';
        // $user = Auth::guard('api')->user()->with('roles')->get();
        // $user = Auth::guard('api')->user()->with('roles.permissions')->get();
      // return response()->json(Auth::user()->hasPermissionViaRole());
// ->hasPermissionTo('manage-users')
        return response()->json($this->getUser()->can('view-company'));
               dd(
                 Auth::user(),
             Auth::user()->getAllPermissions()->toArray(),
             Auth::user()->can('manage-company'),
             Auth::user()->hasPermissionTo('manage-company')
        );
        $user = Auth::user();
// return Permission::find(2)->id;
         return Auth::guard('api')->user()->can('permissions:read');
        return config('auth.defaults.guard');
        return Auth::guard('api')->user()->can('edit-passwordds');
        return $this->getUser()->hasPermissionTo(2);
      //  $user = \Auth::user();
      //  //returning role of user
      //  return $this->getUser()->permissions;
      // // return app('auth')->user()->getAllPermissions()->toArray();
      //   return app('auth')->user()->can('manage-users');
      //  $roles = $this->getUser()->roles()->pluck('name');
      //  // return $user;
      //       return $this->getUser()->hasPermissionTo('manage-company');

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request->all();

        //check if role superadmin or permission create-company

 if($this->getUser()->can('create-company') || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(Company::$createRules);
         // return $validatedData;
        if($validatedData){
            Company::create($validatedData);
                return response()->json([
            'responseMessage' => 'Company created',
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
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      
        //check if role superadmin or permission create-company
  
        if(($this->getUser()->can('view-company') && $this->getUser()->company_id == $id) || $this->getUser()->hasRole('super-admin')){
        $company=Company::find($id);
        return response()->json([
            'responseMessage' => ($company) ? $company : 'Company not found',
            'responseStatus'  =>($company) ? 200 : 404,
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

$rule= ($company->email != $request->email) ? Company::$createRules : Company::$updateRules;

         $validatedData = $request->validate($rule);

        if($validatedData){
            $company->update($validatedData);
                return response()->json([
            'responseMessage' => 'Company updated',
            'responseStatus'  => 200,
        ]);
        }
      }
      else{
            return response()->json([
            'responseMessage' => 'Company not found',
            'responseStatus'  => 404,
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
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */
   public function destroy($id)
    {
    //   return 'a';
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
            'responseMessage' => 'Company deleted',
            'responseStatus'  => 200,
        ]);
         

      }
      else{
           return response()->json([
            'responseMessage' => 'Company not found',
            'responseStatus'  => 404,
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

      public function getUser(){
    return app('auth')->user();
    }

}

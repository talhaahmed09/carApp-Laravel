<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleAndPermissionController extends Controller
{
   public function assignPermission(Request $request)
    {



    	 app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
    	  if(($this->getUser()->hasRole('company-admin') && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){
            $role = Role::findByName($request->role);
return $role->syncPermissions($request->permissions);
  }
    else{
             $message='Permission denied';
          $status=403;
        }
    

    } //

      public function getPermissionsByRole(Request $request)
    {


          if(($this->getUser()->hasRole('company-admin') && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){

            $role = Role::findByName($request->role);
return $role->permissions->pluck('name');
          }
          else{
             $message='Permission denied';
          $status=403;
        }
    

    } //

    public function getUser(){
    return app('auth')->user();
    }
}
//changes in permission migration, permission tabel,seeder,api.php
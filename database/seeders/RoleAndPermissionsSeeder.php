<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Models\Company;
class RoleAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       // reset cached roles and permissions
     app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

   $user = ['list-user', 'view-user', 'create-user', 'edit-user', 'delete-user'];
$company = ['list-company', 'view-company', 'create-company', 'edit-company', 'delete-company'];
$companyProfile = ['list-company-profile', 'view-company-profile', 'create-company-profile', 'edit-company-profile', 'delete-company-profile'];
$vehicle = ['list-vehicle', 'view-vehicle', 'create-vehicle', 'edit-vehicle', 'delete-vehicle'];
$address = ['list-address', 'view-address', 'create-address', 'edit-address', 'delete-address'];
 $file = ['list-file', 'view-file', 'create-file', 'edit-file', 'delete-file'];
$setting = ['list-setting', 'view-setting', 'create-setting', 'edit-setting', 'delete-setting'];
$question = ['list-question', 'view-question', 'create-question', 'edit-question', 'delete-question'];
$questiontype = ['list-question-type', 'view-question-type', 'create-question-type', 'edit-question-type', 'delete-question-type'];
$assignPermission = ['assign-prtmission'];
 $allowNotification = ['allow-notification'];
      
       // setPermissionsTeamId(1);

    $allPermissions=array_merge($user,$company,$companyProfile,$vehicle,$address,$file,$setting,$question,$questiontype,$assignPermission,$allowNotification);

 $permissions = collect($allPermissions)->map(function ($permission) {
                 return ['name' => $permission, 'guard_name' => 'api'];
                });

    Permission::insert($permissions->toArray());

      $superAdmin = Role::create(['guard_name' => 'api','name' => 'super-admin'])->givePermissionTo(Permission::all());

$companyAdminPermissions=array_merge($user,$companyProfile,explode(',',$company[0]),explode(',',$company[1]),$vehicle,$address,$file,$setting,$question,$questiontype);
$companyAdmin = Role::create(['guard_name' => 'api','name' => 'company-admin'])
             ->givePermissionTo($companyAdminPermissions);

    $expertPermissions=array_merge(explode(',',$company[1]),$vehicle,$address,$file,$question,$questiontype);
$expert = Role::create(['guard_name' => 'api','name' => 'expert'])
             ->givePermissionTo($expertPermissions);

  $clerkPermissions=array_merge(explode(',',$company[1]),$vehicle,$address,$file);
$clerk = Role::create(['guard_name' => 'api','name' => 'clerk'])
             ->givePermissionTo($clerkPermissions);

    }
}

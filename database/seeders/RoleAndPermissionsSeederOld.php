<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

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
$vehicle = ['list-vehicle', 'view-vehicle', 'create-vehicle', 'edit-vehicle', 'delete-vehicle'];
$address = ['list-address', 'view-address', 'create-address', 'edit-address', 'delete-address'];
 $file = ['list-file', 'view-file', 'create-file', 'edit-file', 'delete-file'];
$setting = ['list-setting', 'view-setting', 'create-setting', 'edit-setting', 'delete-setting'];
$question = ['list-question', 'view-question', 'create-question', 'edit-question', 'delete-question'];
$questiontype = ['list-question-type', 'view-question-type', 'create-question-type', 'edit-question-type', 'delete-question-type'];
$assigPermission = 'assign-prtmission';
 $allowNotification = 'allow-notification';
        $adminPermissions = [
            'list-user',
            'view-user',
            'create-user',
            'edit-user',
            'delete-user',
            'list-company',
            'view-company',
            'create-company',
            'edit-company',
            'delete-company',
             'list-vehicle',
            'view-vehicle',
            'create-vehicle',
            'edit-vehicle',
            'delete-vehicle',
            'list-address',
            'view-address',
            'create-address',
            'edit-address',
            'delete-address',
            'list-file',
            'view-file',
            'create-file',
            'edit-file',
            'delete-file',
            'list-setting',
            'view-setting',
            'create-setting',
            'edit-setting',
            'delete-setting',
            'list-question',
            'view-question',
            'create-question',
            'edit-question',
            'delete-question',
              'list-question-type',
            'view-question-type',
            'create-question-type',
            'edit-question-type',
            'delete-question-type',
        ];
    // 'lang-manage',
            // 'lang-change',

        foreach($adminPermissions as $ap)
        {
            $permission = Permission::create(['guard_name' => 'api','name' => $ap,'company_id'=>1]);
            // $superAdmin->givePermissionTo($permission);
        }
      $superAdmin = Role::create(['guard_name' => 'api','name' => 'super-admin','company_id'=>1])->givePermissionTo(Permission::all());
$companyAdmin = Role::create(['guard_name' => 'api','name' => 'company-admin','company_id'=>1])
             ->givePermissionTo(['list-company','view-company','list-user','view-user','create-user',
            'edit-user','list-address','view-address','create-address','edit-address','delete-address',
         'delete-user','list-vehicle','view-vehicle','create-vehicle','edit-vehicle','delete-vehicle',
         'list-file','view-file','create-file','edit-file','delete-file','list-setting','view-setting',
    'create-setting','edit-setting','delete-setting','list-question','view-question','create-question',
    'edit-question','delete-question',]);
        $expert = Role::create(['guard_name' => 'api','name' => 'expert','company_id'=>1])
                         ->givePermissionTo(['view-company',
                                             'list-user',
                                            'view-user',
                                            'create-user',
                                            'edit-user',
                                            'delete-user',
                                              'list-vehicle',
                                            'view-vehicle',
                                            'create-vehicle',
                                            'edit-vehicle',
                                            'delete-vehicle',
                                            'list-file',
                                            'view-file',
                                            'create-file',
                                            'edit-file',
                                            'delete-file',
                                            'list-setting',
                                            'view-setting',
                                            'create-setting',
                                            'edit-setting',
                                            'delete-setting',]);
       $clerk = Role::create(['guard_name' => 'api','name' => 'clerk','company_id'=>1])
                        ->givePermissionTo(['view-company',
                                             'list-user',
                                            'view-user',
                                            'create-user',
                                            'edit-user',
                                            'delete-user',
                                              'list-vehicle',
                                            'view-vehicle',
                                            'create-vehicle',
                                            'edit-vehicle',
                                            'delete-vehicle',
                                            'list-file',
                                            'view-file',
                                            'create-file',
                                            'edit-file',
                                            'delete-file',
                                            ]);
    }
}

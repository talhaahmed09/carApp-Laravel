<?php
namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $adminRole = Role::create(['name' => 'Admin']);

        $adminPermissions = [
            'manage-users',
            'view-users',
            'create-users',
            'edit-users',
            'delete-users',
            // 'lang-manage',
            // 'lang-change',
            'manage-company',
            'view-company',
            'create-company',
            'edit-company',
            'delete-company',
             'manage-vehicle',
            'view-vehicle',
            'create-vehicle',
            'edit-vehicle',
            'delete-vehicle',
            'manage-file',
            'view-file',
            'create-file',
            'edit-file',
            'delete-file',
            'manage-settings',
            'view-settings',
            'create-settings',
            'edit-settings',
            'delete-settings',
        ];
        foreach($adminPermissions as $ap)
        {
            $permission = Permission::create(['name' => $ap]);
            $adminRole->givePermissionTo($permission);
        }
        $adminUser = User::create(
            [
                'name' => 'Admin',
                'email' => 'admin@example2.com',
                'password' => Hash::make('12345678'),
            ]
        );
        $adminUser->assignRole($adminRole);

        // $customerRole        = Role::create(['name' => 'Customer']);
        // $customerPermissions = [
        //     'view-users',
        //     'lang-change',
        //     'manage-orders',
        //     'create-orders',
        //     'edit-orders',
        //     'reply-orders',
        // ];
        // foreach($customerPermissions as $ep)
        // {
        //     $permission = Permission::firstOrCreate(['name' => $ep]);
        //     $customerRole->givePermissionTo($permission);
        // }
        // $editorUser = User::create(
        //     [
        //         'name' => 'Customer',
        //         'email' => 'customer@example.com',
        //         'password' => Hash::make('1234'),
        //         'parent' => 1,
        //     ]
        // );
        // $editorUser->assignRole($customerRole);
    }
}
// https://github.com/spatie/laravel-permission/issues/781

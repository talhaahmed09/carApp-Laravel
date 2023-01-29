<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $user = Company::factory()
        //    ->count(3)
        //     ->has(User::factory()->count(3)
        //          ->create()
        //     ->each(
        //         function($user){
        //             $user->assignRole('super-admin');
        //         }
        //      )
        // )
        //     ->create();




      
        User::factory()->count(1)
            ->create()
            ->each(
                function($user){
                	$user->assignRole('super-admin');
                }
             );
              User::factory()->count(1)
            ->create()
            ->each(
                function($user){
                	$user->assignRole('company-admin');
                }
             );
                User::factory()->count(1)
            ->create()
            ->each(
                function($user){
                	$user->assignRole('expert');
                }
             );
                  User::factory()->count(1)
            ->create()
            ->each(
                function($user){
                	$user->assignRole('clerk');
                }
             );
    }
}

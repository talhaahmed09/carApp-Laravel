<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class RoleAndPermisssionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
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
        return [
            //
        ];
    }
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use App\Models\Company;
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        // return [
        //     'name' => $this->faker->name(),
        //     'email' => $this->faker->unique()->safeEmail(),
        //     'email_verified_at' => now(),
        //     // 'password' => 'Test@123', // password
        //     'password'=>Hash::make('Test@123'),
        //     'remember_token' => Str::random(10),
        // ];
         return [
            'first_name' => $this->faker->firstName(),
            'last_name' => $this->faker->lastName(),
            'birthday'=>$this->faker->date(),
            'email' => $this->faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'mobile' => $this->faker->unique()->phoneNumber(),
            'country'=>$this->faker->country(),
            'city'=>$this->faker->city(),
             // 'company_id'=>$this->faker->unique()->randomDigit,
             'company_id'=>Company::Factory(),

            // 'password' => 'Test@123', // password
            'password'=>Hash::make('Test@123'),
            'remember_token' => Str::random(10),
        ];

    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}

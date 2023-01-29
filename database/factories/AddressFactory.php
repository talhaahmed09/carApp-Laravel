<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Company;
class AddressFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
         return [
            'first_name' => $this->faker->firstName(),
            'last_name' => $this->faker->lastName(),
            // 'birthday'=>$this->faker->date(),
            'email' => $this->faker->unique()->safeEmail(),
            // 'email_verified_at' => now(),
            'mobile' => $this->faker->unique()->phoneNumber(),
            'country'=>$this->faker->country(),
            'city'=>$this->faker->city(),
             // 'company_id'=>$this->faker->unique()->randomDigit,
             'company_id'=>Company::Factory(),
        ];
    }
}

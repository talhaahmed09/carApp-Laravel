<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

use App\Models\Company;

class FileFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
         return [
             'company_id'=>Company::Factory(),
             'gd_license_plate' =>$this->faker->text($maxNbChars = 10),
            'gd_vehicle_manufacturer' => $this->faker->text($maxNbChars = 10),
            'gd_owner_name'=> $this->faker->firstName(),
            'inv_contact'=> $this->faker->text($maxNbChars = 10),
            'inv_participation'=> $this->faker->text($maxNbChars = 10),
            'inv_designation'=> $this->faker->text($maxNbChars = 10),
            'vi_ort_firma'=> $this->faker->text($maxNbChars = 10),
            'vi_address'=> $this->faker->text($maxNbChars = 10),
            'vi_from'=> $this->faker->text($maxNbChars = 10),
            'vi_to'=> $this->faker->text($maxNbChars = 10),
            'vi_expert'=> $this->faker->text($maxNbChars = 10),
            'vi_participator'=> $this->faker->text($maxNbChars = 10)
        ];
    }
}

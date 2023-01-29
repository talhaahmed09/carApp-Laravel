<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Company;

class VehicleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
             'license_plate' => $this->faker->text($maxNbChars = 5),
            'chassis_no' => $this->faker->text($maxNbChars = 5),
            'hsn'=> $this->faker->text($maxNbChars = 5),
            'tsn'=> $this->faker->text($maxNbChars = 5),
            'vehicle_type' => $this->faker->text($maxNbChars = 5),
            'manufacturer' => $this->faker->text($maxNbChars = 5),
            'main_type' => $this->faker->text($maxNbChars = 5),
            'subtype' => $this->faker->text($maxNbChars = 5),
            'company_id'=>Company::Factory(),
        ];
    }
}

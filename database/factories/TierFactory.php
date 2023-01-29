<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Vehicle;
use App\Models\TierSet;
class TierFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
         return [
             'vehicle_id' => Vehicle::Factory(),
            'tier_set_id' => TierSet::Factory(),
            'tier_comment'=> $this->faker->text($maxNbChars = 10),
            'tier_type'=> $this->faker->text($maxNbChars = 5),
            'tier_rims' => $this->faker->text($maxNbChars = 5),
            'tier_tread_depth' => $this->faker->text($maxNbChars = 5),
            'tier_manufacturer' => $this->faker->text($maxNbChars = 5),
            'tier_model' => $this->faker->text($maxNbChars = 5),
            'tier_dimensions' => $this->faker->text($maxNbChars = 5),
        ];
    }
}


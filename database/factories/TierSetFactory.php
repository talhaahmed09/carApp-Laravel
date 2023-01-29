<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\TierLayout;
use Illuminate\Support\Arr;

class TierSetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
             $array = ['set_1', 'set_2', 'set_3','set_4', 'set_5', 'set_6'];

$random = Arr::random($array);
         return [
             'tier_layout_id' => TierLayout::Factory(),
            'name' => $random,
        ];
    }
}

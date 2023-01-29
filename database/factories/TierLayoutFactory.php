<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Arr;

class TierLayoutFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $array = ['layout_1', 'layout_2', 'layout_3'];

$random = Arr::random($array);
        return [
            'name' => $random,
        ];
    }
}


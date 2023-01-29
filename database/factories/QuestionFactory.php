<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\QuestionType;

class QuestionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
       return [
            'qt_id'=>QuestionType::Factory(),
            'question'=>$this->faker->text($maxNbChars = 10),
            'answer'=>$this->faker->text($maxNbChars = 10),
        ];
    }
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\File;
use App\Models\Question;
class FileQuestionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
       return [
             'fq_file_id' => File::Factory(),
            'fq_question_id' => Question::Factory(),
            // 'fq_question'=>$this->faker->text($maxNbChars = 5),
            'fq_answer'=>$this->faker->text($maxNbChars = 5),
        ];
    }
}

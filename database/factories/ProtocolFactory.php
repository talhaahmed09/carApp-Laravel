<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\File;

class ProtocolFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
         return [
             'pr_file_id' => File::Factory(),
            'pr_file_minor_name' => $this->faker->text($maxNbChars = 5),
            'pr_date_time'=>$this->faker->text($maxNbChars = 5),
            'pr_editor'=>$this->faker->text($maxNbChars = 5),
        ];
    }
}

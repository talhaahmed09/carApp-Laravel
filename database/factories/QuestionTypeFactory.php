<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Company;
class QuestionTypeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        //php artisan storage:link
        //public_path('images')
        return [
            // 'qt_icon'=> $this->faker->image(storage_path('images'),64,64, null, false),
            'qt_icon'=> 'imageName',
            'qt_no'=>$this->faker->text($maxNbChars = 10),
            'qt_name'=>$this->faker->text($maxNbChars = 10),
            'company_id'=>Company::Factory(),
        ];
    }
}

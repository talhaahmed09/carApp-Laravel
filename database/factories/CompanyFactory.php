<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class CompanyFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name'          => $this->faker->company(),
            'director'      => $this->faker->name(),
            'person'        => $this->faker->name(),
            'tax_number'    => $this->faker->numerify('###_##'),
            'email'         => $this->faker->unique()->safeEmail(),
            'phone'         => $this->faker->unique()->phoneNumber(),
            'fax'           => $this->faker->numerify('###_##'),
            'mobile'        => $this->faker->unique()->phoneNumber(),
            'country'       => $this->faker->country(),
            'city'          => $this->faker->city(),
            'street_no'     => $this->faker->numerify('###_##'),
            'mailbox'       => $this->faker->numerify('###_##'),
            'register'      => $this->faker->numerify('#####'),
            'zipcode'       => $this->faker->numerify('#####'),
        ];
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\FileQuestion;

class FileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         FileQuestion::factory(7)->create();
        //
    }
}

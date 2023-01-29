<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\TierLayout;
use App\Models\TierSet;
use App\Models\Tier;
use App\Models\Vehicle;

class TierLayoutSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
   Vehicle::factory(3)->create();
        TierLayout::factory(3)->create();
        TierSet::factory(6)->create();
        Tier::factory(3)->create();
    }
}

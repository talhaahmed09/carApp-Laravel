<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Tier;

class Vehicle extends Model
{
    use HasFactory;
    protected $guarded=[];
    
     public static $createRules = [
        // 'title' => 'required',
        'license_plate' => 'required|string|max:255',
        'chassis_no' => 'required|string|max:255',
        'hsn' => 'required',
        'tsn' => 'sometimes|required',
        'vehicle_type' => 'required',
         'manufacturer' => 'required',
        'main_type' => 'required',
        'subtype' => 'required',
        'structure' => 'sometimes', 
        'wheel_base' => 'sometimes', 
        'driven_type' => 'sometimes', 
        'drive_cabin' => 'sometimes', 
        'seats' => 'sometimes', 
        'empty_mass' => 'sometimes', 
        'construction' => 'sometimes', 
        'suspension_type' => 'sometimes', 
        'axes' => 'sometimes', 
        'equipment_line' => 'sometimes', 
        'axle_load' => 'sometimes', 
        'long' => 'sometimes', 
        'width' => 'sometimes', 
        'height' => 'sometimes', 
        'engine' => 'sometimes', 
        'power' => 'sometimes', 
        'engine_displacement' => 'sometimes', 
        'fuel_gear' => 'sometimes', 
        'emission_class' => 'sometimes', 
        'fine_dust_stricker' => 'sometimes', 
        'id_dynamic' => 'sometimes', 
        'fr_option' => 'sometimes', 
        'first_registration' => 'sometimes', 
        'last_admission' => 'sometimes', 
        'aprroved_in' => 'sometimes', 
        'construction_year' => 'sometimes', 
        'next_main_inspection' => 'sometimes', 
        'next_security_check' => 'sometimes', 
        'last_gas_test' => 'sometimes', 
        'accident_prevention_regulation' => 'sometimes', 
        'gen_dynamic' => 'sometimes', 
        'read_off' => 'sometimes', 
        'ro_option' => 'sometimes', 
        'specified' => 'sometimes', 
        'sp_option' => 'sometimes', 
        'estimated' => 'sometimes', 
        'est_option' => 'sometimes', 
        'mileage' => 'sometimes', 
        'mileage_comment' => 'sometimes', 
        'mil_dynamic' => 'sometimes', 
        'color' => 'sometimes', 
        'previous_owner_count' => 'sometimes', 
        'data_source' => 'sometimes', 
        'import_vehicle' => 'sometimes', 
        'steering_wheel_position' => 'sometimes', 
        'misc_dynamic' => 'sometimes', 
        'equipements' => 'sometimes', 
        'tier_layout' => 'sometimes', 
        'event_date' => 'sometimes', 
        'event_cost' => 'sometimes', 
        'event_event' => 'sometimes', 
        'event_comment' => 'sometimes', 
        'vl_position' => 'sometimes', 
        'vl_measurement' => 'sometimes', 
        'vl_description' => 'sometimes', 
        'tier_layout_id' => 'sometimes', 
        'company_id' => 'required',  
    ];

 public static $createTierRules = [

      'tier_set_id' => 'required', 
        'tier_type' => 'required', 
        'tier_rims' => 'required', 
        'tier_tread_depth' => 'required', 
        'tier_manufacturer' => 'required', 
        'tier_model'=>'required',
        'tier_comment'=>'required',
        'tier_dimensions'=>'required',
        // 'vehicle_id'=>'required'
    ];
      public function tiers()
    {
        return $this->hasMany(Tier::class);
    }
     protected $appends = ['relatedTiers'];

          public function getRelatedTiersAttribute()
    {
$tiers = $this->tiers()->get();
        return $tiers;
    }
  
}

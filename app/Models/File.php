<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Tier;
use App\Models\Protocol;
class File extends Model
{
    use HasFactory;
    protected $guarded=[];
           public static $createRules = [
        'gd_license_plate' => 'required',
        'gd_vehicle_manufacturer' => 'required',
        'gd_vehicle_mode' => 'required',
        'gd_owner_name' => 'required',
          'gd_owner_city'=>'sometimes',
        'gd_owner_country'=>'sometimes',
        'gd_email'=>'sometimes',
        'gd_contact_no'=>'sometimes',
        'gd_order_date'=>'sometimes',
        'gd_inspection_date'=>'sometimes',
        'gd_expert_name'=>'sometimes',
        'gd_clerk'=>'sometimes',
        'gd_order_placement'=>'sometimes',
        'gd_vat_rate'=>'sometimes',
        'gd_address_city'=>'sometimes',
        'gd_address_country'=>'sometimes',
        'gd_street_no'=>'sometimes',
        'gd_mailbox'=>'sometimes',
        'email' => 'email',
        'inv_contact' => 'required',
        'inv_participation' => 'required',
        'inv_designation' => 'required',
        'vi_ort_firma' => 'required',
        'vi_address' => 'required',
        'vi_from' => 'required',
        'vi_to' => 'required',
        'vi_expert' => 'required',
        'vi_participator' => 'required',
        'd_documents'=>'sometimes',
        'p_photos'=>'sometimes',
        'ques_ans'=>'sometimes',
        'company_id'=>'required'
    ];

     protected $appends = ['Vehicle','Protocol'];
public function vehicle()
    {
        return $this->hasOne(Vehicle::class);
    }
          public function getVehicleAttribute()
    {
$vehicle = $this->vehicle()->get();
        return $vehicle;
    }
    public function protocol()
    {
        return $this->hasMany(Protocol::class,'pr_file_id');
    }
           public function getProtocolAttribute()
    {
$protocol = $this->protocol()->get();
        return $protocol;
    }
//     protected function performUpdate(Builder $query, array $options = [])
// {
//     $dirty = $this->getDirty();

//     if (count($dirty) > 0)
//     {
//         // runs update query
//     }
//  return parent::update($attributes, $options);
//     return true;
// }
}

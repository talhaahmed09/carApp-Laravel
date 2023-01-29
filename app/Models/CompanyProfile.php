<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyProfile extends Model
{
    use HasFactory;
      protected $guarded=[];
     public static $createRules = [
        'cp_name' => 'required',
        'cp_location' => 'required',
        'cp_letterhead' => 'sometimes',
        'cp_letterfoot' => 'sometimes',
        'cp_sender_address' => 'required',
        'cp_sender_name' => 'required',
        'cp_contact_details' => 'sometimes',
        'cp_signature' => 'sometimes',
        'cp_rubber_stamp' => 'sometimes',
        'cp_stmp_server' => 'sometimes',
        'cp_stmp_port' => 'sometimes',
        'cp_user_name' => 'sometimes',
        'cp_password'=>'sometimes',
        'cp_signature_imprint'=>'sometimes',
          // 'company_id'=>'required'
    ];
}

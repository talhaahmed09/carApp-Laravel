<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

 protected $guarded=[];

     public static $createRules = [
        // 'title' => 'required',
        'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        // 'birthday' => 'required',
        'email' => 'required|email|unique:addresses',
        'mobile' => 'required',
         'country' => 'required',
        'city' => 'required',
        // 'role' => 'required',
        'company_id' => 'required',
        // 'password' => 'required|string|min:8|confirmed',
           'salution'=>'sometimes',
        'title'=>'sometimes',
        'homepage'=>'sometimes',
        'is_active'=>'sometimes',
        'telephone'=>'sometimes',
        'fax'=>'sometimes',
        'street_no'=>'sometimes',
        'mailbox'=>'sometimes',
        'add_comment'=>'sometimes',
        'vat_id'=>'sometimes'
    ];
        public static $updateRules = [
        // 'title' => 'required',
        'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        // 'birthday' => 'required',
        'email' => 'required|email',
        'mobile' => 'required',
         'country' => 'required',
        'city' => 'required',
        // 'role' => 'required',
        'company_id' => 'required',
        // 'password' => 'required|string|min:8|confirmed',
          'salution'=>'sometimes',
        'title'=>'sometimes',
        'homepage'=>'sometimes',
        'is_active'=>'sometimes',
        'telephone'=>'sometimes',
        'fax'=>'sometimes',
        'street_no'=>'sometimes',
        'mailbox'=>'sometimes',
        'add_comment'=>'sometimes',
        'vat_id'=>'sometimes'
    ];
}

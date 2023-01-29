<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Address;
use App\Models\File;
use App\Models\Vehicle;
use App\Models\QuestionType;
class Company extends Model
{
    use HasFactory;

       public static $createRules = [
        'name' => 'required',
        'director' => 'required',
        'person' => 'required',
        'tax_number' => 'required',
        'email' => 'required|unique:companies',
        'phone' => 'required',
        'mobile' => 'required',
        'fax' => 'required',
        'country' => 'required',
        'city' => 'required',
        'street_no' => 'required',
        'mailbox' => 'required',
        'register'=>'required',
        'homepage'=>'sometimes'
    ];
      public static $updateRules = [
        'name' => 'required',
        'director' => 'required',
        'person' => 'required',
        'tax_number' => 'required',
         'email' => 'required|email',
        'phone' => 'required',
        'mobile' => 'required',
        'fax' => 'required',
        'country' => 'required',
        'city' => 'required',
        'street_no' => 'required',
        'mailbox' => 'required',
         'register'=>'required',
        'homepage'=>'sometimes'

    ];
    protected $guarded=[];

     public function users()
    {
        return $this->hasmany(User::class);
    }
      public function addresses()
    {
        return $this->hasmany(Address::class);
    }
     public function files()
    {
        return $this->hasmany(File::class);
    }
      public function vehicles()
    {
        return $this->hasmany(Vehicle::class);
    }
      public function QuestionTypes()
    {
        return $this->hasmany(QuestionType::class);
    }
    
}

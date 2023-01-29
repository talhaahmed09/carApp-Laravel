<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Protocol extends Model
{
    use HasFactory;
      protected $guarded=[];
           public static $createRules = [
        'pr_file_id' => 'required',
        'pr_file_minor_name' => 'required',
        'pr_date_time' => 'required',
        'pr_editor' => 'required',
    ];
 protected $appends = ['UserName'];
      public function userName()
    {
        return $this->belongsTo(User::class,'pr_editor');
    }

          public function getUserNameAttribute()
    {
$name = $this->userName()->first()->first_name.' '.$this->userName()->first()->last_name;
        return $name;
    }

}

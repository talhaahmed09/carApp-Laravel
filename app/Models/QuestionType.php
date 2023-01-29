<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionType extends Model
{
    use HasFactory;
      protected $guarded=[];
           public static $createRules = [
 'qt_icon' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048|dimensions:width=500,height=500',
        'qt_no' => 'required',
        'qt_name' => 'required|unique:question_types',
        'company_id' => 'required',
    ];
       public static $updateRules = [
 'qt_icon' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048|dimensions:width=500,height=500',
        'qt_no' => 'required',
        'qt_name' => 'required',
        'company_id' => 'required',
    ];
}

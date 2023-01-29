<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FileQuestion extends Model
{
    use HasFactory;
      protected $guarded=[];
           public static $createRules = [
        // 'fq_file_id' => 'required',
        'fq_question_id' => 'required',
        // 'fq_question' => 'required',
        'fq_answer' => 'required',
    ];
}

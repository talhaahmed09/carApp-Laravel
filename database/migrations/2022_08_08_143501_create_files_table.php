<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('files', function (Blueprint $table) {
            $table->id();
             $table->string('gd_license_plate');
              $table->string('gd_vehicle_manufacturer');
              $table->string('gd_vehicle_mode')->nullable();
              $table->string('gd_owner_name');
              $table->string('gd_owner_city')->nullable();
              $table->string('gd_owner_country')->nullable();
              $table->string('gd_email')->nullable();
              $table->string('gd_contact_no')->nullable();
              $table->string('gd_order_date')->nullable();
              $table->string('gd_inspection_date')->nullable();
              $table->string('gd_expert_name')->nullable();
              $table->string('gd_clerk')->nullable();
              $table->string('gd_order_placement')->nullable();
              $table->string('gd_vat_rate')->nullable();
              $table->string('gd_address_city')->nullable();
              $table->string('gd_address_country')->nullable();
              $table->string('gd_street_no')->nullable();
              $table->string('gd_mailbox')->nullable();
              $table->string('inv_participation');
              $table->string('inv_contact'); //dynamic{comma separated numbers}
              $table->string('inv_designation');
              $table->string('vi_ort_firma'); 
              $table->string('vi_address',255);
              $table->string('vi_from');
              $table->string('vi_to');
              $table->string('vi_expert');
              $table->string('vi_participator');
              $table->string('d_documents')->nullable();//comma separated
              $table->string('p_photos')->nullable();//comma separated
    $table->unsignedBigInteger('company_id');
            $table->foreign('company_id')
            ->references('id')
            ->on('companies')
            ->onDelete('cascade');
              $table->string('ques_ans')->nullable();
            $table->timestamps();
        });
         // Schema::create('file_questions', function (Blueprint $table) {
         //      $table->id();
         //       $table->unsignedBigInteger('fq_file_id');
         //    $table->foreign('fq_file_id')
         //    ->references('id')
         //    ->on('files');
         //    $table->string('fq_question_type');
         //    $table->string('fq_question');
         //    $table->string('fq_answer');
         //    $table->timestamps();
         //  });
             Schema::create('protocols', function (Blueprint $table) {
              $table->id();
              $table->unsignedBigInteger('pr_file_id');
            $table->foreign('pr_file_id')
            ->references('id')
            ->on('files')
             ->onDelete('cascade');
            $table->string('pr_file_minor_name');//any file minor
            $table->string('pr_date_time');
            $table->string('pr_editor');
            $table->timestamps();
          });
    }
 
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('files');
        Schema::dropIfExists('file_questions');
        Schema::dropIfExists('protocols');
        
    }
}

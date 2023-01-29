<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompanyProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_profiles', function (Blueprint $table) {
            $table->id();
             $table->string('cp_name');
     $table->string('cp_location');
     $table->string('cp_letterhead')->nullable();
     $table->string('cp_letterfoot')->nullable();
 $table->string('cp_sender_address');
    $table->string('cp_sender_name');
     $table->string('cp_contact_details')->nullable();
    $table->string('cp_signature')->nullable();
    $table->string('cp_rubber_stamp')->nullable();
    $table->string('cp_stmp_server')->nullable();
        $table->string('cp_stmp_port')->nullable();
        $table->string('cp_user_name')->nullable();
        $table->string('cp_password')->nullable();
        $table->string('cp_signature_imprint')->nullable();
            // $table->foreign('company_id')
            // ->references('id')
            // ->on('companies')
            // ->onDelete('cascade');
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
        Schema::dropIfExists('company_profiles');
    }
}

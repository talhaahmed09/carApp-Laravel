<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
         $table->bigIncrements('id');
            $table->string('name');
            $table->string('director');
            $table->string('register')->nullable();
            $table->string('person');
            $table->string('tax_number');
            $table->string('email')->unique();
            $table->string('phone');
            $table->string('homepage')->nullable();
            $table->string('mobile');            
            $table->string('fax');            
            $table->string('country');
            $table->string('city');            
            $table->string('street_no');            
            $table->string('mailbox')->nullable();            
            
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
        Schema::dropIfExists('companies');
    }
}

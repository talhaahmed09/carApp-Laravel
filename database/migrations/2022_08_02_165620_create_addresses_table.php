<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
             $table->string('salution')->nullable();
            $table->string('title')->nullable();
            $table->string('first_name');
            $table->string('last_name');
              $table->unsignedBigInteger('company_id');
            $table->foreign('company_id')
            ->references('id')
            ->on('companies')
            ->onDelete('cascade');
        $table->string('email');
          $table->string('homepage')->nullable();
            $table->string('telephone')->nullable();
            $table->string('mobile');
            $table->string('fax')->nullable();
              $table->string('country');
            $table->string('city');            
            $table->string('street_no')->nullable();    
             $table->string('mailbox')->nullable();
               $table->string('add_comment')->nullable();    
             $table->string('vat_id')->nullable();
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
        Schema::dropIfExists('addresses');
    }
}

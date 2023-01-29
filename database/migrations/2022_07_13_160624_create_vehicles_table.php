<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicles', function (Blueprint $table) {
            $table->id();
            $table->string('license_plate');
            $table->string('chassis_no');
            $table->string('hsn');
            $table->string('tsn');
            $table->string('vehicle_type');
            $table->string('manufacturer');
            $table->string('main_type');
            $table->string('subtype');
            $table->string('structure')->nullable();
            $table->string('wheel_base')->nullable();
            $table->string('driven_type')->nullable();
            $table->string('drive_cabin')->nullable();
            $table->string('seats')->nullable();
            $table->string('empty_mass')->nullable();
            $table->string('construction')->nullable();
            $table->string('suspension_type')->nullable();
            $table->string('axes')->nullable();
            $table->string('equipment_line')->nullable();
            $table->string('axle_load')->nullable();
            $table->string('long')->nullable();
            $table->string('width')->nullable();
            $table->string('height')->nullable();
            $table->string('engine')->nullable();
            $table->string('power')->nullable();
            $table->string('engine_displacement')->nullable();
            $table->string('fuel_gear')->nullable();
            $table->string('emission_class')->nullable();
            $table->string('fine_dust_stricker')->nullable();
$table->string('id_dynamic')->nullable();//identification dynamic field
$table->string('fr_option')->nullable();//(unknown,none,estimated)
            $table->string('first_registration')->nullable(); //date
            $table->string('last_admission')->nullable();//date
            $table->string('aprroved_in')->nullable();
            $table->string('construction_year')->nullable();
            $table->string('next_main_inspection')->nullable();//date
            $table->string('next_security_check')->nullable();//date
            $table->string('last_gas_test')->nullable();//date
            $table->string('accident_prevention_regulation')->nullable();
$table->string('gen_dynamic')->nullable();//general dynamic field
            $table->string('read_off')->nullable();//date
$table->string('ro_option')->nullable();//not defined
            $table->string('specified')->nullable();//date
$table->string('sp_option')->nullable();//not defined
            $table->string('estimated')->nullable();//date
$table->string('est_option')->nullable();//not defined
            $table->string('mileage')->nullable();
            $table->string('mileage_comment')->nullable();
$table->string('mil_dynamic')->nullable();//mileage dynamic field
            $table->string('color')->nullable();
            $table->string('previous_owner_count')->nullable();
            $table->string('data_source')->nullable();//DAT, Audatex, Fahrzeugpapiere, Werkstattunterlagen
$table->string('import_vehicle')->nullable();
            $table->string('steering_wheel_position')->nullable();
$table->string('misc_dynamic')->nullable();//miscelianeous dynamic field
            $table->string('equipements')->nullable();// {'equipement_type: option'}
            $table->string('tier_layout')->nullable();//not defined
            $table->string('event_date')->nullable();//comma separated//date
            $table->string('event_cost')->nullable();//comma separated
            $table->string('event_event')->nullable();//comma separated
            $table->string('event_comment',255)->nullable();//comma separated
            $table->string('vl_position',255)->nullable();//comma separated
            $table->string('vl_measurement',255)->nullable();//comma separated
            $table->string('vl_description',255)->nullable();//comma separated
//in different table
            $table->string('tier_layout_id',5)->nullable();// get all sets of this layout
        
           $table->unsignedBigInteger('company_id');
            $table->foreign('company_id')
            ->references('id')
            ->on('companies')
            ->onDelete('cascade');
//             $table->dropForeign('answers_user_id_foreign');
// $table->foreign('user_id')
// ->references('id')->on('users')
// ->onDelete('cascade');
// ;



          $table->string('file_id',5)->nullable();
            // $table->string('import_vehicle');

            $table->timestamps();
        });


          Schema::create('tier_layouts', function (Blueprint $table) {
              $table->id();
            $table->string('name');
            $table->timestamps();
          });
           Schema::create('tier_sets', function (Blueprint $table) {
              $table->id();
            $table->unsignedBigInteger('tier_layout_id');
            $table->foreign('tier_layout_id')
            ->references('id')
            ->on('tier_layouts')
             ->onDelete('cascade');
            $table->string('name');
            $table->timestamps();
          });

          Schema::create('tiers', function (Blueprint $table) {
  $table->id();
             $table->unsignedBigInteger('vehicle_id');
            $table->foreign('vehicle_id')
            ->references('id')
            ->on('vehicles')
             ->onDelete('cascade');
                    $table->unsignedBigInteger('tier_set_id');
            $table->foreign('tier_set_id')
            ->references('id')
            ->on('tier_sets')
             ->onDelete('cascade');
            $table->string('tier_comment');//comma separated comments send from different variables
            $table->string('tier_type');
            $table->string('tier_rims');
            $table->string('tier_tread_depth');
            $table->string('tier_manufacturer');
            $table->string('tier_model');
            $table->string('tier_dimensions');
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
        Schema::dropIfExists('vehicles');
        Schema::dropIfExists('tier_layouts');
        Schema::dropIfExists('tier_sets');
        Schema::dropIfExists('tiers');

    }
}

<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Vehicle;
use Illuminate\Http\Request;
use App\Models\Tier;
class VehicleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
                     $message='';
      $status='';
       if($this->getUser()->hasRole('super-admin')){
          $vehicles=Vehicle::all();
          $message=($vehicles->isNotEmpty()) ? $vehicles : 'Vehicle not found';
          $status=($vehicles->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-vehicle')) {
          $vehicles=Vehicle::all()->where('company_id',$this->getUser()->company_id);
          $message=($vehicles->isNotEmpty()) ? $vehicles : 'Vehicle not found';
          $status=($vehicles->isNotEmpty()) ? 200 : 404;
             }
        
        else{
             $message='Permission denied';
          $status=403;
        }
              return response()->json([
            'responseMessage' => $message,
            'responseStatus'  => $status,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request;

       if( ($this->getUser()->can('create-vehicle')  && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){
 // return $request->all();

        $validatedData = $request->validate(Vehicle::$createRules);

        foreach ($validatedData as $key => $value) {
            if(is_array($value)){
                $validatedData[$key]= implode(',',$value);
            }
        }

        if($validatedData){
           $vId=Vehicle::create($validatedData)->id;


        ////
      
        $request->request->add(['vehicle_id' => $vId]); 

 $validatedTierData = $request->validate(Vehicle::$createTierRules);
if($validatedTierData){
        $data=[
         'vehicle_id'=>$vId,
          'tier_comment' => implode(',',$request['tier_comment']), 
          'tier_dimensions' => implode(',',$request['tier_dimensions']), 
      'tier_set_id' => implode(',',$request['tier_set_id']), 
        'tier_type' => implode(',',$request['tier_type']), 
        'tier_rims' => implode(',',$request['tier_rims']), 
        'tier_tread_depth' => implode(',',$request['tier_tread_depth']), 
        'tier_manufacturer' => implode(',',$request['tier_manufacturer']), 
        'tier_model'=> implode(',',$request['tier_model']),
        ];
         Tier::create($data);
}
        ///
            
                return response()->json([
            'responseMessage' => 'Vehicle created',
            'responseStatus'  => 200,
        ]);
        }
}
  else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\c  $c
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $vehicle=Vehicle::find($id);
        if(!$vehicle){
             return response()->json([
            'responseMessage' => 'Vehicle not found',
            'responseStatus'  => 404,
        ]);
        }
       if(($this->getUser()->can('view-vehicle') && $this->getUser()->company_id == $vehicle->company_id) || $this->getUser()->hasRole('super-admin')){
        // $vehicleWithTiers=Vehicle::find($id);
        return response()->json([
            'responseMessage' => ($vehicle) ? $vehicle : 'Vehicle not found',
            'responseStatus'  =>($vehicle) ? 200 : 404,
        ]);
}
  else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\c  $c
     * @return \Illuminate\Http\Response
     */
    public function edit(c $c)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\c  $c
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $vehicle=Vehicle::find($id);

        if(!$vehicle){
             return response()->json([
            'responseMessage' => 'Vehicle not found',
            'responseStatus'  => 404,
        ]);
        }
    
 // return $request->all();
       if(($this->getUser()->can('edit-vehicle') && $this->getUser()->company_id == $vehicle->company_id) || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(Vehicle::$createRules);

        foreach ($validatedData as $key => $value) {
            if(is_array($value)){
                $validatedData[$key]= implode(',',$value);
            }
        }

        if($validatedData){
      
    $vehicle->update($validatedData);
        ////
      
        $request->request->add(['vehicle_id' => $id]); 

 $validatedTierData = $request->validate(Vehicle::$createTierRules);
if($validatedTierData){
    $vehicle->tiers()->delete();
          $data=[
         'vehicle_id'=>$id,
          'tier_comment' => implode(',',$request['tier_comment']), 
          'tier_dimensions' => implode(',',$request['tier_dimensions']), 
      'tier_set_id' => implode(',',$request['tier_set_id']), 
        'tier_type' => implode(',',$request['tier_type']), 
        'tier_rims' => implode(',',$request['tier_rims']), 
        'tier_tread_depth' => implode(',',$request['tier_tread_depth']), 
        'tier_manufacturer' => implode(',',$request['tier_manufacturer']), 
        'tier_model'=> implode(',',$request['tier_model']),
        ];
         Tier::create($data);
}
        ///
            
                return response()->json([
            'responseMessage' => 'Vehicle updated',
            'responseStatus'  => 200,
        ]);
        }
}
  else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\c  $c
     * @return \Illuminate\Http\Response
     */
       public function destroy($id)
    {
      
         $vehicle=Vehicle::find($id);

        if(!$vehicle){
             return response()->json([
            'responseMessage' => 'Vehicle not found',
            'responseStatus'  => 404,
        ]);
        }
             if(($this->getUser()->can('delete-vehicle') && $this->getUser()->company_id == $vehicle->company_id) || $this->getUser()->hasRole('super-admin')){
    $vehicle->tiers()->delete();
    $vehicle->delete();
     return response()->json([
            'responseMessage' => 'Vehicle deleted',
            'responseStatus'  => 200,
        ]);
    }
      else{
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
  }
    public function getUser(){
    return app('auth')->user();
    }
}

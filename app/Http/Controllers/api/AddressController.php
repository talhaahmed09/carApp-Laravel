<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;

use App\Models\Address;
use Illuminate\Http\Request;

class AddressController extends Controller
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
          $addresses=Address::all();
          $message=($addresses->isNotEmpty()) ? $addresses : 'Address not found';
          $status=($addresses->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-address')) {
          $addresses=Address::all()->where('company_id',$this->getUser()->company_id);
          $message=($addresses->isNotEmpty()) ? $addresses : 'Address not found';
          $status=($addresses->isNotEmpty()) ? 200 : 404;
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
       
 if(($this->getUser()->can('create-user')  && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){
        $validatedData = $request->validate(Address::$createRules);
        // return $validatedData;
        if($validatedData){
            Address::create($validatedData);
                return response()->json([
            'responseMessage' => 'Address created',
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
     * @param  \App\Models\Address  $address
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $address=Address::find($id);
           if(!$address){
             return response()->json([
            'responseMessage' => 'Address not found',
            'responseStatus'  => 404,
        ]);
        }
        if(($this->getUser()->can('view-address') && $this->getUser()->company_id == $address->company_id) || $this->getUser()->hasRole('super-admin')){
        
        return response()->json([
            'responseMessage' => ($address) ? $address : 'Address not found',
            'responseStatus'  =>($address) ? 200 : 404,
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
     * @param  \App\Models\Address  $address
     * @return \Illuminate\Http\Response
     */
    public function edit(Address $address)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Address  $address
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       
      $address=Address::find($id);
   if(!$address){
             return response()->json([
            'responseMessage' => 'Address not found',
            'responseStatus'  => 404,
        ]);
        }
        //check if role superadmin or permission create-company
        if(($this->getUser()->can('edit-address')  && $this->getUser()->company_id == $address->company_id)|| $this->getUser()->hasRole('super-admin')){
      if($address){
        // $rr=$request->except('email');
$rule= ($address->email != $request->email) ? Address::$createRules : Address::$updateRules;
$validatedData = $request->validate($rule);
      
        if($validatedData){
            $address->update($validatedData);
                return response()->json([
            'responseMessage' => 'Address updated',
            'responseStatus'  => 200,
        ]);
        }
      }
      else{
            return response()->json([
            'responseMessage' => 'Address not found',
            'responseStatus'  => 404,
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
     * @param  \App\Models\Address  $address
     * @return \Illuminate\Http\Response
     */
          public function destroy($id)
    {
      
         $address=Address::find($id);

        if(!$address){
             return response()->json([
            'responseMessage' => 'Address not found',
            'responseStatus'  => 404,
        ]);
        }
             if(($this->getUser()->can('delete-address') && $this->getUser()->company_id == $address->company_id) || $this->getUser()->hasRole('super-admin')){
    $address->delete();
     return response()->json([
            'responseMessage' => 'Address deleted',
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

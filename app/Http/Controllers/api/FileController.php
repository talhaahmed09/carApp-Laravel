<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\File;
use App\Models\Vehicle;
use App\Models\Tier;
use App\Models\FileQuestion;
use App\Models\Protocol;
class FileController extends Controller
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
          $files=File::all();
          $message=($files->isNotEmpty()) ? $files : 'File not found';
          $status=($files->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-file')) {
          $files=File::all()->where('company_id',$this->getUser()->company_id);
          $message=($files->isNotEmpty()) ? $files : 'File not found';
          $status=($files->isNotEmpty()) ? 200 : 404;
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
           $message='';
      $status='';
 if(($this->getUser()->can('create-file') && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){
        $validatedFileData = $request->validate(File::$createRules);

    $validatedFileData['inv_contact']=is_array($request->inv_contact) && isset($request->inv_contact) ? implode(',',$request->inv_contact) : '';

        if($validatedFileData){
//upload doc and photos
            $docs='';
            $photos='';
  if(isset($request->d_documents)){
    foreach ($request->d_documents as $key => $value) {
$file=$request->file('d_documents')[$key];
   //Move Uploaded File
      $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      if($key>0){
      $docs.=','.$file->getClientOriginalName();
      }
      else{
      $docs.=$file->getClientOriginalName();
      }
           }
       }
       // return $docs;

             if(isset($request->p_photos)){
                   foreach ($request->p_photos as $key => $value) {
$file=$request->file('p_photos')[$key];
   //Move Uploaded File
      $destinationPath = 'uploads/'.$this->getUser()->company_id.'/photos';
      $file->move($destinationPath,$file->getClientOriginalName());
      if($key>0){
      $photos.=','.$file->getClientOriginalName();
      }
      else{
        // .$file->getClentOriginalExtension()
      $photos.=$file->getClientOriginalName();
      }
           }
           }
 
  $validatedFileData['d_documents']=$docs;
  $validatedFileData['p_photos']=$photos;
            }
// return $photos;

    $validatedVehicleData = $request->validate(Vehicle::$createRules);

        foreach ($validatedVehicleData as $key => $value) {
            if(is_array($value)){
                $validatedVehicleData[$key]= implode(',',$value);
            }
        }

if ($validatedVehicleData) {
         
 $validatedTierData = $request->validate(Vehicle::$createTierRules);
if($validatedTierData){

$vId='';
// return 'r';
   $fId=File::create($validatedFileData)->id;
   $validatedVehicleData['file_id']=$fId;
           $vId=Vehicle::create($validatedVehicleData)->id;

        $tierData=[
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
         Tier::create($tierData);
} 

}
            $message='File created';
            $status=200;
         
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $file=File::find($id);
        if(!$file){
             return response()->json([
            'responseMessage' => 'File not found',
            'responseStatus'  => 404,
        ]);
        }
           if(($this->getUser()->can('view-file') && $this->getUser()->company_id == $file->company_id) || $this->getUser()->hasRole('super-admin')){
        return response()->json([
            'responseMessage' => $file ,
            'responseStatus'  =>200,
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       $fileData=File::find($id);
$changedAttributes=[];
        if(!$fileData){
             return response()->json([
            'responseMessage' => 'File not found',
            'responseStatus'  => 404,
        ]);
        }
            $message='';
      $status='';
 if(($this->getUser()->can('edit-file') && $this->getUser()->company_id == $fileData->company_id) || $this->getUser()->hasRole('super-admin')){
        $validatedFileData = $request->validate(File::$createRules);
 foreach ($validatedFileData as $key => $value) {
            if(is_array($value)){
                $validatedFileData[$key]= implode(',',$value);
            }
        }


        if($validatedFileData){
//upload doc and photos
            $docs='';
            $photos='';
  if(isset($request->d_documents)){
    foreach ($request->d_documents as $key => $value) {
$file=$request->file('d_documents')[$key];
   //Move Uploaded File
      $destinationPath = 'uploads/'.$this->getUser()->company_id.'/documents';
      $file->move($destinationPath,$file->getClientOriginalName());
      if($key>0){
      $docs.=','.$file->getClientOriginalName();
      }
      else{
      $docs.=$file->getClientOriginalName();
      }
           }
       }
       // return $docs;

             if(isset($request->p_photos)){
                   foreach ($request->p_photos as $key => $value) {
$file=$request->file('p_photos')[$key];
   //Move Uploaded File
      $destinationPath = 'uploads/'.$this->getUser()->company_id.'/photos';
      $file->move($destinationPath,$file->getClientOriginalName());
      if($key>0){
      $photos.=','.$file->getClientOriginalName();
      }
      else{
        // .$file->getClentOriginalExtension()
      $photos.=$file->getClientOriginalName();
      }
           }
           }
 
  $validatedFileData['d_documents']=$docs;
  $validatedFileData['p_photos']=$photos;
            }
// return $photos;

    $validatedVehicleData = $request->validate(Vehicle::$createRules);

        foreach ($validatedVehicleData as $key => $value) {
            if(is_array($value)){
                $validatedVehicleData[$key]= implode(',',$value);
            }
        }

if ($validatedVehicleData) {
         
 $validatedTierData = $request->validate(Vehicle::$createTierRules);
if($validatedTierData){

$vId='';
$vId=$fileData['Vehicle'][0]->id;
   $fileData->update($validatedFileData);
   //
// return count($fileData->getChanges());
if(count($fileData->getChanges()) > 0){
  foreach ($fileData->getChanges() as $key => $value) {

 $changedAttributes['time'][]=$fileData->getChanges()['updated_at'];
 
 if (str_contains($key, 'gd')) { 
    $changedAttributes['minor_name'][]='General Data';
}
 else if (str_contains($key, 'inv')) { 
    $changedAttributes['minor_name'][]='Involved';
}
 else if (str_contains($key, 'vi')) { 
    $changedAttributes['minor_name'][]='Vehicle Inspection';
}
else if (str_contains($key, 'd_documents')) { 
    $changedAttributes['minor_name'][]='Documents';
}
else if (str_contains($key, 'p_photos')) { 
    $changedAttributes['minor_name'][]='Photos';
}
else if (str_contains($key, 'ques_ans')) { 
    $changedAttributes['minor_name'][]='Questions';
}
else { 
  if(!$fileData->getChanges()['updated_at']){
      $changedAttributes['minor_name'][]='Vehicles';
  }
  
   
}
}
}


//
   $fId=$id;
   $validatedVehicleData['file_id']=$fId;
   $veh=Vehicle::find($vId);
   $veh->update($validatedVehicleData);
           // $vId=Vehicle::create($validatedVehicleData)->id;
////update tier
        $request->request->add(['vehicle_id' => $id]); 
if(count($veh->tiers) > 0){
  $veh->tiers()->delete();
    }
   
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

}
if(isset($changedAttributes) && $changedAttributes != []){
  foreach ($changedAttributes['minor_name'] as $key => $value) {
 
$protocol=[
           'pr_file_id'=>$id,
           'pr_file_minor_name'=>$value,
           'pr_date_time'=>$changedAttributes['time'][$key],
           'pr_editor'=>$this->getUser()->id
];
 Protocol::create($protocol);
}

}



            $message='File updated';
            $status=200;
         
        }
        else{
             $message='Permission denied';
          $status=403;
        }
           return response()->json([
            'responseMessage' => $message,
            'responseStatus'  => $status,
        ]);
        //protocol creates here
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         $fileData=File::find($id);

        if(!$fileData){
             return response()->json([
            'responseMessage' => 'File not found',
            'responseStatus'  => 404,
        ]);
        }
 if(($this->getUser()->can('delete-file') && $this->getUser()->company_id == $fileData->company_id) || $this->getUser()->hasRole('super-admin')){
  $vId=$fileData['Vehicle'][0]->id;
  $veh=Vehicle::find($vId);
    if(count($fileData->protocol) > 0){
  $fileData->protocol()->delete();
    }
    if(isset($fileData->d_documents) && $fileData->d_documents != ''){

$docs=explode(',',ltrim($fileData->d_documents,','));
foreach ($docs as $key => $value) {
  $path='uploads/'.$this->getUser()->company_id.'/documents/'.$value;
if(file_exists($path)){
  unlink($path);
}
}
    }
      if(isset($fileData->p_photos) && $fileData->p_photos != ''){

$photos=explode(',',ltrim($fileData->p_photos,','));

foreach ($photos as $key => $value) {
  $path='uploads/'.$this->getUser()->company_id.'/photos/'.$value;
if(file_exists($path)){
  unlink($path);
}
}
    }

 $veh->tiers()->delete();
  $veh->delete();
 $fileData->delete();
   $message='File deleted';
            $status=200;
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

      public function getUser(){
    return app('auth')->user();
    }
}

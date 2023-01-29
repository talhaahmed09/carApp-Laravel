<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\QuestionType;
class QuestionTypeController extends Controller
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
          $quesTypes=QuestionType::all();
          $message=($quesTypes->isNotEmpty()) ? $quesTypes : 'Question type not found';
          $status=($quesTypes->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-question-type')) {
          $quesTypes=QuestionType::all()->where('id',$this->getUser()->company_id);
          $message=($quesTypes->isNotEmpty()) ? $quesTypes : 'Question type not found';
          $status=($quesTypes->isNotEmpty()) ? 200 : 404;
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
         if(($this->getUser()->can('create-question-type')  && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
        // return $request->all();

        $validatedData = $request->validate(QuestionType::$createRules);
$file=$request->file('qt_icon');
if($file)
{
    $destinationPath = 'uploads/'.$this->getUser()->company_id.'/question-icon';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['qt_icon']=$file->getClientOriginalName();  
}

 
        if($validatedData){
            QuestionType::create($validatedData);
                return response()->json([
            'responseMessage' => 'Question type created',
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
          $data=QuestionType::find($id);
        if(!$data){
             return response()->json([
            'responseMessage' => 'Question type not found',
            'responseStatus'  => 404,
        ]);
        }
         if(($this->getUser()->can('view-question-type') && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
        return response()->json([
            'responseMessage' => $data,
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
       $data=QuestionType::find($id);
$changedAttributes=[];
        if(!$data){
             return response()->json([
             'responseMessage' => 'Question type not found',
            'responseStatus'  => 404,
        ]);
        }
      
 if(($this->getUser()->can('edit-question-type') && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
    $rule= ($data->qt_name != $request->qt_name) ? QuestionType::$createRules : QuestionType::$updateRules;
  $validatedData = $request->validate($rule);

  if($validatedData){
$file=$request->file('qt_icon');
if($file)
{
    $destinationPath = 'uploads/'.$this->getUser()->company_id.'/question-icon';
      $file->move($destinationPath,$file->getClientOriginalName());
      $validatedData['qt_icon']=$file->getClientOriginalName();  
}

    $data->update($validatedData);
          return response()->json([
            'responseMessage' => 'Question type updated',
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         $data=QuestionType::find($id);
        if(!$data){
             return response()->json([
             'responseMessage' => 'Question type not found',
            'responseStatus'  => 404,
        ]);
        }
         if(($this->getUser()->can('delete-question-type') && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
if(isset($data->qt_icon) && $data->qt_icon != ''){
  $path='uploads/'.$this->getUser()->company_id.'/question-icon/'.$data->qt_icon;
if(file_exists($path)){

  unlink($path);
}
}
$data->delete();
    return response()->json([
            'responseMessage' => 'Question type deleted',
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

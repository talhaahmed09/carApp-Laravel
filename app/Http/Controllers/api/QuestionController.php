<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Question;
class QuestionController extends Controller
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
          $questions=Question::all();
          $message=($questions->isNotEmpty()) ? $questions : 'Question not found';
          $status=($questions->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-question')) {
          $questions=Question::all()->where('id',$this->getUser()->company_id);
          $message=($questions->isNotEmpty()) ? $questions : 'Question not found';
          $status=($questions->isNotEmpty()) ? 200 : 404;
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
         if($this->getUser()->can('create-question') || $this->getUser()->hasRole('super-admin')){
        // return $request->all();

        $validatedData = $request->validate(Question::$createRules);

 
        if($validatedData){
            Question::create($validatedData);
                return response()->json([
            'responseMessage' => 'Question created',
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
    $data=Question::find($id);
        if(!$data){
             return response()->json([
            'responseMessage' => 'Question not found',
            'responseStatus'  => 404,
        ]);
        }
         if(($this->getUser()->can('view-question') && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
             $data=Question::find($id);

        if(!$data){
             return response()->json([
             'responseMessage' => 'Question not found',
            'responseStatus'  => 404,
        ]);
        }
       if($this->getUser()->can('edit-question') || $this->getUser()->hasRole('super-admin')){
        // return $request->all();

        $validatedData = $request->validate(Question::$createRules);

 
        if($validatedData){
               $data->update($validatedData);
                return response()->json([
            'responseMessage' => 'Question updated',
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
        $data=Question::find($id);
        if(!$data){
             return response()->json([
             'responseMessage' => 'Question not found',
            'responseStatus'  => 404,
        ]);
        }
         if(($this->getUser()->can('delete-question') && $this->getUser()->company_id == $data->company_id) || $this->getUser()->hasRole('super-admin')){
$data->delete();
    return response()->json([
            'responseMessage' => 'Question deleted',
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

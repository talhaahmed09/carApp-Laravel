<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
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
          $users=User::all();
          $message=($users->isNotEmpty()) ? $users : 'User not found';
          $status=($users->isNotEmpty()) ? 200 : 404;
             }
             elseif ($this->getUser()->can('list-user')) {
          $users=User::all()->where('company_id',$this->getUser()->company_id);
          $message=($users->isNotEmpty()) ? $users : 'User not found';
          $status=($users->isNotEmpty()) ? 200 : 404;
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
 if(($this->getUser()->can('create-user') && $this->getUser()->company_id == $request->company_id)|| $this->getUser()->hasRole('super-admin')){
        
        if(!$this->getUser()->hasRole('super-admin') && ($request->role == 'super-admin')){
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
       
        $validatedData = $request->validate(User::$createRules);
// return $validatedData->except(['role']);
// return $validatedData;

        if($validatedData){
            $validatedData['password']=Hash::make($validatedData['password']);
           $user=User::create(collect($validatedData)->except(['role'])->toArray());
           $user->assignRole($request->role);
                return response()->json([
            'responseMessage' => 'User created',
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
        $user=User::find($id);
     
        // setPermissionsTeamId($this->getUser()->company_id);
         // User::find($id)->assignRole('super-admin');
         // setPermissionsTeamId($this->getUser()->company_id);
     
        if(!$user){
             return response()->json([
            'responseMessage' => 'User not found',
            'responseStatus'  => 404,
        ]);
        }
        // dd($this->getUser()->can('view-user'),  $userr);
            if(($this->getUser()->can('view-user') && $this->getUser()->company_id == $user->company_id) || $this->getUser()->hasRole('super-admin')){

                   if(!$this->getUser()->hasRole('super-admin') && $user->hasRole('super-admin')){
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
        return response()->json([
            'responseMessage' => $user,
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
         $user=User::find($id);
         // return $user;
        if(!$user){
             return response()->json([
            'responseMessage' => 'User not found',
            'responseStatus'  => 404,
        ]);
        } 

       if(($this->getUser()->can('edit-user') && $this->getUser()->company_id == $user->company_id) || $this->getUser()->hasRole('super-admin')){

                   if(!$this->getUser()->hasRole('super-admin') && $user->hasRole('super-admin')){
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }
$rule= ($user->email != $request->email) ? User::$createRules : User::$updateRules;

         $validatedData = $request->validate($rule);
         
        // $rules=User::$updateRules;
        // // $rules['email'] = $rules['email'];
        //    $validatedData = $request->validate($rules);
           if($validatedData){
            $validatedData['password']=Hash::make($validatedData['password']);
           $user->update(collect($validatedData)->except(['role'])->toArray());
           // return $request->role;
         $user->syncRoles($request->role);
           return response()->json([
            'responseMessage' => 'User updated',
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
        $user=User::find($id);
         // return $user;
        if(!$user){
             return response()->json([
            'responseMessage' => 'User not found',
            'responseStatus'  => 404,
        ]);
        } 

       if(($this->getUser()->can('delete-user')  && $this->getUser()->company_id == $user->company_id)|| $this->getUser()->hasRole('super-admin')){
     

                   if(!$this->getUser()->hasRole('super-admin') && $user->hasRole('super-admin')){
               return response()->json([
            'responseMessage' => 'Permission denied',
            'responseStatus'  => 403,
        ]);
        }

  
      $user->delete();
       return response()->json([
            'responseMessage' => 'User deleted',
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

   public function changePassword(Request $request)
    {
         $validatedData=$request->validate([
            'old_password'=>'required',
            'password'=>'required|string|min:8|confirmed',
            // 'confirm_password' => 'required|same:new_password',
        ]);
        
   $user=User::find($this->getUser()->id);
       if (Hash::check($request->old_password,$user->password)) {
      
        $user->password = Hash::make($request->input('password'));

        $user->save();
return response()->json([
            'responseMessage' => 'Your password has been updated',
            'responseStatus'  => 200,
        ]);
      

    } else {
        return response()->json([
            'responseMessage' => 'The current password you provided could not be verified',
            'responseStatus'  => 200,
        ]);
    
    }  
    }
      public function getUser(){
    return app('auth')->user();
    }

}

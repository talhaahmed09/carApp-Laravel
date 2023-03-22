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
    public function index(Request $request)
    {
        $perPage  = $request->size;
        $sortBy   = $request->sortBy?$request->sortBy:"first_name";
        $sort     = $request->sort?$request->sort:"ASC";
        if($this->getUser()->hasRole('super-admin')){
            $objData  = User::where('id', '!=',  1)->orderBy($sortBy, $sort)->paginate($perPage); // $request->all()$request->all()
        }else{
            $objData  = [
                'message' => "Permission denied"
            ];
        }
        return response()->json([
          "objData" => $objData
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   
    public function store(Request $request)
    {
        if(($this->getUser()->can('create-user') && $this->getUser()->company_id == $request->company_id) || $this->getUser()->hasRole('super-admin')){
            if(!$this->getUser()->hasRole('super-admin') && ($request->role == 'super-admin')){
                return response()->json([
                    "objData" => [
                        'message' => "Permission denied"
                    ]
                ], 403);
            }
       
            $validatedData = $request->validate(User::$createRules);

            if($validatedData){
                $validatedData['password'] = Hash::make($validatedData['password']);
                $user   = User::create(collect($validatedData)->except(['role'])->toArray());
                $user->assignRole($request->role);
                return response()->json([
                    "objData" => [
                        'message' => "User created"
                    ]
                ], 200);
            }
        }else{
            return response()->json([
                "error" => [
                    'message' => "Permission denied"
                ]
            ], 403);
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
     
        if(($this->getUser()->can('view-user') && $this->getUser()->company_id == $id) || $this->getUser()->hasRole('super-admin')){
            $objData = [
              "content" => User::find($id)
            ];
            if(!$objData["content"]){
              $objData    = [
                "message"=> "Company not found"
              ];
            } 
            return response()->json([
                "objData" => $objData
            ], 200);
          }else{
            return response()->json([
              "error" => [
                'message' => "Permission denied"
              ]
            ], 403);
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
                "error" => [
                    "message" => "User not found"
                ]
            ], 400);
        } 

        if(($this->getUser()->can('edit-user') && $this->getUser()->company_id == $user->company_id) || $this->getUser()->hasRole('super-admin')){

            if(!$this->getUser()->hasRole('super-admin') && $user->hasRole('super-admin')){
                return response()->json([
                    "error" => [
                        "message" => "Permission denied"
                    ]
                ], 401);
            }
            $rule           = User::$updateRules;
            $validatedData  = $request->validate($rule);
         
            if($validatedData){
                $user->update(collect($validatedData)->except(['role'])->toArray());
                $user->syncRoles($request->role);
                return response()->json([
                  "objData" => [
                    "message" => "User Updated"
                  ]
                ], 200);
            }

        }else{
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
        }else{
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

    public function getUser()
    {
        return app('auth')->user();
    }
    
    public function search(Request $request)
    {
        if(!$this->getUser()->hasRole('super-admin') && !$this->getUser()->can('list-user')){
            return response()->json([
            "objData" => [
                'message' => "Permission denied"
            ]
            ], 401);
        }
        $perPage    = $request->size;
        $sortBy     = $request->sortBy?$request->sortBy:"first_name";
        $sort       = $request->sort?$request->sort:"ASC";
        $query      = "%".$request["query"]."%";

        $objData  = User::where('salution',  'LIKE', $query)
            ->orWhere('title',        'LIKE', $query)
            ->orWhere('first_name',   'LIKE', $query)
            ->orWhere('last_name',    'LIKE', $query)
            ->orWhere('birthday',     'LIKE', $query)
            ->orWhere('homepage',     'LIKE', $query)
            ->orWhere('telephone',    'LIKE', $query)
            ->orWhere('mobile',       'LIKE', $query)
            ->orWhere('fax',          'LIKE', $query)
            ->orWhere('country',      'LIKE', $query)
            ->orWhere('city',         'LIKE', $query)
            ->orWhere('street_no',    'LIKE', $query)
            ->orWhere('email',        'LIKE', $query)
            ->orWhere('password',     'LIKE', $query)
            ->orWhere('mailbox',      'LIKE', $query)
            ->orderBy($sortBy, $sort)->paginate($perPage);
        return response()->json([
            "objData" => $objData
        ], 200);
    }
}

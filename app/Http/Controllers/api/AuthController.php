<?php
namespace App\Http\Controllers\api;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Models\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;
use App\Mail\ResetMail;
use Illuminate\Support\Facades\Mail;
use Hash;

use Illuminate\Support\Facades\Password;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
class AuthController extends Controller 
{
public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(){ 
        // return $user = Auth::guard('api')->user();
        // return Auth::guard('api');
        config(['auth.guards.api.driver' => 'session']);
        if(Auth::guard('api')->attempt(['email' => request('email'), 'password' => request('password')])){ 
            // $user = Auth::user(); 
             $user = Auth::guard('api')->user();
              $success['token'] = auth()->guard('api')->user()
               ->createToken('authToken')->accessToken;
            // $success['token'] =  $user->createToken('MyApp')->accessToken; 
            $success['user']= $user;
             // $accessToken = $user->createToken('authToken')->accessToken;
            return response()->json(['success' => $success], $this->successStatus); 
        }else{ 
            return response()->json([
                "error" => [
                    'message' => "Invalid Credential"
                ]
            ], 401);
        } 
    }
    /** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    {
        $validator = Validator::make($request->all(), [ 
            'first_name'    => 'required', 
            'last_name'     => 'required', 
            'email'         => 'required|email', 
            'password'      => 'required', 
            'c_password'    => 'required|same:password', 
        ]);
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        unset($request["c_password"]);
        $input = $request->all(); 
                $input['password'] = bcrypt($input['password']); 
                $user = User::create($input); 
                $success['token'] =  $user->createToken('MyApp')->accessToken; 
                $success['name'] =  $user->name;
        return response()->json(['success'=>$success], $this->successStatus); 
    }
    /** 
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function details() 
    { 
        $user = Auth::user(); 
        return response()->json(['success' => $user], $this->successStatus); 
    } 
        public function logout()
    { 
   // dd(Auth::user());
           if (Auth::check()) {

       Auth::user()->token()->revoke();
        return response()->json(['message'=>'Logout Successfully']);
    }
    else{
            return response()->json(['error'=>'Unable to Logout'], 401);
        }
    }


    //
    //    public function forgotPassword(Request $request)
    // {
        
    //     $reset = $request->email;

    //     if($user = User::where('email','=',$reset)->first()){


    //             $data = [

    //                 // 'verify'=>route('reset-email.show',$user->verify),
    //                 'name' =>$user->name,

    //             ];
    //             // Mail::to($reset)->send(new ResetMail($data));
               
    //             return $request->wantsJson()
    //                 ? response()->json(['status'=>'check your Email'])
    //                 : redirect()->back()->with('status','Reset link Successfully Send Please Check your Email');


    //     }
    //     else{
            
    //                  return $request->wantsJson()
    //                 ? response()->json(['status'=>'Invalid Email Address'])
    //                 : redirect()->back()->with('msg','Invalid Email Address');

    //     }
    // }
public function forgotPassword(Request $request)
{
      $request->validate(['email' => 'required|email']);
 
    $status = Password::sendResetLink(
        $request->only('email')
    );
 return $status;
    return $status === Password::RESET_LINK_SENT
                ? back()->with(['status' => __($status)])
                : back()->withErrors(['email' => __($status)]);
            }
//     $input = $request->all();
//     $rules = array(
//         'email' => "required|email",
//     );
//     $validator = Validator::make($input, $rules);
//     if ($validator->fails()) {
//         $arr = array("status" => 400, "message" => $validator->errors()->first(), "data" => array());
//     } else {
//         try {
//             $response = \Password::sendResetLink($request->only('email'), function (Message $message) {

//                 $message->subject($this->getEmailSubject());
//             });
//             return $response;
//             switch ($response) {
//                 case \Password::RESET_LINK_SENT:
//                     return \Response::json(array("status" => 200, "message" => trans($response), "data" => array()));
//                 case \Password::INVALID_USER:
//                     return \Response::json(array("status" => 400, "message" => trans($response), "data" => array()));
//             }
//         } catch (\Swift_TransportException $ex) {
//             $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
//         } catch (Exception $ex) {
//             $arr = array("status" => 400, "message" => $ex->getMessage(), "data" => []);
//         }
//     }
//     return \Response::json($arr);
// }

}
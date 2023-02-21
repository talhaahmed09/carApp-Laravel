<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::get('hello',  function () {
    return "qwerty";
});
Route::post('login',  [AuthController::class,'login']);
Route::post('register', [AuthController::class,'register']);
Route::group(['middleware' => 'auth:api'], function(){
// Route::post('details', 'a\AuthController@details');
Route::post('logout', [AuthController::class, 'logout']);
Route::apiResource('company', 'App\Http\Controllers\api\CompanyController');
Route::apiResource('company-profile', 'App\Http\Controllers\api\CompanyProfileController');
Route::apiResource('user', 'App\Http\Controllers\api\UserController');
Route::apiResource('vehicle', 'App\Http\Controllers\api\VehicleController');
Route::apiResource('address', 'App\Http\Controllers\api\AddressController');
Route::apiResource('file', 'App\Http\Controllers\api\FileController');

Route::put('update-password', [App\Http\Controllers\api\UserController::class, 'changePassword'])->name('update-password');
Route::post('assign-permission',[App\Http\Controllers\api\RoleAndPermissionController::class, 'assignPermission']);
Route::get('get-permissions-by-role',[App\Http\Controllers\api\RoleAndPermissionController::class, 'getPermissionsByRole']);

Route::apiResource('question-type', 'App\Http\Controllers\api\QuestionTypeController');
Route::apiResource('question', 'App\Http\Controllers\api\QuestionController');
});

Route::post('forgot-password',[AuthController::class, 'forgotPassword']);

Route::group(['middleware' => ['role:super-admin']], function(){


});
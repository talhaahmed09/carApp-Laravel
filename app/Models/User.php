<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Sanctum\HasApiTokens;
use Laravel\Passport\HasApiTokens;

use Spatie\Permission\Traits\HasRoles;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    // protected $fillable = [
    //     'name',
    //     'email',
    //     'password',
    // ];
         protected $guard_name = 'api';
 // protected $guard = 'api';
 protected $appends = [
        // 
        // 'profilelink',
        // 'avatarlink',
        // 'isme',
    'myRole',
    // 'myPermissions',
    ];
    public static $createRules = [
        // 'title' => 'required',
        'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        'birthday' => 'required',
        'email' => 'required|email|unique:users',
        'mobile' => 'required',
         'country' => 'required',
        'city' => 'required',
        'role' => 'required',
        'company_id' => 'required',
        'password' => 'required|string|min:8|confirmed',
        'salutation'=>'sometimes',
        'title'=>'sometimes',
        'homepage'=>'sometimes',
        'is_active'=>'sometimes',
        'telephone'=>'sometimes',
        'fax'=>'sometimes',
        'street_no'=>'sometimes',
        'mailbox'=>'sometimes',

    ];
     public static $updateRules = [
        // 'title' => 'required',
        'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        'birthday' => 'required',
           'email' => 'required|email',
        'mobile' => 'required',
         'country' => 'required',
        'city' => 'required',
        'role' => 'required',
        'company_id' => 'required',
        'password' => 'required|string|min:8|confirmed',
        'salutation'=>'sometimes',
        'title'=>'sometimes',
        'homepage'=>'sometimes',
        'is_active'=>'sometimes',
        'telephone'=>'sometimes',
        'fax'=>'sometimes',
        'street_no'=>'sometimes',
        'mailbox'=>'sometimes',
    ];
      protected $guarded=[];
 
          public function getMyroleAttribute()
    {
        // $res            = [];
        // $allPermissions = $this->getAllPermissions();
        // foreach($allPermissions as $p)
        // {
        //     $res[] = $p->name;
        // }
$roles = $this->roles()->pluck('name');
        return $roles;
    }
      public function getMypermissionsAttribute()
    {
        $res            = [];
        $allPermissions = $this->getAllPermissions();
        foreach($allPermissions as $p)
        {
            $res[] = $p->name;
         
        }
     return $res;
      
    }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // public function setPasswordAttribute($password)
    // {
    //    if(!empty($password)){
    //     $this->attributes['password']=bcrypt($password);
    //    }
    // }
}
// cmdds
//php artisan db:seed
//php artisan migrate:fresh --seed
//php artisan make:seeder RolePermissionSeeder
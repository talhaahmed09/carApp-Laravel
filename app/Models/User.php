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
        // 'required'
        'salutation'    => 'required',
        'title'         => 'required',
        'first_name'    => 'required|string|max:255',
        'last_name'     => 'required|string|max:255',
        'password'      => 'required|string|min:8|confirmed',
        'email'         => 'required|email|unique:users',
        'country'       => 'required',
        'mobile'        => 'required',
        'zipcode'       => 'required',
        'city'          => 'required',
        'street_no'     => 'required',
        // 'sometimes'
        'birthday'      => 'sometimes',
        'role'          => 'sometimes',
        'company_id'    => 'sometimes',
        'homepage'      => 'sometimes',
        'is_active'     => 'sometimes',
        'telephone'     => 'sometimes',
        'fax'           => 'sometimes',
        'mailbox'       => 'sometimes',
    ];
     public static $updateRules = [
        // 'required'
        'salutation'    => 'required',
        'title'         => 'required',
        'first_name'    => 'required|string|max:255',
        'last_name'     => 'required|string|max:255',
        'password'      => 'required|string|min:8|confirmed',
        'email'         => 'required|email|unique:users',
        'country'       => 'required',
        'mobile'        => 'required',
        'zipcode'       => 'required',
        'city'          => 'required',
        'street_no'     => 'required',
        // 'sometimes'
        'birthday'      => 'sometimes',
        'role'          => 'sometimes',
        'company_id'    => 'sometimes',
        'homepage'      => 'sometimes',
        'is_active'     => 'sometimes',
        'telephone'     => 'sometimes',
        'fax'           => 'sometimes',
        'mailbox'       => 'sometimes',
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
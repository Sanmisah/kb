<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;  
use App\Models\User;
use Carbon\Carbon;

class UserLogin extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = ['id'];


   
    public function User()
    {
          return $this->belongsTo(User::class, 'id');
    }

    public function getLoggedOutAttribute($value)
    {
        return $value != null  ? Carbon::parse($value)->format('d/m/Y h:i a') : null;
    }

    public function getLoggedInAttribute($value)
    {
        return $value != null  ? Carbon::parse($value)->format('d/m/Y h:i a') : null;
    }

   

   
}

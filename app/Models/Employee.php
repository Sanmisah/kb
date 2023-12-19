<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;
use App\Models\Designation;
use App\Models\User;
use Carbon\Carbon;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Employee extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'first_name',
        'middle_name',
        'last_name',
        'email',
        'contact_no',
        'address_line_1',
        'address_line_2',
        'department_id',
        'designation_id',
        'date_of_joining',
        'country',
        'state',
        'city',
        'pincode',
        'dob'
    ];
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['first_name','middle_name','last_name','email','contact_no','address_line_1','address_line_2','department_id','designation_id','date_of_joining','country','state','city','pincode','dob']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public function Users() 
    {
        return $this->hasOne(User::class, 'id');
    }

    public function UserLogins()
    {
        return $this->hasMany(UserLogin::class, 'user_id');
    }

    public function LastLogin(){
        return $this->hasOne(UserLogin::class, 'user_id')->latestofMany();
    }
       
    


    public function Department() 
    {
        return $this->belongsTo(Department::class);
    }

    public function Designation() 
    {
        return $this->belongsTo(Designation::class);
    }

    public function setDobAttribute($value)
    {
        $this->attributes['dob'] = $value != null  ? Carbon::createFromFormat('d/m/Y', $value) : null;
    }

    public function getDobAttribute($value)
    {
        return $value != null  ? Carbon::parse($value)->format('d/m/Y') : null;
    }

    public function setDateOfJoiningAttribute($value)
    {
        $this->attributes['date_of_joining'] = $value != null  ? Carbon::createFromFormat('d/m/Y', $value) : null;
    }

    public function getDateOfJoiningAttribute($value)
    {
        return $value != null  ? Carbon::parse($value)->format('d/m/Y') : null;
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('first_name', 'like', '%'.$search.'%')
                        ->orWhere('last_name', 'like', '%'.$search.'%')
                        ->orWhere('middle_name', 'like', '%'.$search.'%')
                        ->orWhere('email', 'like', '%'.$search.'%')
                        ->orWhere('contact_no', 'like', '%'.$search.'%')
                        ->orWhereRelation('Designation', 'designation_name', 'like', '%'.$search.'%')
                        ->orWhereRelation('Department', 'department_name', 'like', '%'.$search.'%');
            });
        });
    }
}

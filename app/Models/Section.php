<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Section extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'section_name',
        'department_id'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['section_name','department_id']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('section_name', 'like', '%'.$search.'%')
                      ->orWhereRelation('Department', 'department_name', 'like', '%'.$search.'%');
            });
        });
    }

    public function Department() 
    {
        return $this->belongsTo(Department::class, 'department_id');
    }
}

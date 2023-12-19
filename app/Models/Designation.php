<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Designation extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'designation_name'
    ];
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['designation_name']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;
    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('designation_name', 'like', '%'.$search.'%');
            });
        });
    }
}

<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class EmployeeInductionDetail extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'induction_id',
        'quiz_id',
        'answer',
        'check'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['induction_id','quiz_id','answer','check']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;
}

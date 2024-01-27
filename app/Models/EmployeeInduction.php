<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Models\EmployeeInductionDetail;

class EmployeeInduction extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'induction_id',       
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['induction_id']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public function EmployeeInductionDetails()
    {
        return $this->hasMany(EmployeeInductionDetail::class);
    }
}

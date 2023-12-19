<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Quiz;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class QuizDetail extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'quiz_id',
        'answer',
        'isCorrect',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['quiz_id','answer','isCorrect']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public function Quiz() 
    {
        return $this->belongsTo(Quiz::class);
    }
}

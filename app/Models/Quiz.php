<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Induction;
use App\Models\QuizDetail;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Quiz extends Model
{
    use HasFactory, CreatedUpdatedBy, LogsActivity;
    protected $fillable = [
        'question',
        'induction_id',
        'type',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['question','induction_id','type']);
        // Chain fluent methods for configuration options
    }
    protected static $logOnlyDirty = true;

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('question', 'like', '%'.$search.'%')
                    ->orWhereRelation('Induction', 'induction_name', 'like', '%'.$search.'%');
            });
        });
    }
    public function Induction() 
    {
        return $this->belongsTo(Induction::class);
    }
    public function QuizDetails()
    {
        return $this->hasMany(QuizDetail::class);
    }
}

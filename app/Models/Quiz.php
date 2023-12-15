<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Induction;
use App\Models\QuizDetail;

class Quiz extends Model
{
    use HasFactory, CreatedUpdatedBy;
    protected $fillable = [
        'question',
        'induction_id',
        'type',
    ];
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

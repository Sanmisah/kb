<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory, CreatedUpdatedBy;
    protected $fillable = [
        'question',
        'choice_1',
        'choice_2',
        'choice_3',
        'choice_4',
        'answer',
        'type',
    ];
    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('question', 'like', '%'.$search.'%')
                        ->orWhere('choice_1', 'like', '%'.$search.'%')
                        ->orWhere('choice_2', 'like', '%'.$search.'%')
                        ->orWhere('choice_3', 'like', '%'.$search.'%')
                        ->orWhere('choice_4', 'like', '%'.$search.'%')
                        ->orWhere('answer', 'like', '%'.$search.'%')
                        ->orWhere('type', 'like', '%'.$search.'%');
            });
        });
    }
}

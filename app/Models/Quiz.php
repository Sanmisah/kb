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
        'answer_1',
        'answer_2',
        'answer_3',
        'answer_4',
        'type',
    ];
    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->where('question', 'like', '%'.$search.'%')
                        ->orWhere('answer_1', 'like', '%'.$search.'%')
                        ->orWhere('answer_2', 'like', '%'.$search.'%')
                        ->orWhere('answer_3', 'like', '%'.$search.'%')
                        ->orWhere('answer_4', 'like', '%'.$search.'%')
                        ->orWhere('type', 'like', '%'.$search.'%');
            });
        });
    }
}

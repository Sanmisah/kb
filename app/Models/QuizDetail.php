<?php

namespace App\Models;
use App\Traits\CreatedUpdatedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Quiz;

class QuizDetail extends Model
{
    use HasFactory, CreatedUpdatedBy;
    protected $fillable = [
        'quiz_id',
        'answer',
        'isCorrect',
    ];
    public function Quiz() 
    {
        return $this->belongsTo(Quiz::class);
    }
}

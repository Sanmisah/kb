<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Models\Quiz;
use App\Models\QuizDetail;
use App\Models\Induction;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Auth;

class QuizController extends Controller
{
    public function index()
    {
        return Inertia::render('Quiz/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('quiz.create'),
            'quiz' => Quiz::with(['Induction'])
                ->filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($quiz) => [
                    'id' => $quiz->id,
                    'question' => $quiz->question,                    
                    'type' => $quiz->type,
                    'induction_name' => @$quiz->induction->induction_name,
                    'canEdit' => Auth::user()->can('quiz.edit', $quiz),
                    'delete' => Auth::user()->can('quiz.destroy', $quiz)
                ]),
        ]);
    }

    public function create()
    {
        $inductions = Induction::pluck('induction_name', 'id');
        return Inertia::render('Quiz/Create',compact('inductions'));
    }

    public function store()
    {
        Request::validate([
            'question' => 'required',
            'type' => 'required',            
        ]);

        $quiz =  Quiz::create(Request::all());        
        $data = Request::collect('quiz_details');
        // dd($data);
        foreach($data as $record){
            QuizDetail::create([
                'quiz_id' => $quiz->id,
                'answer' => $record['answer'],
                'isCorrect' => $record['isCorrect'],
            ]);            
        }  
        return to_route('quiz.index');
    }

    public function edit(Quiz $quiz): Response
    {
        $inductions = Induction::pluck('induction_name', 'id');
        $quiz->load('QuizDetails');
        return Inertia::render('Quiz/Edit', [
            'quiz' => $quiz,
            'inductions' => $inductions,
        ]);
    }

    public function update(Quiz $quiz)
    {
        Request::validate([
            'question' => 'required',
            'type' => 'required',  
        ]);
        $quiz->update(Request::all());  

        $data = Request::collect('quiz_details');    
        // dd($data);   
        foreach($data as $record){
            
            QuizDetail::updateOrInsert([ 'id'=>$record['id'] ? $record['id'] : null],[
                'quiz_id' => $quiz->id,
                'answer' => $record['answer'],
                'isCorrect' => $record['isCorrect'],
            ]);   
        }         
        return to_route('quiz.index');
    }

    public function destroy(Quiz $quiz)
    {
        $quiz->delete();
        return to_route('quiz.index');
    }
}

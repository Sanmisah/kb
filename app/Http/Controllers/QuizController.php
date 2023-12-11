<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Models\Quiz;
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
                    'answer_1' => $quiz->answer_1,
                    'answer_2' => $quiz->answer_2,
                    'answer_3' => $quiz->answer_3,
                    'answer_4' => $quiz->answer_4,
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
        Quiz::create(Request::all());
        return to_route('quiz.index');
    }

    public function edit(Quiz $quiz): Response
    {
        $inductions = Induction::pluck('induction_name', 'id');
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
        $quiz->fill(Request::all());    
        $quiz->update();
        return to_route('quiz.index');
    }

    public function destroy(Quiz $quiz)
    {
        $quiz->delete();
        return to_route('quiz.index');
    }
}

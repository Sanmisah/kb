<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use App\Models\Article;
use App\Models\Induction;
use App\Models\Quiz;
use App\Models\Section;
use App\Models\Notice;
use App\Models\Employee;
use App\Models\QuizDetail;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Request;
use Illuminate\Http\RedirectResponse;
// use Redirect; 
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class EmployeeDashboardController extends Controller
{
    public function index()
    {
        $notices = Notice::filter(Request::only('search'))
                            ->orderBy('id', 'desc')
                            ->paginate(10)
                            ->withQueryString()
                            ->through(fn ($notice) => [
                                'id' => $notice->id,
                                'sr_no' => $notice->sr_no,
                                'notice_date' => $notice->notice_date,
                                'notice' => $notice->notice,
                                'description' => $notice->description]);
        // $media = Media::getMedia('attachment');
        // dd($media);
        return Inertia::render('Employee-Dashboard',[
            'notices' => $notices,
        ]);
    }

    public function store()
    {
        $input = Request::all();
        // answer check
        if($input['multiple_choice_answer']){
            $input['answer'] = $input['multiple_choice_answer'];
        }else{
            $input['answer'] = $input['single_choice_answer'];
        }
        
        // isCorrect check
        if($input['answer'] == $input['quiz_answer']){
            $input['isCorrect'] = true;
        }else{
            $input['isCorrect'] = false;
        }        
        QuizDetail::create($input);

        //redirection path for submitting quiz
        if($input['current_page'] === $input['last_page']){
            return to_route('induction')->with('success','You are successfully submitted quiz');
        }else{
            return redirect($input['next_page_url']);
        }
    }

    public function show()
    {
        $employee = Employee::find(auth()->user()->id);
        $sections = Section::where('department_id', $employee->department_id)->get();
        $articles = Article::with(['Section'])
                            ->whereRelation('Section', 'department_id', $employee->department_id)
                            ->orderBy('id', 'desc')->get();

        return Inertia::render('Article',[
            'articles' => $articles,
            'sections' => $sections
        ]);
    }

    public function edit(Article $article): Response
    {
        $article->load(['Section']);
        $video = $article->getFirstMediaUrl('video_attachment');    
        $file_1 = $article->getFirstMedia('file_attachment_1');
        $file_2 = $article->getFirstMedia('file_attachment_2');
        $file_3 = $article->getFirstMedia('file_attachment_3'); 
        return Inertia::render('Article-Detail', [
            'article' => $article,
            'video' => $video,
            'file_1' => $file_1,
            'file_2' => $file_2,
            'file_3' => $file_3,
        ]);
    }

    public function contacts()
    {       
        return Inertia::render('Contacts', [
            'filters' => Request::all('search'),
            'employees' => Employee::whereNot('id', auth()->user()->id)->with(['Department', 'Designation', 'Users', 'LastLogin'])
                ->filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($employee) => [
                    'id' => $employee->id,
                    'first_name' => $employee->first_name,
                    'middle_name' => $employee->middle_name,
                    'last_name' => $employee->last_name,
                    'email' => $employee->email,
                    'contact_no' => $employee->contact_no,
                    'designation_name' => @$employee->designation->designation_name,
                    'department_name' => @$employee->department->department_name,
                ]),
        ]);
    }

    public function notices()
    {  
        return Inertia::render('Notice', [
            'filters' => Request::only('search'),
            'notices' => Notice::filter(Request::only('search'))
                                ->orderBy('id', 'desc')
                                ->paginate(10)
                                ->withQueryString()
                                ->through(fn ($notice) => [
                                    'id' => $notice->id,
                                    'sr_no' => $notice->sr_no,
                                    'notice_date' => $notice->notice_date,
                                    'notice' => $notice->notice,
                                    'description' => $notice->description]),
        ]);
    }

    public function view(Notice $notice)
    {
        $file_1 = $notice->getFirstMedia('attachment');
        return response()->file('public/media/'.$file_1->id.'/'.$file_1->file_name);
    }

    public function induction()
    {
        return Inertia::render('Induction', [
            'filters' => Request::all('search'),
            'inductions' => Induction::filter(Request::only('search'))
                ->with(['Department'])
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($induction) => [
                    'id' => $induction->id,
                    'induction_name' => $induction->induction_name,
                    'created_at' => $induction->created_at,
                    'department' => @$induction->department->department_name,
                ]),
        ]);
    }

    public function quiz(Induction $induction)
    {
        return Inertia::render('Quiz', [
            'quiz' => Quiz::with(['Induction'])
                ->where('induction_id', $induction->id)
                ->orderBy('id', 'asc')
                ->paginate(1)
                ->withQueryString()
                ->through(fn ($quiz) => [
                    'id' => $quiz->id,
                    'question' => $quiz->question,
                    'choice_1' => $quiz->choice_1,
                    'choice_2' => $quiz->choice_2,
                    'choice_3' => $quiz->choice_3,
                    'choice_4' => $quiz->choice_4,
                    'answer' => $quiz->answer,
                    'induction_id' =>  $induction->id,
                    'type' => $quiz->type,
                ]),
        ]);
    }

}

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
use App\Models\EmployeeInductionDetail;
use App\Models\EmployeeInduction;
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
                            ->paginate(5)
                            ->withQueryString()
                            ->through(fn ($notice) => [
                                'id' => $notice->id,
                                'sr_no' => $notice->sr_no,
                                'notice_date' => $notice->notice_date,
                                'notice' => $notice->notice,
                                'description' => $notice->description]);
        return Inertia::render('Employee-Dashboard',[
            'notices' => $notices,
        ]);
    }

    public function store()
    {                  
        $input = Request::all();
        dd($input);
        $induction_id = $input['induction_id'];  

        $employee_induction = EmployeeInduction::create($input); 
        // dd($employee_induction);
 
        $data = Request::collect('employee_induction_details');
        foreach($data as $record){
            QuizDetail::create([
                'employee_induction_id' => $employee_induction->id,
                'quiz_id' => $record['quiz_id'],
                'answer' => $record['answer'],
                'check' => $record['check'],
            ]);            
        }        
        // if($input['last_quiz_id'] == $input['quiz_id']){
        //     return to_route('induction')->with('success','You are successfully submitted quiz');
        // }else {
        //     return to_route("/induction/$induction_id");
        // }
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

    public function article_list(Section $section)
    {
        $articles = Article::with(['Section'])
                            ->where('section_id', $section->id)
                            ->orderBy('id', 'desc')->get();
        // dd($articles);                    
        return Inertia::render('Articles',[
            'articles' => $articles,
        ]);

        // $articles = Article::filter(Request::only('search'))
        //                     ->with(['Section'])
        //                     ->where('section_id', $section->id)
        //                     ->orderBy('id', 'desc')
        //                     ->paginate(5)
        //                     ->withQueryString()
        //                     ->through(fn ($article) => [
        //                         'id' => $article->id,
        //                         'topic' => $article->topic,                               
        //                         'description' => $article->description]);
        // return Inertia::render('Articles',[
        //     'articles' => $articles,
        // ]);
    }    

    public function sections()
    {
        $section = Section::orderBy('id', 'desc')->get();     
        return Inertia::render('Components/DashboardLink1.vue', [           
            'section' => $section
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
            'notices' => Notice::filter(Request::only('search'))
            ->orderBy('id', 'desc')
            ->paginate(15)
            ->withQueryString()
            ->through(fn ($notice) => [
                'id' => $notice->id,
                'sr_no' => $notice->sr_no,
                'notice_date' => $notice->notice_date,
                'notice' => $notice->notice,
                'description' => $notice->description
            ]),
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
        $quiz = Quiz::with(['Induction', 'QuizDetails'])
                    ->where('induction_id', $induction->id)
                    ->orderBy('id', 'asc')
                    ->get();
        $last_id = Quiz::select('id','induction_id')
                        ->where('induction_id', $induction->id) 
                        ->orderBy('id', 'desc')  
                        ->limit(1)
                        ->get(); 
        return Inertia::render('Quiz',[
            'quiz' => $quiz,  
            'last_id' => $last_id,
        ]);        
    }
}

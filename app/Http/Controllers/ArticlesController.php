<?php

namespace App\Http\Controllers;
use App\Models\Article;
use App\Models\Section;
use App\Models\View;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Auth;

class ArticlesController extends Controller
{
    public function index()
    {
        return Inertia::render('Articles/Index', [
            'can' => Auth::user()->can('articles.create'),
            'filters' => Request::all('search'),
            'articles' => Article::filter(Request::only('search'))
                ->with(['Section'])
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($article) => [
                    'id' => $article->id,
                    'topic' => $article->topic,
                    'description' => $article->description,
                    'section' => $article->Section->section_name,
                    'video_attachment' => $article->video_attachment,
                    'file_attachment_1' => $article->file_attachment_1,
                    'file_attachment_2' => $article->file_attachment_2,
                    'file_attachment_3' => $article->file_attachment_3,
                    'canEdit' => Auth::user()->can('articles.edit', $article),
                    'delete' => Auth::user()->can('articles.destroy', $article)
                ]),
        ]);
    }

    public function create()
    {
        $sections = Section::pluck('section_name', 'id');
        return Inertia::render('Articles/Create',compact('sections'));
    }

    public function store()
    {     
        $input = Request::all();       
        Request::validate([
            'topic' => 'required',
            'section_id' => 'required',
            'video_attachment' => 'mimes:mp4|max:10000'
        ]);       
        $article = Article::create($input);
        if(Request::hasFile('video_attachment') && Request::file('video_attachment')->isValid()){
            $article->addMediaFromRequest('video_attachment')->toMediaCollection('video_attachment');
        }
        if(Request::hasFile('file_attachment_1') && Request::file('file_attachment_1')->isValid()){
            $article->addMediaFromRequest('file_attachment_1')->toMediaCollection('file_attachment_1');
        }   
        if(Request::hasFile('file_attachment_2') && Request::file('file_attachment_2')->isValid()){
            $article->addMediaFromRequest('file_attachment_2')->toMediaCollection('file_attachment_2');
        }  
        if(Request::hasFile('file_attachment_3') && Request::file('file_attachment_3')->isValid()){
            $article->addMediaFromRequest('file_attachment_3')->toMediaCollection('file_attachment_3');
        }   
        // if(Request::hasFile('video_attachment')){

        //     $file = Request::file('video_attachment');
        //     $filename = $file->getClientOriginalName();
        //     $path = public_path().'/media/';
        //     return $file->move($path, $filename);
        // }
        return to_route('articles.index');
    }

    public function edit(Article $article): Response
    {
        $sections = Section::pluck('section_name', 'id'); 
        $video = $article->getFirstMedia('video_attachment');          
        $file_1 = $article->getFirstMedia('file_attachment_1');
        $file_2 = $article->getFirstMedia('file_attachment_2');
        $file_3 = $article->getFirstMedia('file_attachment_3');  
        return Inertia::render('Articles/Edit', [
            'article' => $article,
            'sections' => $sections,
            'video' => $video,
            'file_1' => $file_1,
            'file_2' => $file_2,
            'file_3' => $file_3,
        ]);
    }

    public function update(Article $article)
    {       
        Request::validate([
            'section_id' => 'required',
            'topic' => 'required',
        ]);
        $article->fill(Request::all()); 
        $article->update(); 
        if(Request::hasFile('video_attachment') && Request::file('video_attachment')->isValid()){
            $article->addMediaFromRequest('video_attachment')->toMediaCollection('video_attachment');
        } 
        if(Request::hasFile('file_attachment_1') && Request::file('file_attachment_1')->isValid()){
            $article->clearMediaCollection('file_attachment_1');
            $article->addMediaFromRequest('file_attachment_1')->toMediaCollection('file_attachment_1');
        } 
        if(Request::hasFile('file_attachment_2') && Request::file('file_attachment_2')->isValid()){
            $article->clearMediaCollection('file_attachment_2');
            $article->addMediaFromRequest('file_attachment_2')->toMediaCollection('file_attachment_2');
        }  
        if(Request::hasFile('file_attachment_3') && Request::file('file_attachment_3')->isValid()){
            $article->clearMediaCollection('file_attachment_3');
            $article->addMediaFromRequest('file_attachment_3')->toMediaCollection('file_attachment_3');
        }   
        return to_route('articles.index');
    }

    public function destroy(Article $article)
    {
        $article->delete();
        return to_route('articles.index');
    }

    public function timing(Request $request)
    {
        $input = Request::all();

        if($input['start'] == true){
            View::create([
                'user_id'=> auth()->user()->id,
                'article_id'=>$input['article_id'],
                    'timing'=>$input['timing'],
                    'current_time'=>$input['current_time'],
            ]);

        } 
       
        $view = View::where('article_id', $input['article_id'])->where('user_id', auth()->user()->id)->orderBy('id', 'DESC')->first();
       
        if(empty($view)){
            View::create([
                'user_id'=> auth()->user()->id,
                'article_id'=>$input['article_id'],
                    'timing'=>$input['timing'],
                    'current_time'=>$input['current_time'],
            ]);
        } else {
            $view->fill([
                'timing'=>$input['timing'],
                    'current_time'=>$input['current_time'],
            ]); 
            $view->update();
        }
    }

}

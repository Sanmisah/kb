<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use App\Models\Article;
use App\Models\Section;
use App\Models\Notice;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Request;
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
        // $media = Media::getMedia('attachment');
        // dd($media);
        return Inertia::render('Employee-Dashboard',[
            'notices' => $notices,
        ]);

        
    }
    public function show()
    {
        $sections = Section::all();
        $articles = Article::with(['Section'])
                            ->orderBy('id', 'desc')->get();
        return Inertia::render('Article',[
            'articles' => $articles,
            'sections' => $sections
        ]);
    }

    public function edit(Article $article): Response
    {
        $article->load(['Section']);
        $video = $article->getFirstMedia('video_attachment');          
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

    public function destroy(Notice $notice)
    {
        dd($notice);
    }
}

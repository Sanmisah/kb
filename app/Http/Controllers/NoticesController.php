<?php

namespace App\Http\Controllers;
use App\Models\Notice;
use App\Models\Department;
use App\Models\Designation;
use Inertia\Inertia;
use Inertia\Response;
use App\Exports\ClientExport;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Auth;
use Excel;

class NoticesController extends Controller
{
    public function index()
    {
        return Inertia::render('Notices/Index', [
            'can' => Auth::user()->can('notices.create'),
            'filters' => Request::all('search'),
            'notices' => Notice::filter(Request::only('search'))
                ->with(['Designation', 'Department'])
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($notice) => [
                    'id' => $notice->id,
                    'sr_no' => $notice->sr_no,
                    'notice_date' => $notice->notice_date,
                    'notice' => $notice->notice,
                    'department' => @$notice->department->department_name,
                    'designation' => @$notice->designation->designation_name,
                    'attachment' => $notice->attachment,
                    'description' => $notice->description,
                    'canEdit' => Auth::user()->can('notices.edit', $notice),
                    'delete' => Auth::user()->can('notices.destroy', $notice)
                ]),
        ]);
    }

    public function create()
    {
        $departments = Department::pluck('department_name', 'id');
        $designations = Designation::pluck('designation_name', 'id');
        return Inertia::render('Notices/Create',compact('departments', 'designations'));
    }

    public function store()
    {     
        $input = Request::all();     
        // dd($input);  
        Request::validate([
            'notice_date' => 'required',
            'notice' => 'required',
            'department_id' => 'required',
            'designation_id' => 'required',
            'attachment' => 'required',
        ]);
       
        $notice = Notice::create($input);
        if(Request::hasFile('attachment') && Request::file('attachment')->isValid()){
            $notice->addMediaFromRequest('attachment')->toMediaCollection('attachment');
        }

        return to_route('notices.index');
    }

    public function edit(Notice $notice): Response
    {
        $departments = Department::pluck('department_name', 'id');        
        $designations = Designation::pluck('designation_name', 'id');   
        $mediaItems = $notice->getFirstMedia('attachment');  
        return Inertia::render('Notices/Edit', [
            'notice' => $notice,
            'departments' => $departments,
            'designations' => $designations,
            'mediaItems' => $mediaItems
        ]);
    }

    public function update(Notice $notice, Request $request)
    {
        
        Request::validate([
            'notice_date' => 'required',
            'notice' => 'required',
            'department_id' => 'required',
            'designation_id' => 'required',
            'description' => 'required',
        ]);
        $notice->update(Request::all());  
        if(Request::hasFile('attachment') && Request::file('attachment')->isValid()){
            $notice->clearMediaCollection('attachment');
            $notice->addMediaFromRequest('attachment')->toMediaCollection('attachment');
        }
        return to_route('notices.index');
    }

    public function destroy(Notice $notice)
    {
        $notice->delete();
        return to_route('notices.index');
    }

    public function export(){
        return Excel::download(new ClientExport(), 'excel.xlsx');   
    }
}

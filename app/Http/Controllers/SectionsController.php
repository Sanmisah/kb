<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Models\Section;
use App\Models\Department;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Auth;

class SectionsController extends Controller
{
    public function index()
    {
        return Inertia::render('Sections/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('sections.create'),
            'sections' => Section::with(['Department'])
                ->filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($section) => [
                    'id' => $section->id,
                    'section_name' => $section->section_name,
                    'department_name' => @$section->department->department_name,
                    'canEdit' => Auth::user()->can('sections.edit', $section),
                    'delete' => Auth::user()->can('sections.destroy', $section)
                ]),
        ]);
    }

    public function create()
    {
        $departments = Department::pluck('department_name', 'id');
        return Inertia::render('Sections/Create',compact('departments'));
    }

    public function store()
    {
        Request::validate([
            'section_name' => 'required|unique:sections,section_name',
            'department_id' => 'required',
            ],
            [
            'department_id.required' => 'Please Select Department',
            ],
        );
        // dd(Request::all());
        Section::create(Request::all());
        return to_route('sections.index');
    }

    public function edit(Section $section): Response
    {
        $departments = Department::pluck('department_name', 'id');
        return Inertia::render('Sections/Edit', [
            'section' => $section,
            'departments' => $departments
        ]);
    }

    public function update(Section $section)
    {
        Request::validate([
            'section_name' => 'required|unique:sections,section_name,'.$section->id,
            'department_id' => 'required',
        ],
        [
            'department_id.required' => 'Please Select Department',
        ]);
        $section->fill(Request::all());    
        $section->update();
        return to_route('sections.index');
    }

    public function destroy(Section $section)
    {
        $section->delete();
        return to_route('sections.index');
    }
}

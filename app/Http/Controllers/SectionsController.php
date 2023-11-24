<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Models\Section;
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
            'sections' => Section::filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($section) => [
                    'id' => $section->id,
                    'section_name' => $section->section_name,
                    'canEdit' => Auth::user()->can('sections.edit', $section),
                    'delete' => Auth::user()->can('sections.destroy', $section)
                ]),
        ]);
    }

    public function create()
    {
        return Inertia::render('Sections/Create');
    }

    public function store()
    {
        Request::validate([
            'section_name' => 'required|unique:sections,section_name',
        ]);
        Section::create(Request::all());
        return to_route('sections.index');
    }

    public function edit(Section $section): Response
    {
        return Inertia::render('Sections/Edit', [
            'section' => $section,
        ]);
    }

    public function update(Section $section)
    {
        Request::validate([
            'section_name' => 'required|unique:sections,section_name,'.$section->id,
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

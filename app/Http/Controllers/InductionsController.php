<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Models\Induction;
use App\Models\Department;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Auth;

class InductionsController extends Controller
{
    public function index()
    {
        return Inertia::render('Inductions/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('inductions.create'),
            'inductions' => Induction::with(['Department'])
                ->filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($induction) => [
                    'id' => $induction->id,
                    'induction_name' => $induction->induction_name,
                    'department_name' => @$induction->department->department_name,
                    'canEdit' => Auth::user()->can('inductions.edit', $induction),
                    'delete' => Auth::user()->can('inductions.destroy', $induction)
                ]),
        ]);
    }

    public function create()
    {
        $departments = Department::pluck('department_name', 'id');
        return Inertia::render('Inductions/Create',compact('departments'));
    }

    public function store()
    {
        Request::validate([
            'induction_name' => 'required|unique:inductions,induction_name',
            'department_id' => 'required',
            ],
            [
            'department_id.required' => 'Please Select Department',
            ],
        );
        // dd(Request::all());
        Induction::create(Request::all());
        return to_route('inductions.index');
    }

    public function edit(Induction $induction): Response
    {
        $departments = Department::pluck('department_name', 'id');
        return Inertia::render('Inductions/Edit', [
            'induction' => $induction,
            'departments' => $departments
        ]);
    }

    public function update(Induction $induction)
    {
        Request::validate([
            'induction_name' => 'required|unique:inductions,induction_name',
            'department_id' => 'required',
        ],
        [
            'department_id.required' => 'Please Select Department',
        ]);
        $induction->fill(Request::all());    
        $induction->update();
        return to_route('inductions.index');
    }

    public function destroy(Induction $induction)
    {
        $induction->delete();
        return to_route('inductions.index');
    }
}

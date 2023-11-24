<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Request;
use App\Models\Department;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Auth;

class DepartmentsController extends Controller
{
    public function index()
    {
        return Inertia::render('Departments/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('departments.create'),
            'departments' => Department::filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($department) => [
                    'id' => $department->id,
                    'department_name' => $department->department_name,
                    'canEdit' => Auth::user()->can('departments.edit', $department),
                    'delete' => Auth::user()->can('departments.destroy', $department)
                ]),
        ]);
    }

    public function create()
    {
        return Inertia::render('Departments/Create');
    }

    public function store()
    {
        Request::validate([
            'department_name' => 'required|unique:departments,department_name',
        ]);
        Department::create(Request::all());
        return to_route('departments.index');
    }

    public function edit(Department $department): Response
    {
        return Inertia::render('Departments/Edit', [
            'department' => $department,
        ]);
    }

    public function update(Department $department)
    {
        Request::validate([
            'department_name' => 'required|unique:departments,department_name,'.$department->id,
        ]);
        $department->fill(Request::all());    
        $department->update();
        return to_route('departments.index');
    }

    public function destroy(Department $department)
    {
        $department->delete();
        return to_route('departments.index');
    }
}

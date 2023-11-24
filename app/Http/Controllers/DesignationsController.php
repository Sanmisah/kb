<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Request;
use App\Models\Designation;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Auth;

class DesignationsController extends Controller
{
    public function index()
    {
        return Inertia::render('Designations/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('designations.create'),
            'designations' => Designation::filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($designation) => [
                    'id' => $designation->id,
                    'designation_name' => $designation->designation_name,
                    'canEdit' => Auth::user()->can('designations.edit', $designation),
                    'delete' => Auth::user()->can('designations.destroy', $designation)
                ]),
        ]);
    }

    public function create()
    {
        return Inertia::render('Designations/Create');
    }

    public function store()
    {
        Request::validate([
            'designation_name' => 'required|unique:designations,designation_name',
        ]);
        Designation::create(Request::all());
        return to_route('designations.index');
    }

    public function edit(Designation $designation): Response
    {
        return Inertia::render('Designations/Edit', [
            'designation' => $designation,
        ]);
    }

    public function update(Designation $designation)
    {
        Request::validate([
            'designation_name' => 'required|unique:designations,designation_name,'.$designation->id,
        ]);
        $designation->fill(Request::all());    
        $designation->update();
        return to_route('designations.index');
    }

    public function destroy(Designation $designation)
    {
        $designation->delete();
        return to_route('designations.index');
    }
}

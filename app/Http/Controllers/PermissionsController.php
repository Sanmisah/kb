<?php

namespace App\Http\Controllers;
use Artisan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Spatie\Permission\Models\Permission;
use Inertia\Inertia;
use Inertia\Response;

class PermissionsController extends Controller
{
    public function index()
    {   
        $permissions = Permission::orderBy('id', 'desc')->paginate(15);
        return Inertia::render('Permissions/Index', [
            'permissions' => $permissions
        ]);
    }

    public function create() 
    { 
        Artisan::call("permission:create-permission-routes");
        return to_route('permissions.index');
    }

    public function store(Request $request)
    {   
       //
    }
    public function show(Permission $permission)
    {
        //
    }
   
    public function edit(Permission $permission)
    {
        //
    }

   
    public function update(Request $request, Permission $permission)
    {
        //
    }

    public function destroy(Request $request, Permission $permission)
    {
        //
    }
}

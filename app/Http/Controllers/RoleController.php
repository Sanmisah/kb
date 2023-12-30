<?php
    
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Inertia\Inertia;
use Inertia\Response;
    
class RoleController extends Controller
{
   
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $roles = Role::orderBy('id','DESC')->paginate(15);
        return Inertia::render('Roles/Index',compact('roles'));
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $permissions = Permission::get();
        return Inertia::render('Roles/Create',compact('permissions'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request): RedirectResponse
    {
        $this->validate($request, [
            'name' => 'required|unique:roles,name',
        ]);
    
        $role = Role::create(['name' => $request->input('name')]);

        if(in_array('All', $request->permissions)){
            $permissions = Permission::pluck('id','id')->all();
            $role->syncPermissions($permissions);
       } else {
           $role->syncPermissions($request->input('permissions'));
       }
      
    
        return to_route('roles.index')
                        ->with('success','Role created successfully');
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $role = Role::find($id);
        $rolePermissions = Permission::join("role_has_permissions","role_has_permissions.permission_id","=","permissions.id")
            ->where("role_has_permissions.role_id",$id)
            ->get();
    
        return Inertia::render('Roles/Show',compact('role','rolePermissions'));
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $role = Role::find($id);
        $permissions = Permission::get();
        $rolePermissions = $role->permissions->pluck('name')->toArray();
        // dd($rolePermissions);
        return Inertia::render('Roles/Edit',compact('role','permissions','rolePermissions'));       
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id): RedirectResponse
    {
        $this->validate($request, [
            'name' => 'required',
        ]);    
        $role = Role::find($id);
        $role->name = $request->input('name');       
        $role->save();       
        if(in_array($request->input('All'), $request->permissions)){
            $permissions = Permission::pluck('id','id')->all();
            $role->syncPermissions($permissions);
        } else {
            $role->syncPermissions($request->input('permissions'));            
            
        }
        return to_route('roles.index')
                        ->with('success','Role updated successfully');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id): RedirectResponse
    {
        DB::table("roles")->where('id',$id)->delete();
        return to_route('roles.index')
                        ->with('success','Role deleted successfully');
    }
}
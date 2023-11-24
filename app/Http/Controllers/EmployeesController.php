<?php

namespace App\Http\Controllers;
use App\Models\Employee;
use App\Models\Department;
use App\Models\Designation;
use App\Models\User;
// use Spatie\Permission\Models\Role;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class EmployeesController extends Controller
{
    public function index()
    {
        return Inertia::render('Employees/Index', [
            'filters' => Request::all('search'),
            'can' => Auth::user()->can('employees.create'),
            'employees' => Employee::with(['Department', 'Designation'])
                ->filter(Request::only('search'))
                ->orderBy('id', 'desc')
                ->paginate(15)
                ->withQueryString()
                ->through(fn ($employee) => [
                    'id' => $employee->id,
                    'first_name' => $employee->first_name,
                    'middle_name' => $employee->middle_name,
                    'last_name' => $employee->last_name,
                    'email' => $employee->email,
                    'contact_no' => $employee->contact_no,
                    'designation_name' => $employee->designation->designation_name,
                    'department_name' => $employee->department->department_name,
                    'canEdit' => Auth::user()->can('employees.edit', $employee),
                    'delete' => Auth::user()->can('employees.destroy', $employee)
                ]),
        ]);
    }

    public function create()
    {
        $departments = Department::pluck('department_name', 'id');
        $designations = Designation::pluck('designation_name', 'id');
        return Inertia::render('Employees/Create',compact('departments', 'designations'));
    }

    public function store()
    {
        // dd(Request::all());
        Request::validate([
                'first_name' => 'required',
                'middle_name' => 'required',
                'last_name' => 'required',
                'contact_no' => 'required',
                'designation_id' => 'required',
                'department_id' => 'required',
                'address_line_1' => 'required',
                'country' => 'required',
                'state' => 'required',
                'city' => 'required',
                'pincode' => 'required',
                'email' => 'required|unique:employees,email',  
                'password' => 'required'          
            ],
            [
                'designation_id.required' => 'Please Select Designation',
                'department_id.required' => 'Please Select Department',
                'address_line_1.required' => 'This address field is required',
            ],
        );
        $input = Request::all();
        $input['name'] = $input['first_name'];
        $input['password'] = Hash::make($input['password']);
        $input['active'] = true;    
        $input['role'] = 'Employee';  
        $user = User::create($input);
        // $user->syncRoles($input['role']);
        $user->Employee()->create($input);
        return to_route('employees.index');
    }

    public function edit(Employee $employee): Response
    {
        $departments = Department::pluck('department_name', 'id');
        $designations = Designation::pluck('designation_name', 'id');
        return Inertia::render('Employees/Edit', [
            'employee' => $employee,
            'departments' => $departments,
            'designations' => $designations
        ]);
    }

    public function update(Employee $employee)
    {
        // dd(Request::all());
        Request::validate([
                'first_name' => 'required',
                'middle_name' => 'required',
                'last_name' => 'required',
                'contact_no' => 'required',
                'designation_id' => 'required',
                'department_id' => 'required',
                'address_line_1' => 'required',
                'country' => 'required',
                'state' => 'required',
                'city' => 'required',
                'pincode' => 'required',
                'email' => 'required|unique:employees,email,'.$employee->id,  
            ],
            [
                'designation_id.required' => 'Please Select Designation',
                'department_id.required' => 'Please Select Department',
                'address_line_1.required' => 'This address field is required',
            ],
        );

        $input = Request::all();
        $user = User::find($employee->id);
        $employee->update($input); 
        // $input['password'] = Hash::make($input['password']);
        if ($user === null)
        {
            // dd('hiiii');
            $user = new User;
            $user->name = $input['first_name'];
            $user->email = $input['email'];
            // if($input['password']){
            //     $user->password = $input['password'];
            // }
            $user->active = true;
            $user->role = 'Employee';
            $employee->users()->save($user);
        }
        else
        {
            // dd($user);
            $user->update([
                'name' => $input['first_name'],
                'email' => $input['email'],
                // 'password' => ($input['password'] ? $input['password'] : ''),
                'active' => true,
            ]);
        }
        return to_route('employees.index');
    }

    public function destroy(Employee $employee)
    {
        $employee->delete();
        return to_route('employees.index');
    }
}

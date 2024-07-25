<?php

namespace App\Http\Controllers;

use App\Models\Roles;
use Illuminate\Http\Request;
use Session;
use Alert;
use App\Models\User;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class RolesController extends Controller
{

    public function index()
    {
        $roles = Roles::all();
        return view('backend.role.index', compact('roles'));
    }

    public function create()
    {
        $permissions = Permission::all();
        return view('backend.role.create', compact('permissions'));
    }

    public function store(Request $request)
{
    // Validate the incoming request data
    $request->validate([
        'name' => 'required|string|max:255',
        'sss' => 'nullable|regex:/^\d+(\.\d{1,4})?$/',
        'philhealth' => 'nullable|regex:/^\d+(\.\d{1,4})?$/',
        'hdmf' => 'nullable|regex:/^\d+(\.\d{1,4})?$/',
        'permissions' => 'array' // Adjust based on how you manage permissions
    ]);

    // Check if a role with the same name and guard_name already exists
    $existingRole = Roles::where('name', $request->name)
                         ->where('guard_name', 'web') // Assuming 'web' as the default guard_name
                         ->first();

    if ($existingRole) {
        // Role already exists
        toast('Role with this name already exists!', 'error');
        return redirect()->route('roles.create');
    }

    // Create a new role
    $role = Roles::create([
        'name' => $request->name,
        'guard_name' => 'web', // Assuming 'web' as default, adjust if needed
        'sss' => $request->sss,
        'philhealth' => $request->philhealth,
        'hdmf' => $request->hdmf,
    ]);

    // Handle permissions if needed
    if ($request->has('permissions')) {
    }

    toast('New Role Added Successfully!', 'success');
    return redirect()->route('roles.index');
}

    public function show(Roles $roles)
    {
        //
    }

    public function edit(Request $request, $id)
    {

        $role = Roles::findOrFail($id);
        $perms = Permission::all();
        return view('backend.role.edit', compact('role', 'perms'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'sss' => 'nullable|numeric',
            'philhealth' => 'nullable|numeric',
            'hdmf' => 'nullable|numeric',
            'permissions' => 'array'
        ]);

        $role = Roles::findOrFail($id);
        $role->update([
            'name' => $request->name,
            'sss' => $request->sss,
            'philhealth' => $request->philhealth,
            'hdmf' => $request->hdmf,
        ]);

        if ($request->has('permissions')) {
            $role-> name = $request->name;
            $role-> save();
            $role-> syncPermissions([
                $request->permissions
            ]);
            toast('Role Updated Successfully!', 'success');
            return redirect()->route('roles.index');
        }
        toast('Something went wrong', 'error');

    }

    public function destroy($id)
    {

        $role = Roles::findOrFail($id);
        $role->delete();
        toast('Role Deleted Successfully!', 'success');
        return redirect()->route('roles.index');

    }
}

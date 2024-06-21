<?php

namespace App\Http\Controllers;

use App\Models\Roles;
use Illuminate\Http\Request;
use Session;
use Alert;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class RolesController extends Controller
{

    public function index()
    {
        $roles = Roles::paginate(10);

        $user = Auth::user();
        
        return view('backend.role.index', compact('roles'));
    }

    public function create()
    {
        $permissions = Permission::all();
        return view('backend.role.create', compact('permissions'));
    }

    public function store(Request $request)
    {
        if ($request->has('permissions')) {

            $role = Role::firstOrCreate(['name' => $request->name]);
            $role->syncPermissions($request->permissions);
            toast('New Role Added Succesfully!', 'success');
            return redirect()->route('roles.index');
        }
        toast('Something went wrong!', 'error');
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
        $role = Role::findOrfail($id);

        if ($request->has('permissions')) {
            $role->name = $request->name;
            $role->save();
            $role->syncPermissions([$request->permissions]);
            toast('Role Updated Successfully', 'success');
            return redirect()->route('roles.index');
        }
        toast('Something went wrong', 'error');
    }

    public function destroy($id)
    {

        $roles = Roles::find($id);
        $roles->delete();
        // toast('Role Deleted Succesfully!','success');

    }
}

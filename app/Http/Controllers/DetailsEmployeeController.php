<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\EmployeeProject;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DetailsEmployeeController extends Controller
{
    public function show($id)
    {
        // Find the EmployeeProject by ID
        $employeeProject = EmployeeProject::findOrFail($id);

        // Get the associated user (employee) details
        $employee = $employeeProject->user;

        // Get userdetails for the employee
        $userdetails = DB::table('userdetails')->where('user_id', $employee->id)->first();

        // Get userdetails for the employee
        $useraddresses = DB::table('useraddresses')->where('user_id', $employee->id)->first();

        // Pass the employee data to the view
        return view('backend.project.employeedetails', compact('employee', 'userdetails','useraddresses'));
    }
}

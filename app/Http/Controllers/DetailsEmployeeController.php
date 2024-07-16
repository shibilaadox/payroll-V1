<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\EmployeeProject;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Http\Request;

class DetailsEmployeeController extends Controller
{
    public function show($id)
    {
        // Find the EmployeeProject by ID
        $employeeProject = EmployeeProject::findOrFail($id);

        // Get the associated user (employee) details
        $employee = $employeeProject->user;

        // Pass the employee data to the view
        return view('backend.project.employeedetails', compact('employee'));
    }
}

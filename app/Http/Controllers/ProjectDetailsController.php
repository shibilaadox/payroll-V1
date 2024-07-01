<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\EmployeeProject;
use App\Models\Project;
use Illuminate\Http\Request;

class ProjectDetailsController extends Controller
{

    public function index(){
        $data['projects'] = Project::all();
        $data['projects'] = Project::with('clients')->with('employees')->get();
    }

    public function show($id)
    {
        $project = Project::findOrFail($id);
        $employeeProjects = EmployeeProject::where('project_id', $id)->get();

        $totalEmployees = $employeeProjects->count();
        $totalCost = $employeeProjects->sum(function($employeeProject){
            return (float) $employeeProject->payment;
        });

        // $month = request('month') ? (int) request('month') : date('m', strtotime('last month'));
        // $year = date('Y');
        // $secondSaturday = $this->getSecondSaturday($year, $month);

        $month = request('month') ? request('month') : date('m', strtotime('last month'));
        $year = date('Y');
        $secondSaturday = date('Y-m-d', strtotime("second saturday of $year-$month"));

        return view('backend.project.details', compact('project', 'employeeProjects', 'totalEmployees', 'totalCost', 'secondSaturday'));
    }

    // private function getSecondSaturday($year, $month)
    // {
    //     $firstDayOfMonth = strtotime("$year-$month-01");
    //     $firstSaturday = strtotime('next Saturday', $firstDayOfMonth);
    //     $secondSaturday = strtotime('next Saturday', $firstSaturday);
    //     return date('Y-m-d', $secondSaturday);
    // }



}

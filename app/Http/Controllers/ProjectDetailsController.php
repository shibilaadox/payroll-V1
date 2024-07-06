<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\EmployeeProject;
use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;

class ProjectDetailsController extends Controller
{

    public function index(){
        $data['projects'] = Project::all();
        $data['projects'] = Project::with('clients')->with('employees')->get();

        return view('backend.project.index', $data);
    }

    public function show($id, Request $request)
    {
        $project = Project::findOrFail($id);

        $employeeProjects = EmployeeProject::where('project_id', $id)
        ->with('user', 'project')
        ->get();

        $month = $request->get('month');
        $current_month = $month ? date('F', mktime(0, 0, 0, $month)) : date('F', strtotime('-1 month'));

        $employeeProjectsQuery = EmployeeProject::where('project_id', $id)
            ->with('user', 'project');

        $projectsQuery = Project::where('client', $id);

        if ($month) {
            $employeeProjectsQuery->whereMonth('created_at', $month);
        }

        $employeeProjects = $employeeProjectsQuery->get();

        $projects = $projectsQuery->get();

        $totalEmployees = $employeeProjects->count();
        $totalCost = $employeeProjects->sum(function($employeeProject){
            return (float) $employeeProject->payment;
        });

        // $users = User::where('status', 1)->select('id', 'name')->get();
        // $month = request('month') ? request('month') : date('m', strtotime('last month'));
        $year = date('Y');
        $secondSaturday = date('Y-m-d', strtotime("second saturday of $year-$month"));

        return view('backend.project.details', compact('project', 'employeeProjects', 'totalEmployees', 'totalCost', 'secondSaturday', 'current_month', 'projects'));
    }




}

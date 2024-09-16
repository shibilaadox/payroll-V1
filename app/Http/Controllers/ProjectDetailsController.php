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

    public function index()
    {
        $data['projects'] = Project::all();
        $data['projects'] = Project::with('clients')->with('employees')->get();

        $currentMonth = date('m');
        $currentYear = date('Y');

        $projects = Project::whereYear('start_date', $currentYear)
            ->whereMonth('start_date', $currentMonth)
            ->orWhereYear('end_date', $currentYear)
            ->whereMonth('end_date', $currentMonth)
            ->with(['clients', 'employees'])
            ->get();

        return view('backend.project.index', $data);
    }

    public function show($id, Request $request)
    {
        $project = Project::findOrFail($id);

        // Get the current month
        $selectedMonth = $request->input('month', date('m', strtotime($project->start_date)));
        $currentMonth = date('m');
        $currentYear = date('Y');
        $currentMonthName = date('F');

        $projectMonth = date('m', strtotime($project->start_date));

        $employeeProjects = EmployeeProject::where('project_id', $id)
            ->whereMonth('created_at', $selectedMonth)
            ->with('user', 'project')
            ->get();

        // Default to current month if no month is specified
        $month = $request->get('month', $currentMonth);
        $current_month = date('F');

        // Fetch employee projects for the specified month
        $employeeProjectsQuery = EmployeeProject::where('project_id', $id)
            ->whereMonth('created_at', $month)
            ->with('user', 'project');

        $projectsQuery = Project::where('client', $id);

        if ($month) {
            $employeeProjectsQuery->whereMonth('created_at', $month);
        }

        $employeeProjects = $employeeProjectsQuery->get();

        $projects = $projectsQuery->get();

        $totalEmployees = $employeeProjects->count();

        $totalCost = $employeeProjects->sum(function ($employeeProject) {
            return (float) $employeeProject->payment;
        });

        // $users = User::where('status', 1)->select('id', 'name')->get();
        // $month = request('month') ? request('month') : date('m', strtotime('last month'));
        // $year = date('Y');
        // $secondSaturday = date('Y-m-d', strtotime("second saturday of $year-$month"));

        return view('backend.project.details', compact('projectMonth','currentYear', 'selectedMonth', 'project', 'employeeProjects', 'totalEmployees', 'totalCost', 'current_month', 'projects', 'currentMonthName'));
    }
}

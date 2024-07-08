<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;

class ClientDetailsController extends Controller
{

    public function index()
    {
        // $data['projects'] = Project::all();
        $data['projects'] = Project::with('clients')->with('employees')->get();
        // $data['projects'] = Project::with(['clients', 'employees'])->get();
        $currentMonth = date('m');
        $currentYear = date('Y');

        $projects = Project::whereYear('start_date', $currentYear)
            ->whereMonth('start_date', $currentMonth)
            ->orWhereYear('end_date', $currentYear)
            ->whereMonth('end_date', $currentMonth)
            ->with(['clients', 'employees'])
            ->get();

        $clients = Client::all();
        $users = User::all();

        return view('backend.project.index', $data, compact('projects', 'clients'
        , 'users'
    ));
    }


    public function showDetails($id, Request $request)
    {
        $client = Client::find($id);

        if (!$client) {
            abort(404, 'Client not found');
        }

        $month = $request->input('month', date('m'));
        $status = $request->input('status', 'all');
        $current_month = date('F', mktime(0, 0, 0, $month));

        $clients = Client::all();
        $projects = Project::where('client', $id)->get();

        $projectsQuery = Project::where('client', $id);

        if ($month) {
            $projectsQuery->whereMonth('start_date', $month)->orWhereMonth('end_date', $month);
        }

        $projects = $projectsQuery->get();
        $totalAmount = $projects->sum('salary');

        $completedProjects = $projects->where('status', 'Completed')->count();
        $ongoingProjects = $projects->where('status', 'Ongoing')->count();
        $onHoldProjects = $projects->where('status', 'Hold')->count();

        $noProjects = $projects->isEmpty();

        return view('backend.client.details', compact('client', 'clients', 'projects', 'totalAmount', 'completedProjects', 'ongoingProjects', 'onHoldProjects', 'current_month', 'noProjects'));
    }

    public function show($id)
    {
        $client = Client::findOrFail($id);
        $projects = Project::where('client', $id)->get();

        return view('backend.client.details', compact('client', 'projects'));
    }
}

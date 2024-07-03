<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Project;
use Illuminate\Http\Request;

class ClientDetailsController extends Controller
{

    public function index(){
        $data['projects'] = Project::all();
        $data['projects'] = Project::with('clients')->with('employees')->get();

        return view('backend.project.index', $data);
    }


    public function showDetails($id, Request $request)
    {
        $client = Client::find($id);

        if (!$client) {
            abort(404, 'Client not found');
        }

        $month = $request->input('month');
        $current_month = $month ? date('F', mktime(0, 0, 0, $month)) : date('F', strtotime('-1 month'));

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

        return view('backend.client.details', compact('client', 'clients', 'projects', 'totalAmount', 'completedProjects', 'ongoingProjects', 'onHoldProjects', 'current_month'));
    }

    public function show($id)
    {
        $client = Client::findOrFail($id);
        $projects = Project::where('client_id', $id)->get();

        return view('backend.client.details', compact('client', 'projects'));
    }

}


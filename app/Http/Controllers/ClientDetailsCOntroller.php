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


    public function showDetails($id)
    {
        $client = Client::find($id);

        if (!$client) {
            abort(404, 'Client not found');
        }

        $clients = Client::all();
        $projects = Project::where('client', $id)->get();

        $totalAmount = $projects->sum('salary');

        $completedProjects = $projects->where('status', 'Completed')->count();
        $ongoingProjects = $projects->where('status', 'Ongoing')->count();
        $onHoldProjects = $projects->where('status', 'Hold')->count();

        return view('backend.client.details', compact('client', 'clients', 'projects', 'totalAmount', 'completedProjects', 'ongoingProjects', 'onHoldProjects'));
    }

    public function show($id)
    {
        // Assuming you're passing client-specific projects
        $client = Client::findOrFail($id);
        $projects = Project::where('client_id', $id)->get();

        // Pass the data to the view
        return view('backend.client.details', compact('client', 'projects'));
    }

}


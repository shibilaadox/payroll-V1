<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
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
        return view('backend.project.details', compact('project'));
    }

}
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\User;
use App\Models\Client;
use App\Models\EmployeeProject;
use App\Models\Roles;
use DataTables;
use DateTime;
use Spatie\Permission\Contracts\Role;
use Throwable;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['projects'] = Project::with('clients')->with('employees')->get();
        $data['roles'] = Roles::all();
        $data['clients'] = Client::all();
        $data['users'] = User::where('status', 1)->get();
        $projects = Project::all();

        $roles = Roles::all(); // Fetch all roles
        $users = User::all();

        return view('backend.project.index', ['data' => $data], compact('projects', 'roles', 'users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {

            $input['project'] = $request->project;
            $input['project_type'] = $request->project_type;
            $input['project_name'] = $request->project_name;
            $input['client'] = $request->client;
            $input['project_phase'] = $request->project_phase;
            $input['project_amount'] = $request->project_amount;
            $input['start_date'] = $request->start_date;
            $input['end_date'] = $request->end_date;
            $input['project_location'] = $request->project_location;
            $input['description'] = $request->description;
            $input['status'] = $request->project_status;

            $data_project = Project::updateOrCreate(['id' => $request->project_id], $input);

            $jsonData = $request->employee_payment;

            $decodedData = json_decode($jsonData, true);

            $monthNum  = date('m');
            $dateObj   = DateTime::createFromFormat('!m', $monthNum);
            $monthName = $dateObj->format('F'); // March

            foreach ($decodedData as $item) {

                $inputs['user_id'] = $item["Employee"];
                $inputs['project_id'] = $data_project->id;
                $inputs['payment'] = $item["Payment"];
                $inputs['role'] = $item["Role"];
                $inputs['mode'] = $item["Mode"];
                $inputs['month'] = $monthName;
                EmployeeProject::updateOrCreate(['id' => $request->project_id], $inputs);
            }

            return response()->json(['code' => '200', 'status' => 'Project added successfully']);
        } catch (Throwable $e) {

            report($e);
            return response()->json(['code' => '500', 'status' => $e]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $project = Project::find($id);
        return response()->json($project);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $project = Project::find($id);
        $project->delete();
    }
}

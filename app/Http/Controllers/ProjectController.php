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
        $data['projects'] = Project::join('clients','clients.id','=','projects.client')->select('projects.*','clients.name as client_name')->get();
        $data['roles'] = Roles::all();
        $data['clients'] = Client::all();
        $employee_ids = EmployeeProject::select('user_id')->join('projects','employee_projects.project_id','=','projects.id')->where('status','!=','Completed')->groupBy('user_id')->get();
        
        $data['users'] = User::whereNotIn('id',$employee_ids)->where('user_type','Employee')->where('status', 1)->get();
        $data['users_edit'] = User::where('user_type','Employee')->where('status', 1)->get();
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
            $input['role'] = $request->role;

            // Handle roles if provided
            //$roles = $request->input('role', []);

            $data_project = Project::updateOrCreate(['id' => $request->project_id], $input);
            //$data_project->roles()->sync($roles);

            $user_pro = EmployeeProject::where('project_id',$request->project_id)->delete();
            

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
        $employee_project = EmployeeProject::where('project_id',$id)->get();
        $data['project'] = $project;
        $data['employee_project'] = $employee_project;
        return response()->json($data);
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

    public function delete_project_employee()
    {
        $id = $_GET['id'];
        $user = EmployeeProject::find($id);
        $user->delete();
    }
}

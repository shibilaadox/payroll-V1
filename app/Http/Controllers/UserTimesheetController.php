<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\UserTimesheet;
use App\Models\Userdetail;
use App\Models\Location;
use App\Models\Project;
use App\Models\User;
use App\Models\Rate;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Calculation\Engine\BranchPruner;
use Yajra\DataTables\Facades\DataTables;
use DateTime;

class UserTimesheetController extends Controller
{
    public function index()
    {
       
        $clients = Client::all();
        $locations = Location::all();
        return view('backend.timesheetEntry.index', compact('clients','locations'));
    
    }

    public function store(Request $request)
    {
        $last_employee_data = UserTimesheet::where('month',date('m'))->where('user_id',$request->user_id)->first();
        if(empty($last_employee_data)){
        $rate8 = Rate::select('rate8')->first();
        $rate12 = Rate::select('rate12')->first();

            $input['user_id'] = $request->user_id;
            $input['client_id'] = $request->client_id;
            $input['location_id'] = $request->location_id;
            $input['pay_type'] = $request->pay_type;
            $input['payroll_period_start'] = $request->payroll_period_start;
            $input['payroll_period_end'] = $request->payroll_period_end;
            $input['payroll_date'] = $request->payroll_date;
            $input['week_number'] = $request->week_number;
            $input['month'] = $request->month;
            $input['year'] = $request->year;

            
            $user_data = User::where('id',$request->user_id)->first();
            
            $date = date('F Y');//Current Month Year
        
            $fDay = date('Y-m-01');
            $hDay = date('Y-m-d', (strtotime($fDay)+ (86400 * 15)));
            $lDay = date("Y-m-t");

            if($request->week_number=="B"){

                $date = date('Y-m-d', (strtotime($fDay)+ (86400 * 15)));
                
                while ($date >= $hDay && $date <= $lDay) {
                  
                    
                    $input['employee_code'] = $user_data->employee_code;
                    $input['posicode'] = $user_data->job_role;  
                    $input['company_code'] = "";
                    $input['ot1_hrs'] = 0;
                    $input['ot2_hrs'] = 0;
                    $input['ot3_hrs'] = 0;
                    $input['ot4_hrs'] = 0;
                    $input['ot5_hrs'] = 0;
                    $input['ot6_hrs'] = 0;
                    $input['ot7_hrs'] = 0;
                    $input['ot8_hrs'] = 0;
                    $input['ot9_hrs'] = 0;
                    $input['ot10_hrs'] = 0;
                    $input['ot11_hrs'] = 0;
                    $input['ot12_hrs'] = 0;
                    $input['ot13_hrs'] = 0;
                    $input['day8'] = 0;
                    $input['day8_rate'] = $rate8->rate8;
                    $input['day12'] = 0;
                    $input['day12_rate'] = $rate12->rate12;
                    $input['nd_days'] = 0;
                    $input['incentive'] = 0;
                    $input['undertime'] = 0;
                    $input['date'] = $date;
          
                    $last_data = UserTimesheet::where('date',$date)->where('user_id',$request->user_id)->first();
                    if(empty($last_data))
                    UserTimesheet::create($input);

                   
                    $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));//Adds 1 day onto current date
                    
                }
            }

            else
            {
                $date = $fDay;
               
                while ($date >= $fDay && $date < $hDay) {
                  
                   
                    $input['employee_code'] = $user_data->employee_code;
                    $input['posicode'] = $user_data->job_role;  
                    $input['company_code'] = "";
                    $input['ot1_hrs'] = 0;
                    $input['ot2_hrs'] = 0;
                    $input['ot3_hrs'] = 0;
                    $input['ot4_hrs'] = 0;
                    $input['ot5_hrs'] = 0;
                    $input['ot6_hrs'] = 0;
                    $input['ot7_hrs'] = 0;
                    $input['ot8_hrs'] = 0;
                    $input['ot9_hrs'] = 0;
                    $input['ot10_hrs'] = 0;
                    $input['ot11_hrs'] = 0;
                    $input['ot12_hrs'] = 0;
                    $input['ot13_hrs'] = 0;
                    $input['day8'] = 8.00;
                    $input['day8_rate'] = $rate8->rate8;
                    $input['day12'] = 4.00;
                    $input['day12_rate'] = $rate12->rate12;
                    $input['nd_days'] = 0;
                    $input['incentive'] = 0;
                    $input['undertime'] = 0;
                    $input['date'] = $date;
          
                    $last_data = UserTimesheet::where('date',$date)->where('user_id',$request->user_id)->first();
                    if(empty($last_data))
                    UserTimesheet::create($input);

                    $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));//Adds 1 day onto current date
                    
                } 
            
            }
        }

            $data_employee = UserTimesheet::with('client')->with('location')->where('user_id',$request->user_id)->where('month',date('m'))->get();

            return view('backend.timesheetEntry.timesheet_entry',compact('data_employee'));
    }


    public function edit($id)
    {
        $timesheet = UserTimesheet::findOrFail($id);
        return response()->json(['timesheet' => $timesheet]);
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'user_id' => 'required|exists:users,id',
            'client_id' => 'required|exists:clients,id',
            'location_id' => 'required|exists:locations,id',
            'pay_type' => 'required',
            'payroll_period_start' => 'required|date',
            'payroll_period_end' => 'required|date',
            'payroll_date' => 'required|date',
            'week_number' => 'required',
            'month' => 'required|date_format:m',
            'year' => 'required|date_format:Y',
            'date' => 'required|date',
            'employee_code' => 'required|string',
            'company_code' => 'required|string',
            'posicode' => 'required|string',
            'ot1_hrs' => 'required|numeric',
            'ot2_hrs' => 'required|numeric',

            'ot3_hrs' => 'required|numeric',
            'ot4_hrs' => 'required|numeric',
            'ot5_hrs' => 'required|numeric',
            'ot6_hrs' => 'required|numeric',
            'ot7_hrs' => 'required|numeric',
            'ot8_hrs' => 'required|numeric',
            'ot9_hrs' => 'required|numeric',
            'ot10_hrs' => 'required|numeric',
            'ot11_hrs' => 'required|numeric',
            'ot12_hrs' => 'required|numeric',
            'ot13_hrs' => 'required|numeric',
            'day8' => 'required',
            'day8_rate' => 'required',
            'day12' => 'required',
            'day12_rate' => 'required',
            'nd_days' => 'required',
            'incentive' => 'required',
            'undertime' => 'required',
        ]);

        $timesheet = UserTimesheet::findOrFail($id);
        $timesheet->update($validatedData);

        return redirect()->route('userTimesheet.index')->with('success', 'Timesheet entry updated successfully.');
    }

    public function getEmployeesByClient($clientName)
    {
        $projectIds = Project::where('client', $clientName)->pluck('id');
        $employees = User::whereHas('employeeProjects', function ($query) use ($projectIds) {
            $query->whereIn('project_id', $projectIds);
        })->select('id', 'employee_code', 'firstname', 'lastname')
            ->get();

        return response()->json($employees);
    }

    public function getEmployeeDetails($id)
    {
        $employee = User::select('id', 'employee_code','job_role')
            ->where('id', $id)
            ->first();

        return response()->json($employee);
    }



    public function getTimesheets(Request $request)
    {
        if ($request->ajax()) {
            $timesheets = UserTimesheet::with('client', 'location', 'user')->where('month',date('m'))->select('user_timesheets.*')->orderByRaw('(SELECT firstname FROM users WHERE user_timesheets.user_id = users.id)');
            return DataTables::of($timesheets)
                ->addColumn('payroll_period', function ($row) {
                    return $row->payroll_period_start . ' - ' . $row->payroll_period_end;
                })
                ->addColumn('client.name', function ($row) {
                    return $row->client ? $row->client->name : 'N/A';
                })
                ->addColumn('location.name', function ($row) {
                    return $row->location ? $row->location->location_name : 'N/A';
                })
                ->addColumn('user.name', function ($row) {
                    return $row->user ? $row->user->name : 'N/A';
                })
                ->addColumn('action', function ($row) {
                    return '
                    <div style="display:flex; ">
                        <button class="btn btn-sm btn-success mr-2" onclick="editTimesheet(' . $row->id . ')">Edit</button>

                            <form action="' . route('userTimesheet.destroy', $row->id) . '" method="POST" style="display: inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                    </div>
                    ';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return datatables()->of(UserTimesheet::with(['client', 'user'])->get())
            ->addColumn('action', function ($timesheet) {
                return '<button class="btn btn-sm btn-primary" onclick="editTimesheet(' . $timesheet->id . ')">Edit</button>';
            })
            ->make(true);
    }

    public function destroy($id)
    {
        $timesheet = UserTimesheet::findOrFail($id);
        $timesheet->delete();

        return redirect()->route('userTimesheet.index')->with('success', 'Timesheet entry deleted successfully.');
    }

    public function user_data_entry()
    {
        
        $input['client_id'] = $_GET['client_id'];
        $input['location_id'] = $_GET['location_id'];
        $input['pay_type'] = $_GET['pay_type'];
        $input['payroll_period_start'] = $_GET['payroll_period_start'];
        $input['payroll_period_end'] = $_GET['payroll_period_end'];
        $input['payroll_date'] = $_GET['payroll_date'];
        $input['week_number'] =$_GET['week_number'];
        $input['month'] = $_GET['month'];
        $input['year'] =$_GET['year'];
        $employees= User::select('users.*','userdetails.location')->join('userdetails','users.id','=','userdetails.user_id')->where('client',$input['client_id'])->where('location',$input['location_id'])->get();
        return view('backend.timesheetEntry.dtr_entry_employee', compact('input','employees'));
    }

    public function delete_timesheet()
    {
        $id = $_GET['id'];
        $timesheet = UserTimesheet::findOrFail($id);
        $timesheet->delete();
    }

    // inline edit
    public function update_entry()
    {

        $id = $_GET['id'];
        $column = $_GET['column'];
        $value = $_GET['value'];
        $timesheet = UserTimesheet::findOrFail($id);

        $timesheet->$column = $value;
        $timesheet->save();

    }

    public function employee_store()
    {
        try {

            $user =  new User;
            $user->name = $_GET['firstname'] ." " . $_GET['lastname'];
            $user->employee_code = $_GET['employee_code'];
            $user->firstname = $_GET['firstname'];
            $user->lastname = $_GET['lastname'];
            $user->job_role = $_GET['job_role'];
            $user->client = $_GET['client_id'];
            $user->save();

            $id = $user->id;

            $user_detail =  new Userdetail;
            $user_detail->user_id = $id;
            $user_detail->location = $_GET['location_id'];
            $user_detail->save();

            return response()->json(['code' => '200', 'status' => 'Employee added successfully']);
        } catch (Throwable $e) {

            report($e);
            return response()->json(['code' => '500', 'status' => $e]);
        }
    }


    
}

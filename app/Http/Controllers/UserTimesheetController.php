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
            $input['date'] = $request->date;
            $input['employee_code'] = $request->employee_code;
            $input['company_code'] = $request->company_code;
            $input['posicode'] = $request->posicode;
            $input['ot1_hrs'] = $request->ot1_hrs;
            $input['ot2_hrs'] = $request->ot2_hrs;
            $input['ot3_hrs'] = $request->ot3_hrs;
            $input['ot4_hrs'] = $request->ot4_hrs;
            $input['ot5_hrs'] = $request->ot5_hrs;
            $input['ot6_hrs'] = $request->ot6_hrs;
            $input['ot7_hrs'] = $request->ot7_hrs;
            $input['ot8_hrs'] = $request->ot8_hrs;
            $input['ot9_hrs'] = $request->ot9_hrs;
            $input['ot10_hrs'] = $request->ot10_hrs;
            $input['ot11_hrs'] = $request->ot11_hrs;
            $input['ot12_hrs'] = $request->ot12_hrs;
            $input['ot13_hrs'] = $request->ot13_hrs;
            $input['day8'] = $request->day8;
            $input['day8_rate'] = $request->day8_rate;
            $input['day12'] = $request->day12;
            $input['day12_rate'] = $request->day12_rate;
            $input['nd_days'] = $request->nd_days;
            $input['incentive'] = $request->incentive;
            $input['undertime'] = $request->undertime;

        UserTimesheet::create($input);

        $projectIds = Project::where('client', $request->client_id)->pluck('id');
        $employees = User::whereHas('employeeProjects', function ($query) use ($projectIds) {
            $query->whereIn('project_id', $projectIds);
        })->select('id', 'employee_code', 'firstname', 'lastname','job_role')
            ->get();
            $date = date('F Y');//Current Month Year
        
        
        foreach($employees as $row)
        {
            $fDay = date('Y-m-01');
            $date = date('Y-m-d');

            if($request->week_number=="B"){
                $hDay = date('Y-m-d', (strtotime($fDay)+ (86400 * 15)));
                $lDay = date("Y-m-t");
                while ($date > $hDay && $date <= $lDay) {
                  
                    $input['payroll_date'] = $request->payroll_date;
                    $input['week_number'] = $request->week_number;
                    $input['month'] = $request->month;
                    $input['date'] = $date;
                    $input['year'] = $request->year;
                    $input['payroll_period_start'] = $request->payroll_period_start;
                    $input['payroll_period_end'] = $request->payroll_period_end;
                    $input['client_id'] = $request->client_id;
                    $input['location_id'] = $request->location_id;
                    $input['pay_type'] = $request->pay_type;
                    $input['user_id'] = $row->id;
                    $input['employee_code'] = $row->employee_code;
                    $input['posicode'] = $row->job_role;  
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
          
                    $last_data = UserTimesheet::where('date',$date)->where('user_id',$row->id)->first();
                    if(empty($last_data))
                    UserTimesheet::create($input);

                   
                    $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));//Adds 1 day onto current date
                    
                }
            }

            else
            {
                $fDay = date('Y-m-01');
                $hDay = date('Y-m-d', (strtotime($fDay)+ (86400 * 15)));
                while ($date >= $fDay && $date < $hDay) {
                  
                    $input['payroll_date'] = $request->payroll_date;
                    $input['week_number'] = $request->week_number;
                    $input['month'] = $request->month;
                    $input['date'] = $date;
                    $input['year'] = $request->year;
                    $input['payroll_period_start'] = $request->payroll_period_start;
                    $input['payroll_period_end'] = $request->payroll_period_end;
                    $input['client_id'] = $request->client_id;
                    $input['location_id'] = $request->location_id;
                    $input['pay_type'] = $request->pay_type;
                    $input['user_id'] = $row->id;
                    $input['employee_code'] = $row->employee_code;
                    $input['posicode'] = $row->job_role;  
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
          
                    $last_data = UserTimesheet::where('date',$date)->where('user_id',$row->id)->first();
                    if(empty($last_data))
                    UserTimesheet::create($input);

                    $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));//Adds 1 day onto current date
                    
                }  
            }

            
            
        }

        return response()->json(['code' => 200, 'message' => 'Timesheet entry created successfully.']);
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
        $employees= User::join('userdetails','users.id','=','userdetails.user_id')->where('client',$input['client_id'])->where('location',$input['location_id'])->get();
        return view('backend.timesheetEntry.dtr_entry_employee', compact('input','employees'));
    }
}

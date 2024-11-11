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

class UserTimesheetController extends Controller
{
    public function index()
    {
        $clients = Client::all();
        $timesheets = UserTimesheet::paginate(10);
        $salaryPayTypes = Userdetail::pluck('salary_pay_type')->unique();
        $locations = Location::select('id', 'location_name')->get();
        $users = User::select('id', 'firstname', 'middlename', 'lastname')->get();
        $data = UserTimesheet::get();
        $rate8 = Rate::select('rate8')->first();
        $rate12 = Rate::select('rate12')->first();
        return view('backend.timesheetEntry.index', compact('timesheets', 'clients', 'salaryPayTypes', 'locations', 'users', 'rate8', 'rate12'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required',
            'client_id' => 'required',
            'location_id' => 'required',
            'pay_type' => 'required',
            'payroll_period_start' => 'required|date',
            'payroll_period_end' => 'required|date',
            'payroll_date' => 'required|date',
            'week_number' => 'required',
            'month' => 'required',
            'year' => 'required',
            'date' => 'required',
            'employee_code' => 'required',
            'company_code' => 'required',
            'posicode' => 'required',
            'ot1_hrs' => 'required',
            'ot2_hrs' => 'required',
            'ot3_hrs' => 'required',
            'ot4_hrs' => 'required',
            'ot5_hrs' => 'required',
            'ot6_hrs' => 'required',
            'ot7_hrs' => 'required',
            'ot8_hrs' => 'required',
            'ot9_hrs' => 'required',
            'ot10_hrs' => 'required',
            'ot11_hrs' => 'required',
            'ot12_hrs' => 'required',
            'ot13_hrs' => 'required',
            'day8' => 'required',
            'day8_rate' => 'required',
            'day12' => 'required',
            'day12_rate' => 'required',
            'nd_days' => 'required',
            'incentive' => 'required',
            'undertime' => 'required',

        ]);

        UserTimesheet::create($validatedData);

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
            $timesheets = UserTimesheet::with('client', 'location', 'user')->select('user_timesheets.*');
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
}

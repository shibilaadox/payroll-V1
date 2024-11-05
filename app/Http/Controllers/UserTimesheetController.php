<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\UserTimesheet;
use App\Models\Userdetail;
use App\Models\Location;
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
        $locations = Location::select('id','location_name')->get();
        $users = User::select('id','firstname','middlename','lastname')->get();
        $data = UserTimesheet::get();
        $rate8 = Rate::select('rate8')->first();
        $rate12 = Rate::select('rate12')->first();
        return view('backend.timesheetEntry.index', compact('timesheets', 'clients', 'salaryPayTypes','locations','users','rate8','rate12'));
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
            'date'=> 'required',
            'employee_code'=> 'required',
            'company_code'=> 'required',
            'posicode'=> 'required',
            'ot1_hrs'=> 'required',
            'ot2_hrs'=> 'required',
            'ot3_hrs'=> 'required',
            'ot4_hrs'=> 'required',
            'ot5_hrs'=> 'required',
            'ot6_hrs'=> 'required',
            'ot7_hrs'=> 'required',
            'ot8_hrs'=> 'required',
            'ot9_hrs'=> 'required',
            'ot10_hrs'=> 'required',
            'ot11_hrs'=> 'required',
            'ot12_hrs'=> 'required',
            'ot13_hrs'=> 'required',
            'day8'=> 'required',
            'day8_rate'=> 'required',
            'day12'=> 'required',
            'day12_rate'=> 'required',
            'nd_days'=> 'required',
            'incentive'=> 'required',
            'undertime'=> 'required',
            
        ]);
       
        UserTimesheet::create($validatedData);

        return response()->json(['code' => 200, 'message' => 'Timesheet entry created successfully.']);
    }


    public function getTimesheets(Request $request)
    {
        if ($request->ajax()) {
            $timesheets = UserTimesheet::with('client', 'location')->select('user_timesheets.*');
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
                        <form action="' . route('userTimesheet.destroy', $row->id) . '" method="POST" style="display: inline;">
                            ' . csrf_field() . '
                            ' . method_field('DELETE') . '
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    ';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return datatables()->of(UserTimesheet::with(['client',
        // 'branch'
        ])->get())
            ->addColumn('action', function ($timesheet) {
                return '<button class="btn btn-sm btn-primary" onclick="editTimesheet(' . $timesheet->id . ')">Edit</button>'; // Adjust as needed
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

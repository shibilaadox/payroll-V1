<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\UserTimesheet;
use App\Models\Userdetail;
use App\Models\Location;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Calculation\Engine\BranchPruner;
use Yajra\DataTables\Facades\DataTables;

class UserTimesheetController extends Controller
{
    public function index()
    {
        $clients = Client::all();
        // $timesheets = ClientTimesheet::with('client')->get();
        $timesheets = UserTimesheet::paginate(10);
        $salaryPayTypes = Userdetail::pluck('salary_pay_type')->unique();
        $locations = Location::select('id','location_name')->get();

        $data = UserTimesheet::get();
        return view('backend.timesheetEntry.index', compact('timesheets', 'clients', 'salaryPayTypes','locations'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            // 'employee_id' => 'required',
            'client_id' => 'required',
            'branch' => 'required',
            'pay_type' => 'required',
            'payroll_period_start' => 'required|date',
            'payroll_period_end' => 'required|date',
            'payroll_date' => 'required|date',
            'week_number' => 'required',
            'month' => 'required',
            'year' => 'required',
            
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
        $timesheet = ClientTimesheet::findOrFail($id);
        $timesheet->delete();

        return redirect()->route('clientTimesheet.index')->with('success', 'Timesheet entry deleted successfully.');
    }
}

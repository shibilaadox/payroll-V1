<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Client;
use App\Models\ClientTimesheet;
use App\Models\EmployeeTimesheetHourly;
use App\Models\Userdetail;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Calculation\Engine\BranchPruner;
use Yajra\DataTables\Facades\DataTables;

class ClientTimesheetController extends Controller
{
    public function index()
    {
        $clients = Client::all();
        // $timesheets = ClientTimesheet::with('client')->get();
        $timesheets = ClientTimesheet::paginate(10);
        $salaryPayTypes = Userdetail::pluck('salary_pay_type')->unique();
        $branches = EmployeeTimesheetHourly::pluck('branch')->unique();

        $data = ClientTimesheet::get();
        return view('backend.timesheetEntry.index', compact('timesheets', 'clients', 'salaryPayTypes','branches'));
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
            // 'hours_worked' => 'required|numeric',
            'overtime_hours' => 'nullable|numeric',
        ]);
        EmployeeTimesheetHourly::create($request->all());
        ClientTimesheet::create($validatedData);

        return response()->json(['code' => 200, 'message' => 'Timesheet entry created successfully.']);
    }


    public function getTimesheets(Request $request)
    {
        if ($request->ajax()) {
            $timesheets = ClientTimesheet::with('client', 'branch')->select('client_timesheets.*');
            return DataTables::of($timesheets)
                ->addColumn('payroll_period', function ($row) {
                    return $row->payroll_period_start . ' - ' . $row->payroll_period_end;
                })
                ->addColumn('client.name', function ($row) {
                    return $row->client ? $row->client->name : 'N/A';
                })
                // ->addColumn('branch.name', function ($row) {
                //     return $row->branch ? $row->branch->name : 'N/A';
                // })
                ->addColumn('action', function ($row) {
                    return '
                        <form action="' . route('clientTimesheet.destroy', $row->id) . '" method="POST" style="display: inline;">
                            ' . csrf_field() . '
                            ' . method_field('DELETE') . '
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    ';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return datatables()->of(ClientTimesheet::with(['client',
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

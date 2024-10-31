<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ClientTimesheet;
use Illuminate\Http\Request;

class ClientTimesheetController extends Controller
{
    public function index()
    {

        $timesheets = ClientTimesheet::paginate(10);

        $data = ClientTimesheet::get();
        return view('backend.timesheetEntry.index', compact('timesheets'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'employee_id' => 'required',
            'client_id' => 'required',
            'branch_id' => 'required',
            'pay_type' => 'required',
            'payroll_period_start' => 'required|date',
            'payroll_period_end' => 'required|date',
            'payroll_date' => 'required|date',
            'week_number' => 'required',
            'month' => 'required',
            'year' => 'required',
            'hours_worked' => 'required|numeric',
            'overtime_hours' => 'nullable|numeric',
        ]);

        ClientTimesheet::create($validatedData);

        return redirect()->route('clientTimesheet.index')->with('success', 'Timesheet entry created successfully.');
    }

    public function destroy($id)
    {
        $timesheet = ClientTimesheet::findOrFail($id);
        $timesheet->delete();

        return redirect()->route('clientTimesheet.index')->with('success', 'Timesheet entry deleted successfully.');
    }
}

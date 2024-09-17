<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\EmployeeProject;
use App\Models\User;

class PaySlipController extends Controller
{
public function show()
    {
        return view('backend.project.payslip');
    }

    public function showInvoice($id)
{
    // Retrieve the EmployeeProject by ID
    $employeeProject = EmployeeProject::findOrFail($id);
    $user_id = $employeeProject->user_id;

    // Fetch the employee's user and timesheet data
    $employee = User::with('userdetails')->with('user_timesheet_hourly')
        ->has('user_timesheet_hourly')
        ->whereHas('user_timesheet_hourly', function ($query) {
            $query->where('month', date('m', strtotime("-1 month")));
        })
        ->where('id', $user_id)->first();

    if ($employee) {
        $total_gross_pay = 0; // Example to hold total pay
        // Iterate over timesheets and calculate payroll
        foreach ($employee->user_timesheet_hourly as $timesheet) {
            $daily_rate = $employeeProject->payment;
            $regular_pay = $timesheet->day8 * $daily_rate;
            $total_gross_pay += $regular_pay; // Example calculation
        }

        // Pass the data to the payslip view
        return view('backend.project.payslip', compact('employee', 'total_gross_pay'));
    } else {
        return abort(404, 'Employee details not found.');
    }
}

}

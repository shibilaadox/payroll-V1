<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Excel;
use App\Imports\EmployeeTimesheetImportClass;
use App\Imports\EmployeeTimesheetHourlyImportClass;
use App\Imports\DeductionsImport;
use App\Imports\RatesImport;
use App\Imports\OvertimeRatesImport;
use App\Imports\SssRatesImport;
use App\Models\EmployeeTimesheet;
use Carbon;

class ExcelImportController extends Controller
{
    public function index()
    { 
       
        $data = EmployeeTimesheet::join('users', 'users.id', '=', 'employee_timesheet.user_id')->where('employee_timesheet.month',date('F',strtotime('last month')))->get();
        return view('backend.users.user_timesheet',['data' => $data]);
    }
    public function import(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new EmployeeTimesheetImportClass, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }

    public function import_hourly(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new EmployeeTimesheetHourlyImportClass, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }

    public function import_deduction(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new DeductionsImport, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }

    public function import_rate(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new RatesImport, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }

    public function import_overtime_rate(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new OvertimeRatesImport, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }

    public function import_sss_rate(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);
 
        // Get the uploaded file
        $file = $request->file('file');
 
        // Process the Excel file
        Excel::import(new SssRatesImport, $file);
 
        return redirect()->back()->with('success', 'Excel file imported successfully!');
    }
    
    
}

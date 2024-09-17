<?php

use App\Http\Controllers\API\ProfileController;
use App\Http\Controllers\API\TimesheetController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\DesignationController;
use App\Http\Controllers\HolidayController;
use App\Http\Controllers\LeaveController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\ClientDetailsController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\PayrollController;
use App\Http\Controllers\PayrollHourlyController;
use App\Http\Controllers\DeductionController;
use App\Http\Controllers\DetailsEmployeeController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\ExcelImportController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PaySlipController;
use App\Http\Controllers\PdfController;
use App\Http\Controllers\ProjectDetailsController;
use App\Http\Controllers\RateController;
use App\Models\EmployeeProject;
use App\Models\Project;
use Illuminate\Support\Facades\Auth;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login');
});

// sessions
Route::view('sessions/signIn', 'sessions.signIn')->name('signIn');
Route::view('sessions/signUp', 'sessions.signUp')->name('signUp');
Route::view('sessions/forgot', 'sessions.forgot')->name('forgot');


// Auth::routes();
Auth::routes();


//Roles routes
Route::resource('roles', RolesController::class)->middleware(['auth', 'verified']);

Route::middleware(['auth:sanctum', 'verified'])->group(function () {

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

//User routes
Route::resource('users', UserController::class);

//Employee routes
Route::resource('employee', EmployeeController::class);

//Department routes
Route::resource('departments', DepartmentController::class);

// Hourly
Route::resource('timesheet', TimesheetController::class);
Route::get('/dashboard', [HomeController::class, 'dashboard'])->name('dashboard');

// single employee
Route::get('/employee/{id}/single', [EmployeeController::class, 'single'])->name('employee.single');

// store identity information
Route::post('/employee/store', [EmployeeController::class, 'store'])->name('employee.store');


// profile
Route::get('/profile', function (){
    return view('backend.employee.profile');
})->name('profile');

Route::get('/employee/{id}/profile', [EmployeeController::class, 'showProfile'])->name('employee.profile');
Route::get('/employee/{id}/projects', [EmployeeController::class, 'showProjects'])->name('employee.projects');
Route::get('/employee/{id}/timesheet', [EmployeeController::class, 'showTimesheet'])->name('employee.timesheet');


//Designation routes
Route::resource('designations', DesignationController::class);

//News routes
Route::resource('news', NewsController::class);

//Holiday routes
Route::resource('holidays', HolidayController::class);

//Leave routes
Route::resource('leaves', LeaveController::class);

//Client routes
Route::resource('clients', ClientController::class);
Route::get('/client/{id}/details', [ClientDetailsController::class, 'showDetails'])->name('client.details');

// No. of clients routes
Route::get('/client', [ClientController::class, 'index'])->name('client.index');
Route::get('/home', [HomeController::class, 'index'])->name('home');

// Route::get('/client/{id}/projects', [ClientDetailsController::class, 'getFilteredProjects']);


//Project routes
Route::resource('projects', ProjectController::class);
Route::get('/project/{id}/details', [ProjectDetailsController::class, 'show'])->name('project.details');
Route::get('/project/{id}', [ProjectDetailsController::class, 'show'])->name('project.details');

// No. of project routes
Route::get('/projects', [ProjectController::class, 'index'])->name('projects.index');

Route::get('/employee-details/{id}', [DetailsEmployeeController::class, 'show'])->name('employee.details');
Route::get('/employee-invoice/{id}', [DetailsEmployeeController::class, 'invoice'])->name('employee.invoice');
Route::get('/profile-invoice/{id}', [ProfileController::class, 'invoice'])->name('profile.invoice');
Route::get('/payslip/{id}', [PaySlipController::class, 'showInvoice'])->name('payslip.show');

// Invoice
Route::get('/getPaymentDetails/{roleId}', [PaymentController::class, 'getPaymentDetails']);

// Payslip of Project
// Route::get('project/payslip', [PaySlipController::class, 'show'])->name('payslip.show');

Route::get('/payslip', function () {
    return view('backend/project/payslip'); // Return the payslip view
})->name('payslip');

// web.php
Route::get('project/details/{id}', [ProjectDetailsController::class, 'show'])->name('project.details');

// routes/web.php
Route::get('/deductions', [DeductionController::class, 'index'])->name('deductions.index');
Route::post('/deductions/display', [DeductionController::class, 'displayExcelData'])->name('deductions.displayExcelData');



//FileUpload routes
Route::resource('upload', UploadController::class);
Route::get('get_uploaded_files', [App\Http\Controllers\UploadController::class, 'get_uploaded_files'])->name('get_uploaded_files');
Route::post('upload_file', [App\Http\Controllers\UploadController::class, 'upload'])->name('upload_file');

//Location routes
Route::resource('locations', LocationController::class);

Route::get('track', [App\Http\Controllers\TrackEmployeeController::class, 'index'])->name('track');

Route::get('present_employees', [App\Http\Controllers\EmployeeController::class, 'present_employees'])->name('present_employees');

Route::get('absent_employees', [App\Http\Controllers\EmployeeController::class, 'absent_employees'])->name('absent_employees');

Route::get('employees', [App\Http\Controllers\EmployeeController::class, 'employees'])->name('employees');

Route::get('update_status', [App\Http\Controllers\EmployeeController::class, 'update_status'])->name('users.update_status');

Route::get('leave_update_status', [App\Http\Controllers\LeaveController::class, 'leave_update_status'])->name('leaves.leave_update_status');

Route::get('get_employee_code', [App\Http\Controllers\EmployeeController::class, 'get_employee_code'])->name('users.get_employee_code');
Route::get('get_employee', [App\Http\Controllers\EmployeeController::class, 'get_employee'])->name('users.get_employee');

//Payroll routes
Route::resource('payrolls', PayrollController::class);
Route::get('approve_payroll', [App\Http\Controllers\PayrollController::class, 'approve_payroll'])->name('payrolls.approve_payroll');
Route::get('record_payment', [App\Http\Controllers\PayrollController::class, 'record_payment'])->name('payrolls.record_payment');
Route::get('get_payslip', [App\Http\Controllers\PayrollController::class, 'get_payslip'])->name('payrolls.get_payslip');
Route::get('payroll_history', [App\Http\Controllers\PayrollController::class, 'payroll_history'])->name('payrolls.payroll_history');
Route::get('payroll_employee', [App\Http\Controllers\PayrollController::class, 'payroll_employee'])->name('payrolls.payroll_employee');
Route::get('get_payslip_employee', [App\Http\Controllers\PayrollController::class, 'get_payslip_employee'])->name('payrolls.get_payslip_employee');

//Payroll Hourly routes
Route::resource('payrolls_hourly', PayrollHourlyController::class);
Route::get('approve_payroll_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'approve_payroll_hourly'])->name('payrolls_hourly.approve_payroll_hourly');
Route::get('record_payment_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'record_payment_hourly'])->name('payrolls_hourly.record_payment_hourly');
Route::get('get_payslip_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'get_payslip_hourly'])->name('payrolls_hourly.get_payslip_hourly');
Route::get('payroll_history_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'payroll_history_hourly'])->name('payrolls_hourly.payroll_history_hourly');
Route::get('payroll_employee_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'payroll_employee_hourly'])->name('payrolls_hourly.payroll_employee_hourly');
Route::get('get_payslip_employee_hourly', [App\Http\Controllers\PayrollHourlyController::class, 'get_payslip_employee_hourly'])->name('payrolls_hourly.get_payslip_employee_hourly');

//Deduction routes
Route::resource('deductions', DeductionController::class);

//Rate routes
Route::resource('rates', RateController::class);

Route::post('/import-excel', [App\Http\Controllers\ExcelImportController::class,'import'])->name('import.excel');
Route::get('import-excel', [App\Http\Controllers\ExcelImportController::class,'index'])->name('import-excel');
Route::post('/import_hourly-excel', [App\Http\Controllers\ExcelImportController::class,'import_hourly'])->name('import_hourly.excel');
Route::post('/import_deduction-excel', [App\Http\Controllers\ExcelImportController::class,'import_deduction'])->name('import_deduction.excel');
Route::post('/import_rate-excel', [App\Http\Controllers\ExcelImportController::class,'import_rate'])->name('import_rate.excel');

Route::get('pdf', [PdfController::class, 'index'])->name('pdf');

});



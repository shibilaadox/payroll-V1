<?php

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
use App\Http\Controllers\DeductionController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\ExcelImportController;
use App\Http\Controllers\PdfController;
use App\Http\Controllers\ProjectDetailsController;
use Illuminate\Support\Facades\Auth;

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

//Project routes
Route::resource('projects', ProjectController::class);
Route::get('/project/{id}/details', [ProjectDetailsController::class, 'show'])->name('project.details');
// Route::get('/project/{id}', [App\Http\Controllers\ProjectDetailsController::class, 'show'])->name('project.details');
Route::get('/project/{id}', [ProjectDetailsController::class, 'show'])->name('project.details');


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

//Payroll routes
Route::resource('payrolls', PayrollController::class);
Route::get('approve_payroll', [App\Http\Controllers\PayrollController::class, 'approve_payroll'])->name('payrolls.approve_payroll');
Route::get('record_payment', [App\Http\Controllers\PayrollController::class, 'record_payment'])->name('payrolls.record_payment');
Route::get('get_payslip', [App\Http\Controllers\PayrollController::class, 'get_payslip'])->name('payrolls.get_payslip');
Route::get('payroll_history', [App\Http\Controllers\PayrollController::class, 'payroll_history'])->name('payrolls.payroll_history');
Route::get('payroll_employee', [App\Http\Controllers\PayrollController::class, 'payroll_employee'])->name('payrolls.payroll_employee');
Route::get('get_payslip_employee', [App\Http\Controllers\PayrollController::class, 'get_payslip_employee'])->name('payrolls.get_payslip_employee');


//Deduction routes
Route::resource('deductions', DeductionController::class);

Route::post('/import-excel', [App\Http\Controllers\ExcelImportController::class,'import'])->name('import.excel');
Route::get('import-excel', [App\Http\Controllers\ExcelImportController::class,'index'])->name('import-excel');
Route::post('/import_hourly-excel', [App\Http\Controllers\ExcelImportController::class,'import_hourly'])->name('import_hourly.excel');

Route::get('pdf', [PdfController::class, 'index'])->name('pdf');

});



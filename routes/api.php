<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\TimesheetController;
use App\Http\Controllers\API\ProfileController;
use App\Http\Controllers\API\StickeyController;
use App\Http\Controllers\API\TrackEmployeeController;
use App\Http\Controllers\API\AlertsController;
use App\Http\Controllers\API\ExpiryController;
use App\Http\Controllers\API\LeaveController;
use App\Http\Controllers\API\FeedbackController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\ProjectController;
use App\Http\Controllers\API\ClientController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {

    Route::post('updateAttendance', [TimesheetController::class, 'updateAttendance']);
    
    Route::post('updateImage', [ProfileController::class, 'updateImage']);
    
    Route::post('updateProfile', [ProfileController::class, 'updateProfile']);
    
    Route::get('getLog', [TimesheetController::class, 'getLog']);
    
    Route::get('getUserDetails', [AuthController::class, 'getUserDetails']);
    
    Route::get('getAllLogs', [TimesheetController::class, 'getAllLogs']);
    
    Route::get('homeCount', [TimesheetController::class, 'homeCount']);
    
    Route::post('getLogByDate', [TimesheetController::class, 'getLogByDate']);

    Route::post('Add_Sticky', [StickeyController::class, 'Add_Sticky']);
    Route::post('Get_sticky', [StickeyController::class, 'Get_sticky']);
    Route::post('Delete_Sticky', [StickeyController::class, 'Delete_Sticky']);
    
    Route::post('storeLocation', [TrackEmployeeController::class, 'storeLocation']);
    Route::post('getLocation', [TrackEmployeeController::class, 'getLocation']);
    
    Route::get('checkDistance', [TrackEmployeeController::class, 'checkDistance']);
    
    Route::get('locationList', [TrackEmployeeController::class, 'locationList']);
    
    Route::get('getAlerts', [AlertsController::class, 'getAlerts']);
    
    Route::post('addOrEditExpiry', [ExpiryController::class, 'addOrEditExpiry']);
    Route::post('delete_Expiry', [ExpiryController::class, 'delete_Expiry']);
    
    Route::get('get_Expirydata', [ExpiryController::class, 'get_Expirydata']);
    
    
    //New
    Route::get('Get_complete_log', [TimesheetController::class, 'Get_complete_log']);
    
    Route::post('Get_leave', [LeaveController::class, 'Get_leave']);
    Route::post('Add_leave', [LeaveController::class, 'Add_leave']);
//  Route::post('Add_leave_day', [LeaveController::class, 'Add_leave_day']);
//  Route::post('Add_leave_hour', [LeaveController::class, 'Add_leave_hour']);
    Route::post('Get_leave_by_id', [LeaveController::class, 'Get_leave_by_id']);
    Route::post('Edit_leave_hour', [LeaveController::class, 'Edit_leave_hour']);
    Route::post('Edit_leave_day', [LeaveController::class, 'Edit_leave_day']);
    
    Route::post('Add_feedback', [FeedbackController::class, 'Add_feedback']);
    
    Route::get('Get_employee_count', [UserController::class, 'Get_employee_count']);
    Route::post('Get_employee_list', [UserController::class, 'Get_employee_list']);
    
    Route::get('getProjects', [ProjectController::class, 'getProjects']);
    
    Route::get('getClients', [ClientController::class, 'getClients']);
});

 



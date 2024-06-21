<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeTimesheet extends Model
{
    use HasFactory;
    protected $table = "employee_timesheet";
    protected $fillable = ['user_id','days_worked','month'];
}

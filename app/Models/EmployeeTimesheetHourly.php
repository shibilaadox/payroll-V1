<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeTimesheetHourly extends Model
{
    use HasFactory;
    protected $table = "employee_timesheet_hourly";
    protected $fillable = ['user_id','date', 'year', 'month', 'week','code','ptype','compcd','clientcd', 'branch','posicode','cont_no','sub_no','ot1_hrs', 'ot1_amt', 'ot2_hrs', 'ot2_amt', 'ot3_hrs', 'ot3_amt', 'ot4_hrs', 'ot4_amt', 'ot5_hrs', 'ot5_amt', 'ot6_hrs', 'ot6_amt', 'ot7_hrs', 'ot7_amt', 'ot8_hrs', 'ot8_amt', 'ot9_hrs', 'ot9_amt', 'ot10_hrs', 'ot10_amt', 'ot11_hrs', 'ot11_amt', 'ot12_hrs', 'ot12_amt', 'ot13_hrs', 'ot13_amt','day8','day8_rate','day8_pay','day12','day12_rate','day12_pay','nd_days','nd_amt','undertime','under_amt','ecola','incentive','gross_pay'];
}

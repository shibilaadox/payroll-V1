<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientTimesheet extends Model
{
    use HasFactory;
    protected $table = 'client_timesheets';

    protected $fillable = [
        // 'employee_id',
        'client_id',
        'branch_id',
        'pay_type',
        'payroll_period_start',
        'payroll_period_end',
        'payroll_date',
        'week_number',
        'month',
        'year',
        'hours_worked',
        'overtime_hours',
    ];

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function branch()
    {
        return $this->belongsTo(EmployeeTimesheetHourly::class, 'branch_id');
    }
}

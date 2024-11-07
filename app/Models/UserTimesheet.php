<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserTimesheet extends Model
{
    use HasFactory;
    protected $table = 'user_timesheets';

    protected $fillable = [
        'user_id',
        'employee_code',
        'client_id',
        'location_id',
        'pay_type',
        'payroll_period_start',
        'payroll_period_end',
        'payroll_date',
        'week_number',
        'month',
        'year',
        'date',
        'company_code',
        'posicode',
        'ot1_hrs',
        'ot2_hrs',
        'ot3_hrs',
        'ot4_hrs',
        'ot5_hrs',
        'ot6_hrs',
        'ot7_hrs',
        'ot8_hrs',
        'ot9_hrs',
        'ot10_hrs',
        'ot11_hrs',
        'ot12_hrs',
        'ot13_hrs',
        'day8',
        'day8_rate',
        'day12',
        'day12_rate',
        'nd_days',
        'undertime',
        'incentive'

    ];

    public function client()
    {
        return $this->belongsTo(Client::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}

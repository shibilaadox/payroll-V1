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
        'client_id',
        'location_id',
        'pay_type',
        'payroll_period_start',
        'payroll_period_end',
        'payroll_date',
        'week_number',
        'month',
        'year',
        
    ];

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
}

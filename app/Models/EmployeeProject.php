<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeProject extends Model
{
    use HasFactory;
    protected $table = "employee_projects";
    protected $fillable = [
        'user_id',
        'project_id',
        'payment',
        'month',
        'mode',
        'role',
        'aadhaar_no',
        'sss_no',
        'philhealth_no',
        'hdmf',
        'tax_identification_no',
        'pan_no',
        'license_no',
        'license_expiration_date',
        'bank_and_account_no',
        'annual_ctc',
        'pay_type',
        'regular_rate'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
}

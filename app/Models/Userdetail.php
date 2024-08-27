<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Userdetail extends Model
{
    use HasFactory;
    
    protected $table = 'userdetails';
    protected $fillable = ['user_id','adhaar_no','designation','department','whatsapp_no','academic_qualification','experience_certificate','contract_starting_date','contract_ending_date','reason_for_leaving','blood_group','marital_status','joining_date','pan_no','emergency_no','basic_salary','house_rent_allowance','conveyance_allowance','fixed_allowance','resigned_date','location','sss_number','licene_number','philHealth_number','license_exp_date','hdmf_number','bank_and_account_number','tax_identification_number','salary_pay_type','regular_rate_for'];

    
    public function departments()
    {
        return $this->belongsTo(\App\Models\Department::class,'department','id')->withDefault();
    }
    
    public function department()
    {
        return $this->belongsTo(\App\Models\Department::class,'department','id')->withDefault();
    }

    public function locations()
    {
        return $this->belongsTo(\App\Models\Location::class,"location","id")->withDefault();
    }
    
    public function designations()
    {
        return $this->belongsTo(\App\Models\Designation::class,"designation","id")->withDefault();
    }
}

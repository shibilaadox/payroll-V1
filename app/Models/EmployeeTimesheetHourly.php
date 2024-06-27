<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeTimesheetHourly extends Model
{
    use HasFactory;
    protected $table = "employee_timesheet_hourly";
    protected $fillable = ['pdate', 'year', 'month', 'week','code','compcd', 'ptype', 'clientcd', 'branch', 'reg_date', 'year_date', 'unmin', 'unamt', 'abday', 'abamt', 'vltak', 'vlamt', 'vlday', 'sltak', 'slamt', 'slday', 'incentive', 'reg_day', 'reg_pay', 'nd_days', 'gross_pay', 'nd_amt', 'ecola', 'sea', 'emss', 'erss', 'ecc', 'emprov', 'erprov', 'emmedi', 'ermedi', 'empagi','erpagi','wtax', 'ss_hd_loan', 'co_loan', 'totloan', 'bond', 'tded', 'net_pay', 'r12_rate', 'r12_day', 'r12_pay', 'ot1_hrs', 'ot1_amt', 'ot2_hrs', 'ot2_amt', 'ot3_hrs', 'ot3_amt', 'ot4_hrs', 'ot4_amt', 'ot5_hrs', 'ot5_amt', 'ot6_hrs', 'ot6_amt', 'ot7_hrs', 'ot7_amt', 'ot8_hrs', 'ot8_amt', 'ot9_hrs', 'ot9_amt', 'ot10_hrs', 'ot10_amt', 'ot11_hrs', 'ot11_amt', 'ot12_hrs', 'ot12_amt', 'ot13_hrs', 'ot13_amt', 'ottot', 'adjamt', 'r12_net', 'net_net', 'taxable', 'transpo', 'meal', 'oth_allow', 'cashadv', 'take_home', 'insurance', 'pay_13', 'vartran', 'bnk_adv', 'sss_amt', 'max_client', 'max_branch', 'hdmf_sav', 'contr_amt', 'ph_amt', 'uniform'];
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Leave;
use App\Models\User;
use App\Models\Roles;
use App\Models\Rate;
use App\Models\OvertimeRate;
use App\Models\SssRate;
use App\Models\Firebase;
use App\Models\Deduction;
use App\Models\Client;
use App\Models\Paymentstatus;
use App\Models\EmployeeTimesheet;
use DataTables;
use Carbon;
use DateTime;

class PayrollHourlyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $data['employee'] = User::with('usertimesheet')->has('usertimesheet')->whereHas('usertimesheet', function ($query) {

            return $query->where('month',date('m'));

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with('userdetails')->with('usertimesheet')->has('usertimesheet')->whereHas('usertimesheet', function ($query) {

            return $query->where('month',date('m'));

        })->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       
        foreach ($data['employees'] as $row1){

            $TOTAL_overtime=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_RP = 0;
            
            foreach($row1->usertimesheet as $row){
                
                
                if($row1->id == $row->user_id){
                    
                    $j++;

                    $id = $row->user_id;

                    $RegP = $row->day8*$row->day8_rate;

                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;

                    $TOTAL_RP = $TOTAL_RP+$RegP+$Pay12;

                    $UA = $row->undertime * ($row->day8_rate/60);
                    $TOTAL_UA = $TOTAL_UA+$UA;

                    $ot_rate = OvertimeRate::first();

                    $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                    $ot2 = $row->o21_hrs*$ot_rate->rate2;
                    $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                    $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                    $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                    $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                    $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                    $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                    $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                    $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                    $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                    $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                    $ot13 = $row->ot13_hrs*$ot_rate->rate13;

                    $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                    $TOTAL_OT + $TOTAL_OT+$OT;

                    $role = $row->posicode;

                    $rate_data = Rate::first();

                    $ND_rate = $rate_data->nd;

                    $COLA_rate = $rate_data->cola;

                    $COLA = $COLA_rate * $j;

                    $ND = $ND_rate * $row->nd_days;

                    $SI = $row->incentive;

                    $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                    
                    $TOTAL_GP = $TOTAL_GP + $GP;

                }

            }

            $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);

            if($taxable_income<10000)
            $EMPH = 0;
            else 
            $EMPH = (5 * $taxable_income)/100;

            $EMHDMF = 200;
            
            $sss_rates = SssRate::all();

            foreach($sss_rates as $row2)
            {
                if($taxable_income<=$row2->limit)
                {
                    $EMSSS = $row2->emply;
                    break;
                }
            }
            

            if($taxable_income<=20833)
            $tax = 0;
            else if($taxable_income>20833 && $GP<33332)
            $tax = 0 + (15* ($taxable_income - 20833)/100);
            else if($taxable_income>33333 && $GP<66666)
            $tax = 1875+ (20* ($taxable_income - 33333)/100);
            else if($taxable_income>66666 && $GP<166666)
            $tax = 8541.80+(25* ($taxable_income - 66667)/100);
            else if($taxable_income>166666 && $GP<666666)
            $tax = 33541.80+(30* ($taxable_income - 166667)/100);
            else if($taxable_income>666666)
            $tax = 183541.80+(35* ($taxable_income - 666667)/100);
            

            $deductions = $EMPH+$EMHDMF+$EMSSS;

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',date('m'))->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            $TOTAL_EMPH = $TOTAL_EMPH+$EMPH;
            $TOTAL_EMHDMF = $TOTAL_EMHDMF+$EMHDMF;
            $TOTAL_EMSSS = $TOTAL_EMSSS+$EMSSS;
            $TOTAL_tax = $TOTAL_tax+$tax;

        }

        $TOTAL_deductions = $TOTAL_EMHDMF+$TOTAL_EMPH+$TOTAL_EMSSS;

        $data['net_pay_total'] = $TOTAL_GP - $TOTAL_deductions - $TOTAL_tax - $TOTAL_DEDUCTION;

        $data['clients'] = Client::all();

        return view('backend.payroll_hourly.payroll', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      
        $payroll_period_start = $_GET['payroll_period_start']; $payroll_period_end = $_GET['payroll_period_end']; $client = $_GET['client'];
        
        $time=strtotime($payroll_period_start);
        $month=date("m",$time);
        $day_start = date("d",strtotime($payroll_period_start));
        $day_end = date("d",strtotime($payroll_period_end));
        if($day_start==01 && $day_end==15)
        $week = "A";
        else
        $week = "B";

        $data['employee_count'] = User::with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->has('usertimesheet')->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();


        $j = 0 ;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       
        foreach ($data['employees'] as $row1){
           $TOTAL_overtime=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_RP = 0;
       
            foreach($row1->usertimesheet as $row){
                
                
                if($row1->id == $row->user_id){
                    
                    $j++;

                    $id = $row->user_id;

                    $RegP = $row->day8*$row->day8_rate;

                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;

                    $TOTAL_RP = $TOTAL_RP+$RegP+$Pay12;

                    $UA = $row->undertime * ($row->day8_rate/60);
                    $TOTAL_UA = $TOTAL_UA+$UA;

                    $ot_rate = OvertimeRate::first();

                    $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                    $ot2 = $row->o21_hrs*$ot_rate->rate2;
                    $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                    $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                    $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                    $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                    $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                    $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                    $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                    $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                    $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                    $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                    $ot13 = $row->ot13_hrs*$ot_rate->rate13;

                    $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                    $TOTAL_OT + $TOTAL_OT+$OT;

                    $role = $row->posicode;

                    $rate_data = Rate::first();

                    $ND_rate = $rate_data->nd;

                    $COLA_rate = $rate_data->cola;

                    $COLA = $COLA_rate * $j;

                    $ND = $ND_rate * $row->nd_days;

                    $SI = $row->incentive;

                    $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                    
                    $TOTAL_GP = $TOTAL_GP + $GP;

                }

            }

            $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);

            if($taxable_income<10000)
            $EMPH = 0;
            else 
            $EMPH = (5 * $taxable_income)/100;

            $EMHDMF = 200;
            
            $sss_rates = SssRate::all();

            foreach($sss_rates as $row2)
            {
                if($taxable_income<=$row2->limit)
                {
                    $EMSSS = $row2->emply;
                    break;
                }
            }
            

            if($taxable_income<=20833)
            $tax = 0;
            else if($taxable_income>20833 && $GP<33332)
            $tax = 0 + (15* ($taxable_income - 20833)/100);
            else if($taxable_income>33333 && $GP<66666)
            $tax = 1875+ (20* ($taxable_income - 33333)/100);
            else if($taxable_income>66666 && $GP<166666)
            $tax = 8541.80+(25* ($taxable_income - 66667)/100);
            else if($taxable_income>166666 && $GP<666666)
            $tax = 33541.80+(30* ($taxable_income - 166667)/100);
            else if($taxable_income>666666)
            $tax = 183541.80+(35* ($taxable_income - 666667)/100);
            

            $deductions = $EMPH+$EMHDMF+$EMSSS;

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',$month)->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            $TOTAL_EMPH = $TOTAL_EMPH+$EMPH;
            $TOTAL_EMHDMF = $TOTAL_EMHDMF+$EMHDMF;
            $TOTAL_EMSSS = $TOTAL_EMSSS+$EMSSS;
            $TOTAL_tax = $TOTAL_tax+$tax;

        }

        $TOTAL_deductions = $TOTAL_EMHDMF+$TOTAL_EMPH+$TOTAL_EMSSS;

        $data['gross_pay_total'] = $TOTAL_GP;
        $data['net_pay_total'] = $TOTAL_GP - $TOTAL_deductions - $TOTAL_tax - $TOTAL_DEDUCTION;
        $data['EMHMDF'] = $TOTAL_EMHDMF;
        $data['EMPH'] = $TOTAL_EMPH;
        $data['EMSSS'] = $TOTAL_EMSSS;
        $data['TAX'] = $TOTAL_tax;
       
        $data['other_ded'] = $TOTAL_DEDUCTION;
        $data['deduction_total'] = $TOTAL_deductions+$TOTAL_DEDUCTION;
        return view('backend.payroll_hourly.payroll_details', ['data' => $data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function approve_payroll_hourly()
    {

        $payroll_period_start = $_GET['payroll_period_start']; $payroll_period_end = $_GET['payroll_period_end']; $client = $_GET['client'];
        $time=strtotime($payroll_period_start);
        $month=date("m",$time);
        $month_words=date("F",$time);
        $day_start = date("d",strtotime($_GET['payroll_period_start']));
        $day_end = date("d",strtotime($_GET['payroll_period_end']));
        if($day_start==01 && $day_end==15)
        $week = "A";
        else
        $week = "B";

        $data['employee_count'] = User::with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->has('usertimesheet')->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       
        foreach ($data['employees'] as $row1){
           $TOTAL_overtime=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_RP = 0;
       
            foreach($row1->usertimesheet as $row){
                
                
                if($row1->id == $row->user_id){
                    
                    $j++;

                    $id = $row->user_id;

                    $RegP = $row->day8*$row->day8_rate;

                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;

                    $TOTAL_RP = $TOTAL_RP+$RegP+$Pay12;

                    $UA = $row->undertime * ($row->day8_rate/60);
                    $TOTAL_UA = $TOTAL_UA+$UA;

                    $ot_rate = OvertimeRate::first();

                    $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                    $ot2 = $row->o21_hrs*$ot_rate->rate2;
                    $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                    $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                    $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                    $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                    $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                    $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                    $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                    $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                    $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                    $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                    $ot13 = $row->ot13_hrs*$ot_rate->rate13;

                    $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                    $TOTAL_OT + $TOTAL_OT+$OT;

                    $role = $row->posicode;

                    $rate_data = Rate::first();

                    $ND_rate = $rate_data->nd;

                    $COLA_rate = $rate_data->cola;

                    $COLA = $COLA_rate * $j;

                    $ND = $ND_rate * $row->nd_days;

                    $SI = $row->incentive;

                    $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                    
                    $TOTAL_GP = $TOTAL_GP + $GP;

                }

            }

            $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);

            if($taxable_income<10000)
            $EMPH = 0;
            else 
            $EMPH = (5 * $taxable_income)/100;

            $EMHDMF = 200;
            
            $sss_rates = SssRate::all();

            foreach($sss_rates as $row2)
            {
                if($taxable_income<=$row2->limit)
                {
                    $EMSSS = $row2->emply;
                    break;
                }
            }
            

            if($taxable_income<=20833)
            $tax = 0;
            else if($taxable_income>20833 && $GP<33332)
            $tax = 0 + (15* ($taxable_income - 20833)/100);
            else if($taxable_income>33333 && $GP<66666)
            $tax = 1875+ (20* ($taxable_income - 33333)/100);
            else if($taxable_income>66666 && $GP<166666)
            $tax = 8541.80+(25* ($taxable_income - 66667)/100);
            else if($taxable_income>166666 && $GP<666666)
            $tax = 33541.80+(30* ($taxable_income - 166667)/100);
            else if($taxable_income>666666)
            $tax = 183541.80+(35* ($taxable_income - 666667)/100);
            

            $deductions = $EMPH+$EMHDMF+$EMSSS;

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',$month)->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            $TOTAL_EMPH = $TOTAL_EMPH+$EMPH;
            $TOTAL_EMHDMF = $TOTAL_EMHDMF+$EMHDMF;
            $TOTAL_EMSSS = $TOTAL_EMSSS+$EMSSS;
            $TOTAL_tax = $TOTAL_tax+$tax;

        }

        $TOTAL_deductions = $TOTAL_EMHDMF+$TOTAL_EMPH+$TOTAL_EMSSS;

        $data['gross_pay_total'] = $TOTAL_GP;
        $data['net_pay_total'] = $TOTAL_GP - $TOTAL_deductions - $TOTAL_tax - $TOTAL_DEDUCTION;
        $data['EMHMDF'] = $TOTAL_EMHDMF;
        $data['EMPH'] = $TOTAL_EMPH;
        $data['EMSSS'] = $TOTAL_EMSSS;
        $data['TAX'] = $TOTAL_tax;
       
        $data['other_ded'] = $TOTAL_DEDUCTION;
        $data['deduction_total'] = $TOTAL_deductions+$TOTAL_DEDUCTION;
        return view('backend.payroll_hourly.payroll_details_approve', ['data' => $data]);
    }

    public function record_payment_hourly($payroll_period_start,$payroll_period_end)
    {
        $id = $_GET['id'];
        $time=strtotime($payroll_period_start);
        $month=date("m",$time);
        $month_words=date("F",$time);
        $day_start = date("d",strtotime($payroll_period_start));
        $day_end = date("d",strtotime($payroll_period_end));
        if($day_start==01 && $day_end==15)
        $week = "A";
        else
        $week = "B";
        

        foreach ($id as $row)
        {
            $array = explode(',', $row);
            $check = Paymentstatus::where('user_id',$array[0])->where('month',$month_words)->where('week',$week)->first();

            if(empty($check)){
            Paymentstatus::create([
                'user_id'=> $row,
                'status'=>1,
                'month'=> $month_words,
                'week'=>$week,
                'amount'=>$array[1]
            ]);
            }
        }
    }

    public function get_payslip_hourly($payroll_period_start,$payroll_period_end,$client)
    {
        $id = $_GET['id'];
        $time=strtotime($payroll_period_start);
        $month=date("m",$time);
        $month_words=date("F",$time);
        $day_start = date("d",strtotime($payroll_period_start));
        $day_end = date("d",strtotime($payroll_period_end));
        if($day_start==01 && $day_end==15)
        $week = "A";
        else
        $week = "B";
        
        $data['employee'] = User::with('userdetails')->with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->has('usertimesheet')->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);


        })->where('id',$id)->first();


        $j = 0 ;$no_8_days=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;

                                        foreach($data['employee']->usertimesheet as $row){

                                
                                            $j++;

                                            $id = $row->user_id;

                                            $no_8_days = $no_8_days + $row->day8;
                        
                                            $RegP = $row->day8*$row->day8_rate;
                        
                                            if($row->day12==4)
                                            $Pay12 = $row->day12_rate-$RegP;
                                            else
                                            $Pay12 = $row->day8_rate*$row->day12;

                                            $TOTAL_RP = $TOTAL_RP+$RegP+$Pay12;
                        
                                            $UA = $row->undertime * ($row->day8_rate/60);
                                            $TOTAL_UA = $TOTAL_UA+$UA;
                        
                                            $ot_rate = OvertimeRate::first();
                        
                                            $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                                            $ot2 = $row->o21_hrs*$ot_rate->rate2;
                                            $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                                            $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                                            $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                                            $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                                            $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                                            $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                                            $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                                            $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                                            $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                                            $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                                            $ot13 = $row->ot13_hrs*$ot_rate->rate13;
                        
                                            $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                                            $TOTAL_OT + $TOTAL_OT+$OT;
                        
                                            $role = $row->posicode;
                        
                                            $rate_data = Rate::first();
                        
                                            $ND_rate = $rate_data->nd;
                        
                                            $COLA_rate = $rate_data->cola;
                        
                                            $COLA = $COLA_rate * $j;
                        
                                            $ND = $ND_rate * $row->nd_days;
                        
                                            $SI = $row->incentive;
                        
                                            $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                                            
                                            $TOTAL_GP = $TOTAL_GP + $GP;
                        
                                       
                        
                                    $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);
                        
                                    if($taxable_income<10000)
                                    $EMPH = 0;
                                    else 
                                    $EMPH = (5 * $taxable_income)/100;
                        
                                    $EMHDMF = 200;
                                    
                                    $sss_rates = SssRate::all();
                        
                                    foreach($sss_rates as $row2)
                                    {
                                        if($taxable_income<=$row2->limit)
                                        {
                                            $EMSSS = $row2->emply;
                                            break;
                                        }
                                    }
                                    
                        
                                    if($taxable_income<=20833)
                                    $tax = 0;
                                    else if($taxable_income>20833 && $GP<33332)
                                    $tax = 0 + (15* ($taxable_income - 20833)/100);
                                    else if($taxable_income>33333 && $GP<66666)
                                    $tax = 1875+ (20* ($taxable_income - 33333)/100);
                                    else if($taxable_income>66666 && $GP<166666)
                                    $tax = 8541.80+(25* ($taxable_income - 66667)/100);
                                    else if($taxable_income>166666 && $GP<666666)
                                    $tax = 33541.80+(30* ($taxable_income - 166667)/100);
                                    else if($taxable_income>666666)
                                    $tax = 183541.80+(35* ($taxable_income - 666667)/100);
                                    
                        
                                    $deductions = $EMPH+$EMHDMF+$EMSSS;
                        
                                    $DEDUCTION = Deduction::where('user_id',$id)->where('month',$month)->sum('ded_amount');
                                    $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
                                   

                                          }
        $data['net_pay'] = $NET_PAY;

        $data['status'] = Paymentstatus::where('user_id',$id)->where('month',$month_words)->where('week',$week)->first();

        $data['paid_days'] = $no_8_days;
        $data['gross_pay']= $TOTAL_GP;
        $data['other_ded'] = $DEDUCTION;
        $data['gross_pay'] = $TOTAL_GP;
        $data['net_pay'] = $TOTAL_GP - $deductions - $tax - $DEDUCTION;
        $data['EMHMDF'] = $EMHDMF;
        $data['EMPH'] = $EMPH;
        $data['EMSSS'] = $EMSSS;
        $data['tax'] = $tax;
        $data['deduction_total'] = $deductions+$DEDUCTION;
        return view('backend.payroll_hourly.payroll_ajax',['data'=>$data]);
    }

    public function payroll_month(Request $request)
    {

        $payroll_period_start = $_GET['payroll_period_start']; $payroll_period_end = $_GET['payroll_period_end']; $client = $_GET['client'];

        $data['employee_count'] = User::with('usertimesheet')->has('usertimesheet')->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with(['usertimesheet' => function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        }])->whereHas('usertimesheet', function ($query) use($client,$payroll_period_start,$payroll_period_end){

            return $query->where('payroll_period_start',$payroll_period_start)->where('payroll_period_end',$payroll_period_end)->where('client_id',$client);

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       
        foreach ($data['employees'] as $row1){

            $TOTAL_overtime=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_RP = 0;
            
            foreach($row1->usertimesheet as $row){
                
                
                if($row1->id == $row->user_id){
                    
                    $j++;

                    $id = $row->user_id;

                    $RegP = $row->day8*$row->day8_rate;

                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;

                    $TOTAL_RP = $TOTAL_RP+$RegP+$Pay12;

                    $UA = $row->undertime * ($row->day8_rate/60);
                    $TOTAL_UA = $TOTAL_UA+$UA;

                    $ot_rate = OvertimeRate::first();

                    $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                    $ot2 = $row->o21_hrs*$ot_rate->rate2;
                    $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                    $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                    $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                    $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                    $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                    $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                    $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                    $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                    $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                    $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                    $ot13 = $row->ot13_hrs*$ot_rate->rate13;

                    $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                    $TOTAL_OT + $TOTAL_OT+$OT;

                    $role = $row->posicode;

                    $rate_data = Rate::first();

                    $ND_rate = $rate_data->nd;

                    $COLA_rate = $rate_data->cola;

                    $COLA = $COLA_rate * $j;

                    $ND = $ND_rate * $row->nd_days;

                    $SI = $row->incentive;

                    $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                    
                    $TOTAL_GP = $TOTAL_GP + $GP;

                }

            }

            $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);

            if($taxable_income<10000)
            $EMPH = 0;
            else 
            $EMPH = (5 * $taxable_income)/100;

            $EMHDMF = 200;
            
            $sss_rates = SssRate::all();

            foreach($sss_rates as $row2)
            {
                if($taxable_income<=$row2->limit)
                {
                    $EMSSS = $row2->emply;
                    break;
                }
            }
            

            if($taxable_income<=20833)
            $tax = 0;
            else if($taxable_income>20833 && $GP<33332)
            $tax = 0 + (15* ($taxable_income - 20833)/100);
            else if($taxable_income>33333 && $GP<66666)
            $tax = 1875+ (20* ($taxable_income - 33333)/100);
            else if($taxable_income>66666 && $GP<166666)
            $tax = 8541.80+(25* ($taxable_income - 66667)/100);
            else if($taxable_income>166666 && $GP<666666)
            $tax = 33541.80+(30* ($taxable_income - 166667)/100);
            else if($taxable_income>666666)
            $tax = 183541.80+(35* ($taxable_income - 666667)/100);
            

            $deductions = $EMPH+$EMHDMF+$EMSSS;

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',date('F',strtotime('last month')))->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            $TOTAL_EMPH = $TOTAL_EMPH+$EMPH;
            $TOTAL_EMHDMF = $TOTAL_EMHDMF+$EMHDMF;
            $TOTAL_EMSSS = $TOTAL_EMSSS+$EMSSS;
            $TOTAL_tax = $TOTAL_tax+$tax;

        }

        $TOTAL_deductions = $TOTAL_EMHDMF+$TOTAL_EMPH+$TOTAL_EMSSS;

        $data['net_pay_total'] = $TOTAL_GP - $TOTAL_deductions - $TOTAL_tax - $TOTAL_DEDUCTION;

        $data['clients'] = Client::all();

        return $data['net_pay_total']."/".$data['employee_count'];
    }





}

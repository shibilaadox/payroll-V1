<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Leave;
use App\Models\User;
use App\Models\Firebase;
use App\Models\Deduction;
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
      
        $data['employee'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with('userdetails')->with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

        foreach ($data['employees'] as $row1){

            foreach($row1->user_timesheet_hourly as $row){

          
                if($row1->id == $row->user_id){

                   
                    $j++;

                    $no_8_days = $no_8_days + $row->day8;

                    $RegP = $row->day8*$row->day8_rate;

                    $TOTAL_RP = $TOTAL_RP+$RegP;
        
                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;
        
                    $UA = $row->undertime * ($row->day8_rate/60);
        
                    $ot1 = $row->ot1_hrs;
                    $ot2 = $row->o21_hrs;
                    $ot3 = $row->ot3_hrs;
                    $ot4 = $row->ot4_hrs;
                    $ot5 = $row->ot5_hrs;
                    $ot6 = $row->ot6_hrs;
                    $ot7 = $row->ot7_hrs;
                    $ot8 = $row->ot8_hrs;
                    $ot9 = $row->ot9_hrs;
                    $ot10 = $row->ot10_hrs;
                    $ot11 = $row->ot11_hrs;
                    $ot12 = $row->ot12_hrs;
                    $ot13 = $row->ot13_hrs;
        
                    $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;

                    $OT_premium = $row->day8_rate * 1.10;

                    $OT = $OT_total * $row->day8_rate * $OT_premium;

                    //$ND_rate = $row->day8_rate * 0.10;

                    $ND_rate = 30;
        
                    $COLA = $ND_rate * $j;
        
                    $ND = $ND_rate * $row->nd_days;
        
                    $SI = $row->incentive;
        
                    $GP = $RegP + $ND + $SI - $UA;
                    

                    if($GP<10000)
                    $EMPH = 500;
                    else if($GP>10000.01 && $GP<99999.99)
                    $EMPH = $GP * 0.05;
                    else
                    $EMPH = 5000;

                    if($GP<1500)
                    $EMHDMF = $GP * 0.01;
                    else
                    $EMHDMF = 200;
                  
                    if($GP<=4250)
                    $EMSSS = 180;
                    else if($GP>4250 && $GP<4749.99)
                    $EMSSS = 202.50;
                    else if($GP>4749.99 && $GP<5249.99)
                    $EMSSS = 225.00;

                    if($GP<=20833)
                    $tax = 0;
                    else if($GP>20833 && $GP<33332)
                    $tax = 0;
                    else if($GP>33333 && $GP<66666)
                    $tax = 1875;
                    else if($GP>66666 && $GP<166666)
                    $tax = 8541.80;

                    $taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;
                  
                    $TOTAL_GP = $TOTAL_GP + $GP;

                    $deductions = $EMPH+$EMHDMF+$EMSSS;
                   
                }

            }
        }

        $data['net_pay_total'] = $TOTAL_GP - $deductions - $tax;;
        return view('backend.payroll_hourly.payroll', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        /*if(isset($_GET['region']) && $_GET['region']!=""  && $_GET['region']!="All"){
            $data['list'] = $data['list']->whereHas('station', function ($query) {
                return $query->where('region', $_GET['region']);
            });
        }*/

        $data['employee_count'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

        foreach ($data['employees'] as $row1){

            foreach($row1->user_timesheet_hourly as $row){

          
                if($row1->id == $row->user_id){

                                        $j++;

                                        $no_8_days = $no_8_days + $row->day8;

                                        $RegP = $row->day8*$row->day8_rate;

                                        $TOTAL_RP = $TOTAL_RP+$RegP;
                            
                                        if($row->day12==4)
                                        $Pay12 = $row->day12_rate-$RegP;
                                        else
                                        $Pay12 = $row->day8_rate*$row->day12;
                            
                                        $UA = $row->undertime * ($row->day8_rate/60);
                            
                                        $ot1 = $row->ot1_hrs;
                                        $ot2 = $row->o21_hrs;
                                        $ot3 = $row->ot3_hrs;
                                        $ot4 = $row->ot4_hrs;
                                        $ot5 = $row->ot5_hrs;
                                        $ot6 = $row->ot6_hrs;
                                        $ot7 = $row->ot7_hrs;
                                        $ot8 = $row->ot8_hrs;
                                        $ot9 = $row->ot9_hrs;
                                        $ot10 = $row->ot10_hrs;
                                        $ot11 = $row->ot11_hrs;
                                        $ot12 = $row->ot12_hrs;
                                        $ot13 = $row->ot13_hrs;
                            
                                        $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;

                                        $OT_premium = $row->day8_rate * 1.10;

                                        $OT = $OT_total * $row->day8_rate * $OT_premium;

                                        //$ND_rate = $row->day8_rate * 0.10;

                                        $ND_rate = 30;
                            
                                        $COLA = $ND_rate * $j;
                            
                                        $ND = $ND_rate * $row->nd_days;
                            
                                        $SI = $row->incentive;
                            
                                        $GP = $RegP + $ND + $SI - $UA;
                                        

                                        if($GP<10000)
                                        $EMPH = 500;
                                        else if($GP>10000.01 && $GP<99999.99)
                                        $EMPH = $GP * 0.05;
                                        else
                                        $EMPH = 5000;

                                        if($GP<1500)
                                        $EMHDMF = $GP * 0.01;
                                        else
                                        $EMHDMF = 200;
                                      
                                        if($GP<=4250)
                                        $EMSSS = 180;
                                        else if($GP>4250 && $GP<4749.99)
                                        $EMSSS = 202.50;
                                        else if($GP>4749.99 && $GP<5249.99)
                                        $EMSSS = 225.00;

                                        if($GP<=20833)
                                        $tax = 0;
                                        else if($GP>20833 && $GP<33332)
                                        $tax = 0;
                                        else if($GP>33333 && $GP<66666)
                                        $tax = 1875;
                                        else if($GP>66666 && $GP<166666)
                                        $tax = 8541.80;

                                        $taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;
                                      
                                        $TOTAL_GP = $TOTAL_GP + $GP;

                                        $deductions = $EMPH+$EMHDMF+$EMSSS;
                }

            }
        }

        $data['gross_pay_total'] = $TOTAL_GP;
        $data['net_pay_total'] = $TOTAL_GP - $deductions - $tax;
        $data['EMHMDF'] = $EMHDMF;
        $data['EMPH'] = $EMPH;
        $data['EMSSS'] = $EMSSS;
        $data['deduction_total'] = $deductions;
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

        $data['employee_count'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

        foreach ($data['employees'] as $row1){

            foreach($row1->user_timesheet_hourly as $row){

          
                if($row1->id == $row->user_id){

                    $j++;

                                        $no_8_days = $no_8_days + $row->day8;

                                        $RegP = $row->day8*$row->day8_rate;

                                        $TOTAL_RP = $TOTAL_RP+$RegP;
                            
                                        if($row->day12==4)
                                        $Pay12 = $row->day12_rate-$RegP;
                                        else
                                        $Pay12 = $row->day8_rate*$row->day12;
                            
                                        $UA = $row->undertime * ($row->day8_rate/60);
                            
                                        $ot1 = $row->ot1_hrs;
                                        $ot2 = $row->o21_hrs;
                                        $ot3 = $row->ot3_hrs;
                                        $ot4 = $row->ot4_hrs;
                                        $ot5 = $row->ot5_hrs;
                                        $ot6 = $row->ot6_hrs;
                                        $ot7 = $row->ot7_hrs;
                                        $ot8 = $row->ot8_hrs;
                                        $ot9 = $row->ot9_hrs;
                                        $ot10 = $row->ot10_hrs;
                                        $ot11 = $row->ot11_hrs;
                                        $ot12 = $row->ot12_hrs;
                                        $ot13 = $row->ot13_hrs;
                            
                                        $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;

                                        $OT_premium = $row->day8_rate * 1.10;

                                        $OT = $OT_total * $row->day8_rate * $OT_premium;

                                        //$ND_rate = $row->day8_rate * 0.10;

                                        $ND_rate = 30;
                            
                                        $COLA = $ND_rate * $j;
                            
                                        $ND = $ND_rate * $row->nd_days;
                            
                                        $SI = $row->incentive;
                            
                                        $GP = $RegP + $ND + $SI - $UA;
                                        

                                        if($GP<10000)
                                        $EMPH = 500;
                                        else if($GP>10000.01 && $GP<99999.99)
                                        $EMPH = $GP * 0.05;
                                        else
                                        $EMPH = 5000;

                                        if($GP<1500)
                                        $EMHDMF = $GP * 0.01;
                                        else
                                        $EMHDMF = 200;
                                      
                                        if($GP<=4250)
                                        $EMSSS = 180;
                                        else if($GP>4250 && $GP<4749.99)
                                        $EMSSS = 202.50;
                                        else if($GP>4749.99 && $GP<5249.99)
                                        $EMSSS = 225.00;

                                        if($GP<=20833)
                                        $tax = 0;
                                        else if($GP>20833 && $GP<33332)
                                        $tax = 0;
                                        else if($GP>33333 && $GP<66666)
                                        $tax = 1875;
                                        else if($GP>66666 && $GP<166666)
                                        $tax = 8541.80;

                                        $taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;
                                      
                                        $TOTAL_GP = $TOTAL_GP + $GP;

                                        $deductions = $EMPH+$EMHDMF+$EMSSS;
                }

            }
        }

        $data['gross_pay_total'] = $TOTAL_GP;
        $data['net_pay_total'] = $TOTAL_GP - $deductions - $tax;
        $data['EMHMDF'] = $EMHDMF;
        $data['EMPH'] = $EMPH;
        $data['EMSSS'] = $EMSSS;
        $data['deduction_total'] = $deductions;
        return view('backend.payroll_hourly.payroll_details_approve', ['data' => $data]);
    }

    public function record_payment_hourly()
    {
        $id = $_GET['id'];
        //$array = explode(',', $id);
        foreach ($id as $row)
        {
            $check = Paymentstatus::where('user_id',$row)->where('month',date('F',strtotime('last month')))->first();

            if(empty($check)){
            Paymentstatus::create([
                'user_id'=> $row,
                'status'=>1,
                'month'=>date('F',strtotime('last month')),
            ]);
            }
        }
    }

    public function get_payslip_hourly()
    {
        $id = $_GET['id'];
        $data['employee'] = User::with('userdetails')->with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('id',$id)->first();


        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

                                        foreach($data['employee']->user_timesheet_hourly as $row){
  
                                            $j++;

                                            $no_8_days = $no_8_days + $row->day8;
    
                                            $RegP = $row->day8*$row->day8_rate;
    
                                            $TOTAL_RP = $TOTAL_RP+$RegP;
                                
                                            if($row->day12==4)
                                            $Pay12 = $row->day12_rate-$RegP;
                                            else
                                            $Pay12 = $row->day8_rate*$row->day12;
                                
                                            $UA = $row->undertime * ($row->day8_rate/60);
                                
                                            $ot1 = $row->ot1_hrs;
                                            $ot2 = $row->o21_hrs;
                                            $ot3 = $row->ot3_hrs;
                                            $ot4 = $row->ot4_hrs;
                                            $ot5 = $row->ot5_hrs;
                                            $ot6 = $row->ot6_hrs;
                                            $ot7 = $row->ot7_hrs;
                                            $ot8 = $row->ot8_hrs;
                                            $ot9 = $row->ot9_hrs;
                                            $ot10 = $row->ot10_hrs;
                                            $ot11 = $row->ot11_hrs;
                                            $ot12 = $row->ot12_hrs;
                                            $ot13 = $row->ot13_hrs;
                                
                                            $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
    
                                            $OT_premium = $row->day8_rate * 1.10;
    
                                            $OT = $OT_total * $row->day8_rate * $OT_premium;
    
                                            //$ND_rate = $row->day8_rate * 0.10;
    
                                            $ND_rate = 30;
                                
                                            $COLA = $ND_rate * $j;
                                
                                            $ND = $ND_rate * $row->nd_days;
                                
                                            $SI = $row->incentive;
                                
                                            $GP = $RegP + $ND + $SI - $UA;
                                            
    
                                            if($GP<10000)
                                            $EMPH = 500;
                                            else if($GP>10000.01 && $GP<99999.99)
                                            $EMPH = $GP * 0.05;
                                            else
                                            $EMPH = 5000;
    
                                            if($GP<1500)
                                            $EMHDMF = $GP * 0.01;
                                            else
                                            $EMHDMF = 200;
                                          
                                            if($GP<=4250)
                                            $EMSSS = 180;
                                            else if($GP>4250 && $GP<4749.99)
                                            $EMSSS = 202.50;
                                            else if($GP>4749.99 && $GP<5249.99)
                                            $EMSSS = 225.00;
    
                                            if($GP<=20833)
                                            $tax = 0;
                                            else if($GP>20833 && $GP<33332)
                                            $tax = 0;
                                            else if($GP>33333 && $GP<66666)
                                            $tax = 1875;
                                            else if($GP>66666 && $GP<166666)
                                            $tax = 8541.80;
    
                                            $taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;
                                          
                                            $TOTAL_GP = $TOTAL_GP + $GP;
    
                                            $deductions = $EMPH+$EMHDMF+$EMSSS;
    
                                          } 

        if(isset($_GET['month']) && $_GET['month']!="")
            $deduction = Deduction::where('user_id',$id)->whereMonth('created_at',$_GET['month'])->sum('ded_amount');
        else
            $deduction = Deduction::where('user_id',$id)->whereMonth('created_at',Carbon::now()->month-1)->sum('ded_amount');

        $data['net_pay'] = $NET_PAY;

        if(isset($_GET['month']) && $_GET['month']!="")
        $data['status'] = Paymentstatus::where('user_id',$id)->whereMonth('created_at',$_GET['month']+1)->first();
        else
        $data['status'] = Paymentstatus::where('user_id',$id)->where('month',date('F',strtotime('last month')))->first();

        $data['paid_days'] = $no_8_days;
        $data['gross_pay']= $TOTAL_GP;

        
        $data['deduction'] = $deduction;
        $data['gross_pay'] = $TOTAL_GP;
        $data['net_pay'] = $TOTAL_GP - $deductions - $tax;
        $data['EMHMDF'] = $EMHDMF;
        $data['EMPH'] = $EMPH;
        $data['EMSSS'] = $EMSSS;
        $data['deduction_total'] = $deductions;
        return view('backend.payroll_hourly.payroll_ajax',['data'=>$data]);
    }

    public function payroll_history_hourly()
    {
        
        $data['employee_count'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->where('user_type','Employee')->where('status',1)->count();

        $data['employees'] = User::with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

            return $query->where('month',date('m',strtotime("-1 month")));

        })->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

        foreach ($data['employees'] as $row1){

            foreach($row1->user_timesheet_hourly as $row){

          
                if($row1->id == $row->user_id){

                    $j++;

                    $no_8_days = $no_8_days + $row->day8;

                    $RegP = $row->day8*$row->day8_rate;

                    $TOTAL_RP = $TOTAL_RP+$RegP;
        
                    if($row->day12==4)
                    $Pay12 = $row->day12_rate-$RegP;
                    else
                    $Pay12 = $row->day8_rate*$row->day12;
        
                    $UA = $row->undertime * ($row->day8_rate/60);
        
                    $ot1 = $row->ot1_hrs;
                    $ot2 = $row->o21_hrs;
                    $ot3 = $row->ot3_hrs;
                    $ot4 = $row->ot4_hrs;
                    $ot5 = $row->ot5_hrs;
                    $ot6 = $row->ot6_hrs;
                    $ot7 = $row->ot7_hrs;
                    $ot8 = $row->ot8_hrs;
                    $ot9 = $row->ot9_hrs;
                    $ot10 = $row->ot10_hrs;
                    $ot11 = $row->ot11_hrs;
                    $ot12 = $row->ot12_hrs;
                    $ot13 = $row->ot13_hrs;
        
                    $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;

                    $OT_premium = $row->day8_rate * 1.10;

                    $OT = $OT_total * $row->day8_rate * $OT_premium;

                    //$ND_rate = $row->day8_rate * 0.10;

                    $ND_rate = 30;
        
                    $COLA = $ND_rate * $j;
        
                    $ND = $ND_rate * $row->nd_days;
        
                    $SI = $row->incentive;
        
                    $GP = $RegP + $ND + $SI - $UA;

                    $taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND;

                    $EMPH = $GP * 0.0225;

                    $EMHDMF = $GP * 0.02;

                    $EMSSS = $GP*0.085;

                    $excess = $taxable_income - 20833;

                    //$tax = $excess * 0.02;

                    $tax = 0;

                    $TOTAL_GP = $TOTAL_GP + $GP;

                    $deductions = $EMPH+$EMHDMF+$EMSSS;

                    $DEDUCTIONS = $DEDUCTIONS + $deductions;

                    $net_pay = $GP - $deductions - $tax;

                    $NET_PAY = $NET_PAY + $net_pay;
                }

            }
        }

        
        $data['gross_pay_total'] = $TOTAL_GP;
        $data['net_pay_total'] = $NET_PAY;
        $data['deduction_total'] = $DEDUCTIONS;
        return view('backend.payroll_hourly.payroll_history', ['data' => $data]);
    }


    public function payroll_employee_hourly()
    {
        $data['employee_count'] = User::with('user_timesheet')->has('user_timesheet')->where('user_type','Employee')->count();
        $data['employees'] = User::with('user_timesheet')->has('user_timesheet')->with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        if(isset($_GET['employee']) && $_GET['employee']!=""){

        $employee = $_GET['employee'];

        $gross_pay_total = 0;
        $net_pay_total = 0;
        $tax_total = 0;
        $deduction_total = 0;

        $data['employee_details'] = User::with('userdetails')->where('user_type','Employee')->where('id',$_GET['employee'])->where('status',1)->first();

        $data['months'] = ['01','02','03','04','05','06','07','08','09','10','11','12'];

        foreach($data['months'] as $row){

            if($row<=Carbon::now()->month-1){
            $user = User::with('userdetails')->with('user_timesheet')->has('user_timesheet')->where('id',$employee)->first();
            $monthNum = $row;
            $dateObj   = DateTime::createFromFormat('!m', $monthNum);
            $monthName = $dateObj->format('F'); // March
            $paid_days = EmployeeTimesheet::join('users', 'users.id', '=', 'employee_timesheet.user_id')->where('employee_timesheet.month',$monthName)->where('user_id',$employee)->first();
            if(!empty($paid_days)){
            $paid_days =  $paid_days->days_worked;
            $gross_pay_month = $user->userdetails->basic_salary+$user->userdetails->house_rent_allowance+$user->userdetails->conveyance_allowance+$user->userdetails->fixed_allowance;
            $gross_pay_day = $gross_pay_month/26;
            $gross_pay = $gross_pay_day*$paid_days;

            $gross_pay_total = $gross_pay_total+$gross_pay;

            $deduction = Deduction::where('type','Deduction')->where('user_id',$_GET['employee'])->whereMonth('created_at',$row)->sum('amount');

            $tax = Deduction::where('type','Tax')->where('user_id',$_GET['employee'])->whereMonth('created_at',$row)->sum('amount');

            $net_pay = $gross_pay-($deduction+$tax);
            $net_pay_total = $net_pay_total+$net_pay;
            $tax_total = $tax_total+$tax;
            $deduction_total = $deduction_total+$deduction;
            }
        }


        $data['gross_pay_total'] = $gross_pay_total;
        $data['net_pay_total'] = $net_pay_total;
        $data['tax_total'] = $tax_total;
        $data['deduction_total'] = $deduction_total;
        }}

        return view('backend.payroll.payroll_employee', ['data' => $data]);
    }

    public function get_payslip_employee_hourly()
    {
        $id = $_GET['id'];

        $month = $_GET['month'];
        $monthNum = $month;
        $dateObj   = DateTime::createFromFormat('!m', $monthNum);
        $monthName = $dateObj->format('F'); // March

        $data['employee'] = User::with('userdetails')->where('user_type','Employee')->where('id',$id)->where('status',1)->first();

        $paid_days = EmployeeTimesheet::join('users', 'users.id', '=', 'employee_timesheet.user_id')->where('employee_timesheet.month',$monthName)->where('user_id',$id)->first();
        $paid_days =  $paid_days->days_worked;
        $gross_pay_month = $data['employee']->userdetails->basic_salary+$data['employee']->userdetails->house_rent_allowance+$data['employee']->userdetails->conveyance_allowance+$data['employee']->userdetails->fixed_allowance;
        $gross_pay_day = $gross_pay_month/26;
        $gross_pay = $gross_pay_day*$paid_days;

        $deduction = Deduction::where('type','Deduction')->where('user_id',$id)->whereMonth('created_at',$month)->sum('amount');

        $tax = Deduction::where('type','Tax')->where('user_id',$id)->whereMonth('created_at',$month)->sum('amount');

        $data['net_pay'] = $gross_pay-($deduction+$tax);
        $data['status'] = Paymentstatus::where('user_id',$id)->whereMonth('created_at', $month+1)->first();
        $data['paid_days'] = $paid_days;

        $data['deduction'] = Deduction::where('type','Deduction')->where('user_id',$id)->whereMonth('created_at',$month)->get();

        $data['tax'] = Deduction::where('type','Tax')->where('user_id',$id)->whereMonth('created_at',$month)->get();

        return view('backend.payroll.payroll_ajax',['data'=>$data]);
    }




}

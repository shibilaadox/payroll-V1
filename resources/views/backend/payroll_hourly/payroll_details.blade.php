@extends('layouts.master')
<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;?>
@section('main-content')
            <div class="breadcrumb">

                <h2>Regular Payroll</h2>
                
                <h4 class="card-title mb-3" style="text-align: end;margin-left:70%"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('payrolls_hourly.approve_payroll_hourly') }}">
                                    Approve</a></button></h4>
               
            </div>
            
            
            <div class="separator-breadcrumb border-top"></div>
            
           
            
            <div class="row mb-12">
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                        <span class="font-mm">Period:</span> <span class="font-semibold font-mm"><?php $currentMonth = date('F');
                echo Date('F', strtotime($currentMonth . " last month")); echo " ".date('Y')?></span> |
                        <span class="font-small">
                        <span id="ember1577" class="tooltip-container ember-view">            26 Base Days
                        </span><br><br><div class="row mb-12">
      <div class="col-md-6 mb-6">
          <h4><?php echo "₹".number_format($data['gross_pay_total'],2);?></h4>
        <div class="text-uppercase font-ms payrun-label">Payroll Cost</div>
      </div>
      <div class="col-md-6 mb-6">
          <h4><?php echo "₹".number_format($data['net_pay_total'],2);?></h4>
        <div class="text-uppercase font-ms payrun-label">Employees' Net Pay</div>
      </div>
    </div>
                            
                        </div>

                    </div>
                </div>
                <div class="col-md-2 mb-2">
                    <div class="card o-hidden">

                        <div class="card-body">
                        <div class="text-uppercase payrun-label font-small">Pay Day</div>
    <div style="font-size: 28px" class="font-light">10</div>
    <div class="text-uppercase font-small"><?php echo date('M , Y');?></div>
    
      <div class="font-mm " style="border-top: 1px solid #e1dbdb;">
        {{$data['employee_count']}} Employees
      </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-4 mb-4">
                <h4 class="font-xmedium">Deductions</h4>
    <table class="table noborder-table">
      <tbody>
          
          <tr>
            <td class="payrun-label">Deductions</td>
            <td class="text-right"><?php echo "₹".number_format($data['deduction_total'],2);?></td>
          </tr>
          
      </tbody>
    </table>
  </div>
            </div>



<div class="table-responsive">
                            <table class="table table-striped" id="user_table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">PAID DAYS</th>
                                        <th scope="col">GROSS PAY</th>
                                        <th scope="col">DEDUCTIONS</th>
                                        <th scope="col">NET PAY</th>
                                        <th scope="col">PAYMENT STATUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php $i=1;;foreach ($data['employees'] as $row1){ 

                                      $j = 0 ;$TOTAL_GP = 0;

                                      foreach($row1->user_timesheet_hourly as $row){

                                        if($row1->id == $row->user_id){

                                        $j++;

                                        $RegP = $row->day8*$row->day8_rate;
                            
                                        if($row->day12==4)
                                        $Pay12 = $row->day12_rate-$RegP;
                                        else
                                        $Pay12 = $row->day8_rate*$row->day12;
                            
                                        $UA = $row->undertime * ($row->day8_rate/60);
                            
                                        $ot1 = $row->ot1_hrs*$row->day8_rate;
                                        $ot2 = $row->o21_hrs*$row->day8_rate;
                                        $ot3 = $row->ot3_hrs*$row->day8_rate;
                                        $ot4 = $row->ot4_hrs*$row->day8_rate;
                                        $ot5 = $row->ot5_hrs*$row->day8_rate;
                                        $ot6 = $row->ot6_hrs*$row->day8_rate;
                                        $ot7 = $row->ot7_hrs*$row->day8_rate;
                                        $ot8 = $row->ot8_hrs*$row->day8_rate;
                                        $ot9 = $row->ot9_hrs*$row->day8_rate;
                                        $ot10 = $row->ot10_hrs*$row->day8_rate;
                                        $ot11 = $row->ot11_hrs*$row->day8_rate;
                                        $ot12 = $row->ot12_hrs*$row->day8_rate;
                                        $ot13 = $row->ot13_hrs*$row->day8_rate;
                            
                                        $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                            
                                        $COLA = 0;
                            
                                        $ND = 0;
                            
                                        $SI = $row->incentive;
                            
                                        $GP = $RegP + $ND + $SI - $UA;
                            
                                        $TOTAL_GP = $TOTAL_GP + $GP;

                                        } }
                                      
                                      ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td><?php echo $row1->firstname." ".$row1->lastname?></td>
                                            <td><?php 
                                            
                                            
                                            echo $j;
                                            
                                            ?>
                                            </td>
                                            <td><?php 
                                           
                                            
                                            echo "₹".number_format($TOTAL_GP,2);
                                            ?>
                                            </td>
                                            <td><?php 
                                            $deduction = 0;
                                            echo "₹".number_format($deduction,2);?></td>
                                            
                                            <td><?php $net_pay = $TOTAL_GP-$deduction;
                                            
                                            echo "₹".number_format($net_pay,2);
                                            ?></td>
                                            <td><?php $status = Paymentstatus::where('user_id',$row->id)->whereMonth('created_at',Carbon::now()->month)->first();
                                                      if(empty($status))echo "<span style='color: red;'>Yet to pay</span>";else if($status->status==1)echo "<span style='color: green;'>Paid On ".$status->created_at->format('d/m/Y')."</span>";
                                            
                                            ?></td>
                                        </tr>
                                    <?php }  ?>
                                </tbody>
                            </table>
                        </div>

@endsection

@section('page-js')
 
<script type="text/javascript">

    $(".app-footer").hide();

    $('#user_table').DataTable();
    
</script>

@endsection

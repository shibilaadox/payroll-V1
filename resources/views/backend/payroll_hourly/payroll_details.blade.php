@extends('layouts.master')
<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;use App\Models\Rate;use App\Models\Roles;use App\Models\OvertimeRate;use App\Models\SssRate;?>
@section('main-content')
            <div class="breadcrumb">

                <h2>Regular Payroll</h2>
                
                <h4 class="card-title mb-3" style="text-align: end;margin-left:70%"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('payrolls_hourly.approve_payroll_hourly',['payroll_period_start'=>$_GET['payroll_period_start'],'payroll_period_end'=>$_GET['payroll_period_end'],'client'=>$_GET['client']])}}">
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
          <h4><?php echo "₱".number_format($data['gross_pay_total'],2);?></h4>
        <div class="text-uppercase font-ms payrun-label">Payroll Cost</div>
      </div>
      <div class="col-md-6 mb-6">
          <h4><?php echo "₱".number_format($data['net_pay_total'],2);?></h4>
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
            <td class="payrun-label">EMHMDF</td>
            <td class="text-right"><?php echo "₱".number_format($data['EMHMDF'],2);?></td>
          </tr>
          <tr>
            <td class="payrun-label">EMPH</td>
            <td class="text-right"><?php echo "₱".number_format($data['EMPH'],2);?></td>
          </tr>
          <tr>
            <td class="payrun-label">EMSSS</td>
            <td class="text-right"><?php echo "₱".number_format($data['EMSSS'],2);?></td>
          </tr>
          <tr>
            <td class="payrun-label">Other Deductions</td>
            <td class="text-right"><?php echo "₱".number_format($data['other_ded'],2);?></td>
          </tr>
          <tr>
            <td class="payrun-label"><b>Total</b></td>
            <td class="text-right"><b><?php echo "₱".number_format($data['deduction_total'],2);?></b></td>
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
                                        <th scope="col">PAID HOURS</th>
                                        <th scope="col">REGULAR PAY</th>
                                        <th scope="col">OVERTIME</th>
                                        <th scope="col">GROSS PAY</th>
                                        <th scope="col">EMPH</th>
                                        <th scope="col">EMHDMF</th>
                                        <th scope="col">EMSSS</th>
                                        <th scope="col">Other Deductions</th>
                                        <th scope="col">TOTAL DEDUCTIONS</th>
                                        <th scope="col">TAX</th>
                                        <th scope="col">NET PAY</th>
                                        <th scope="col">PAYMENT STATUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php $i=1;foreach ($data['employees'] as $row1){ 

$j = 0 ;$TOTAL_overtime=0;$no_8_days=0;$no_12_days=0;$no_days=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       
                                      foreach($row1->usertimesheet as $row){

                                        if($row1->id == $row->user_id){

                                          $j++;

                                          $id = $row->user_id;

                                          $no_8_days = $no_8_days + $row->day8;
                                          $no_12_days = $no_12_days + $row->day12;
                                          $no_days = $no_8_days + $no_12_days;
                      
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

                                          $overtime = $ND+$COLA+$SI+$OT;
                    
                                          $TOTAL_overtime = $TOTAL_overtime + $overtime ;
                              
                                          $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                      
                                          $TOTAL_GP = $TOTAL_GP + $GP;

                    
                                        } }

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

            $time=strtotime($_GET['payroll_period_start']);
            $month=date("m",$time);
            $month_words = date("F",$time);

            $day_start = date("d",strtotime($_GET['payroll_period_start']));
            $day_end = date("d",strtotime($_GET['payroll_period_end']));
            if($day_start==01 && $day_end==15)
            $week = "A";
            else
            $week = "B";

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',$month)->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            

                                      
                                      ?>
                                        <tr>
                                            <th scope="row">{{ $i }}</th>
                                            <td onclick="detailed_entry('{{$row1->id}}')"><?php echo $row1->firstname." ".$row1->lastname?></td>
                                            <td><?php 
                                            
                                            
                                            echo $no_days;
                                            
                                            ?>
                                            </td>
                                            <td><?php 
                                           
                                            
                                            echo "₱".number_format($TOTAL_RP,2);
                                            ?>
                                            </td>
                                            <td><?php 
                                           
                                            
                                            echo "₱".number_format($TOTAL_overtime,2);
                                            ?>
                                            </td>
                                            <td><?php 
                                           
                                            
                                            echo "₱".number_format($TOTAL_GP,2);
                                            ?>
                                            </td>
                                            <
                                            <td><?php 
                                            
                                            echo "₱".number_format($EMPH,2);?></td>
                                            <td><?php 
                                            
                                            echo "₱".number_format($EMHDMF,2);?></td>
                                            <td><?php 
                                            
                                            echo "₱".number_format($EMSSS,2);?></td>
                                            <td><?php 
                                            
                                            echo "₱".number_format($DEDUCTION,2);?></td>
                                            <td><?php 
                                            $deduction = 0;
                                            echo "₱".number_format($deductions+$DEDUCTION,2);?></td>
                                            <td><?php 
                                            $tax = 0;
                                            echo "₱".number_format($tax,2);?></td>
                                            
                                            <td><?php 
                                            $NET_PAY = $TOTAL_GP - $deductions - $tax - $DEDUCTION;
                                            echo "₱".number_format($NET_PAY,2);
                                            ?></td>
                                            <td><?php $status = Paymentstatus::where('user_id',$row1->id)->where('month',$month_words)->where('week',$week)->first();
                                                      if(empty($status))echo "<span style='color: red;'>Yet to pay</span>";else if($status->status==1)echo "<span style='color: green;'>Paid On ".$status->created_at->format('d/m/Y')."</span>";
                                            
                                            ?></td>
                                        </tr>
                                    <?php }  ?>
                                </tbody>
                            </table>
                        </div>


                        {{-- Add modal --}}
                        <div class="modal fade" id="details-modal-id" tabindex="-1" role="dialog" aria-labelledby="TimesheetModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document"
            style="max-width: 90%; margin: 0; top: 0; bottom: 0; left: 5%; right: 5%; display: flex;">
            <div class="modal-content">
                
                    <div class="modal-header">
                    <h5 class="modal-title" id="UnitModalTitle">Detailed Timesheet</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       
                    </div>
                    <div class="modal-body" id="details-modal">


                        


</div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('page-js')
 
<script type="text/javascript">

    $(".app-footer").hide();

    $('#user_table').DataTable();

   
    function detailed_entry(id) {

event.preventDefault();
   let _token = $('meta[name="csrf-token"]').attr('content');
   
   $.ajax({
    url: "{{ route('detailed_timesheet',['payroll_period_start'=>$_GET['payroll_period_start'],'payroll_period_end'=>$_GET['payroll_period_end'],'client'=>$_GET['client']]) }}",
           type: "GET",
           data: {id:id},
           cache: false,
               
           success: function(response) {

               
               $('#details-modal-id').modal('show');
               $("#details-modal").html(response);
           
           }

       });

}
    
</script>

@endsection

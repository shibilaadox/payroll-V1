@extends('layouts.master')
<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;use App\Models\Rate;use App\Models\Roles;?>
@section('main-content')
            <div class="breadcrumb">

                <h2>Regular Payroll</h2>

                <h4 class="card-title mb-3" style="text-align: end;margin-left:70%"><button type="button"
                                class="btn btn-primary ripple m-1" onclick="status_change()">
                                    Record Payment</a></button></h4>
                
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
                                        <th scope="col"></th>
                                        <th scope="col">#</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">PAID HOURS</td>
                                        <th scope="col">NET PAY</th>
                                        <th scope="col">PAYMENT MODE</th>
                                        <th scope="col">PAY SLIP</th>
                                        <th scope="col">PAYMENT STATUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php $i=1; foreach ($data['employees'] as $row1){ 
                                        
                                        $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

                                        foreach($row1->usertimesheet as $row){
  
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
                        
                                            $OT_premium = $row->day8_rate * 1.25;
                        
                                            $OT = $OT_total * $OT_premium;
                        
                                            $role = $row->posicode;
                        
                                            $rate_data = Rate::where('position',$role)->first();
                        
                                            $ND_rate = $rate_data->nd;
                        
                                            $COLA_rate = $rate_data->cola;
                                
                                            $COLA = $COLA_rate * $j;
                                
                                            $ND = $ND_rate * $row->nd_days;
                                
                                            $SI = $row->incentive;
                                
                                            $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;
                                            
                                            $role_data = Roles::where('name',$role)->first();
                                            $EMPH_per = $role_data->philhealth;
                        
                                            if($GP<10000)
                                            $EMPH = 500;
                                            else if($GP>10000.01 && $GP<99999.99)
                                            $EMPH = $GP * $EMPH_per;
                                            else
                                            $EMPH = 5000;
                        
                        
                                            $EMHDMF_per = $role_data->hdmf;
                                            if($GP<1500)
                                            $EMHDMF = $GP * $EMHDMF_per;
                                            else
                                            $EMHDMF = 200;
                                          
                                            if($GP<=4250)
                                            $EMSSS = 180;
                                            else if($GP>4250 && $GP<4749.99)
                                            $EMSSS = 202.50;
                                            else if($GP>4749.99 && $GP<5249.99)
                                            $EMSSS = 225.00;
                                            else if($GP>5249.99 && $GP<5749.99)
                                            $EMSSS = 247.50;
                                            else if($GP>5749.99 && $GP<6249.99)
                                            $EMSSS = 270.00;
                                            
                                            //$taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;
                        
                                            $TOTAL_GP = $TOTAL_GP + $GP;
                        
                                            $DEDUCTION = Deduction::where('user_id',$row->user_id)->where('month',date('F',strtotime('last month')))->sum('ded_amount');
                                            $deductions = $EMPH+$EMHDMF+$EMSSS;

                                            $taxable_income = $TOTAL_GP - $deductions;
                                            
                                            if($taxable_income<=20833)
                                            $tax = 0;
                                            else if($taxable_income>20833 && $GP<33332)
                                            $tax = 0;
                                            else if($taxable_income>33333 && $GP<66666)
                                            $tax = 1875;
                                            else if($taxable_income>66666 && $GP<166666)
                                            $tax = 8541.80;

                                           
  
                                          } }
                                        
                                        ?>

                                        <tr>
                                            <?php 
                                            $NET_PAY = $TOTAL_GP - $deductions - $tax - $DEDUCTION;?>
                                            <th scope="row"><input type="checkbox" name="user_status_id" value="{{$row1->id}},{{$NET_PAY}}"></th>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td><?php echo $row1->firstname." ".$row1->lastname?></td>
                                            <td><?php 
                                            echo $no_8_days;
                                            ?>
                                            </td>
                                           
                                            <td><?php 
                                            echo "₱".number_format($NET_PAY,2);
                                            ?></td>
                                            <td>Cheque</td>
                                            <td><button type="button" class="btn btn-primary btn-m ripple m-1" onclick="get_payslip('{{$row1->id}}')">view</button></div></td>
                                            <td><?php $status = Paymentstatus::where('user_id',$row1->id)->where('month',date('F',strtotime('last month')))->first();
                                                      if(empty($status))echo "<span style='color: red;'>Yet to pay</span>";else if($status->status==1)echo "<span style='color: green;'>Paid On ".$status->created_at->format('d/m/Y')."</span>";
                                            
                                            ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>








                        {{-- Add modal --}}
    <div class="modal fade" id="payslip-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                
                    <div class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       
                    </div>
                    <div class="modal-body" id="payroll-modal">


                        


</div>
                    <div class="modal-footer">
                    <div class="download-payslip-footer">
    <button class="btn btn-primary pull-left" data-test-selector="download-payslip" data-ember-action="" data-ember-action-3218="3218">Download Payslip</button>
      <button data-test-selector="send-payslip" id="ember3219" class="btn btn-default pull-right ember-view" type="submit"><!---->Send Payslip
</button>
  </div>
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

    function status_change() {
           
           event.preventDefault();
           let _token = $('meta[name="csrf-token"]').attr('content');
           var id = [];
            $("input:checkbox[name=user_status_id]:checked").each(function() {
                id.push($(this).val());
              
            });
        
           $.ajax({
                   url: "<?php echo url('record_payment_hourly'); ?>",
                   type: "GET",
                   data: {id:id},
                   cache: false,
                       
                   success: function(response) {
       
                       location.reload();
                   
                   }
       
               });
                   
           }

    //open model
    function get_payslip(id) {

        event.preventDefault();
           let _token = $('meta[name="csrf-token"]').attr('content');
           
           $.ajax({
                   url: "<?php echo url('get_payslip_hourly'); ?>",
                   type: "GET",
                   data: {id:id},
                   cache: false,
                       
                   success: function(response) {
       
                       
                       $('#payslip-modal').modal('show');
                       $("#payroll-modal").html(response);
                   
                   }
       
               });
        
    }
    
</script>

@endsection

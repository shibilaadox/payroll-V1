@extends('layouts.master')
<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;?>
@section('main-content')
            <div class="breadcrumb">

                <h2>Regular Payroll</h2>
                
                <h4 class="card-title mb-3" style="text-align: end;margin-left:70%"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('payrolls.approve_payroll') }}">
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
                <h4 class="font-xmedium">Taxes &amp; Deductions</h4>
    <table class="table noborder-table">
      <tbody>
          <tr>
            <td class="payrun-label">Taxes</td>
            <td class="text-right"><?php echo "₹".number_format($data['tax_total'],2);?></td>
          </tr>
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
                                        <th scope="col">TAXES</th>
                                        <th scope="col">BENEFITS</th>
                                        <th scope="col">REIMBURSEMENTS</th>
                                        <th scope="col">NET PAY</th>
                                        <th scope="col">PAYMENT STATUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php $i=1; foreach ($data['employees'] as $row){ ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td><?php echo $row->firstname." ".$row->lastname?></td>
                                            <td><?php 
                                            $paid_days = $row->user_timesheet->days_worked;
                                            
                                            echo $paid_days;
                                            
                                            ?>
                                            </td>
                                            <td><?php 
                                           
                                            $gross_pay_month = $row->userdetails->basic_salary+$row->userdetails->house_rent_allowance+$row->userdetails->conveyance_allowance+$row->userdetails->fixed_allowance;
                                            $gross_pay_day = $gross_pay_month/26;
                                            $gross_pay = $gross_pay_day*$paid_days;
                                            echo "₹".number_format($gross_pay,2);
                                            ?>
                                            </td>
                                            <td><?php 
                                            $deduction = Deduction::where('type','Deduction')->where('user_id',$row->id)->whereMonth('created_at',Carbon::now()->month-1)->sum('amount');
                                            echo "₹".number_format($deduction,2);?></td>
                                            <td><?php 
                                            $tax = Deduction::where('type','Tax')->where('user_id',$row->id)->whereMonth('created_at',Carbon::now()->month-1)->sum('amount');
                                            echo "₹".number_format($tax,2)?></td>
                                            <td><?php echo "₹".number_format(0,2)?></td>
                                            <td><?php echo "₹".number_format(0,2)?></td>
                                            <td><?php $net_pay = $gross_pay-($deduction+$tax);
                                            
                                            echo "₹".number_format($net_pay,2);
                                            ?></td>
                                            <td><?php $status = Paymentstatus::where('user_id',$row->id)->whereMonth('created_at',Carbon::now()->month)->first();
                                                      if(empty($status))echo "<span style='color: red;'>Yet to pay</span>";else if($status->status==1)echo "<span style='color: green;'>Paid On ".$status->created_at->format('d/m/Y')."</span>";
                                            
                                            ?></td>
                                        </tr>
                                    <?php } ?>
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

<?php use App\Models\EmployeeTimesheet; ?>
@extends('layouts.master')
<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;?>
@section('main-content')
            <div class="breadcrumb">

                <h2>Regular Payroll</h2>
               
            </div>


                               <form class="m-form m-form--fit m-form--label-align-right"  method="get" enctype="multipart/form-data">
								
								                   <div class="form-group m-form__group row">
																	
															
														<div class="col-lg-6 col-md-9 col-sm-12">
														   
															<div class="row">
														
                                                            <div class="col-lg-6 col-md-9 col-sm-12">
																<select class="form-control m-select2 select_class" name="employee" id="employee">
                                                                    <option value="">Select Employee</option>
                                                                    <?php foreach($data['employees'] as $row){?>
                                                                    <option value="{{$row->id}}" <?php if(isset($_GET['employee']) && $_GET['employee']==$row->id){ echo "selected"; }?>>{{$row->firstname." ".$row->lastname}}</option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                            </div>

														</div>

                                                        <div class="col-lg-6 col-md-9 col-sm-12">
														    
															<div class="row">
															<div class="col-lg-6 col-md-9 col-sm-12">
                                                            <button id="get_report"  type="submit" class="btn btn-primary" style="margin-left:-100%;">Get Report</button>
                                                            </div>
                                                            </div>

														</div>

                                                       
																	
												    </div> 
							    </form>
                                <br><br>
            
            <?php if(isset($_GET['employee']) && $_GET['employee']!=""){$employee = $_GET['employee']?>
            <div class="separator-breadcrumb border-top"></div>
            
           
            
            <div class="row mb-12">
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                        
                        <div class="row mb-12">
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
                                        <th scope="col">PAY SLIP</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <?php $i=1; $data['months'] = ['01','02','03','04','05','06','07','08','09','10','11','12'];
        
                                        foreach($data['months'] as $row){ if($row<=Carbon::now()->month-1){
                                            $monthNum = $row;
                                            $dateObj   = DateTime::createFromFormat('!m', $monthNum);
                                            $monthName = $dateObj->format('F'); // March
                                            $paid_days = EmployeeTimesheet::join('users', 'users.id', '=', 'employee_timesheet.user_id')->where('employee_timesheet.month',$monthName)->where('user_id',$employee)->first();
                                            if(!empty($paid_days)){
                                            $paid_days =  $paid_days->days_worked;
                                            
                                            ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td><?php $current_month = date('M', mktime(0, 0, 0, $row)); echo $current_month." ".date('Y')?></td>
                                            <td><?php 
                                            
                                            $monthNum = $row;
                                            $dateObj   = DateTime::createFromFormat('!m', $monthNum);
                                            $monthName = $dateObj->format('F'); // March
                                            $paid_days = EmployeeTimesheet::join('users', 'users.id', '=', 'employee_timesheet.user_id')->where('employee_timesheet.month',$monthName)->where('user_id',$employee)->first();
                                            $paid_days =  $paid_days->days_worked;
                                            echo $paid_days;
                                            ?>
                                            </td>
                                            <td><?php 
                                            $gross_pay_month = $data['employee_details']->userdetails->basic_salary+$data['employee_details']->userdetails->house_rent_allowance+$data['employee_details']->userdetails->conveyance_allowance+$data['employee_details']->userdetails->fixed_allowance;
                                            $gross_pay_day = $gross_pay_month/26;
                                            $gross_pay = $gross_pay_day*$paid_days;
                                            echo "₹".number_format($gross_pay,2);
                                            ?>
                                            </td>
                                            <td><?php
                
                                            $deduction = Deduction::where('type','Deduction')->where('user_id',$_GET['employee'])->whereMonth('created_at',$row)->sum('amount');
                                            
                                            echo "₹".number_format($deduction,2);?></td>
                                            <td><?php 
            
                                            $tax = Deduction::where('type','Tax')->where('user_id',$_GET['employee'])->whereMonth('created_at',$row)->sum('amount');

                                            echo "₹".number_format($tax,2)?></td>
                                            <td><?php echo "₹".number_format(0,2)?></td>
                                            <td><?php echo "₹".number_format(0,2)?></td>
                                            <td><?php $net_pay = $gross_pay-($deduction+$tax);
                                            
                                            echo "₹".number_format($net_pay,2);
                                            ?></td>
                                            <td><?php $status = Paymentstatus::where('user_id',$_GET['employee'])->whereMonth('created_at',$row+1)->first();
                                                      if(empty($status))echo "<span style='color: red;'>Yet to pay</span>";else if($status->status==1)echo "<span style='color: green;'>Paid On ".$status->created_at->format('d/m/Y')."</span>";
                                            
                                            ?></td>
                                            <td><button type="button" class="btn btn-primary btn-m ripple m-1" onclick="get_payslip('{{$_GET['employee']}}',{{$row}})">view</button></div></td>

                                        </tr>
                                    <?php }}} ?>
                                </tbody>
                            </table>
                        </div>



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
    <?php } ?>


@endsection

@section('page-js')
 
<script type="text/javascript">

    $(".app-footer").hide();

    $('#user_table').DataTable();

    function get_payslip(id,month) {

    event.preventDefault();
    let _token = $('meta[name="csrf-token"]').attr('content');
        
    <?php $url = url('get_payslip_employee');   
    
    ?>
   
    $.ajax({
           url: "<?php echo  $url?>",
           type: "GET",
           data: {id:id,month:month},
           cache: false,
               
           success: function(response) {

               
               $('#payslip-modal').modal('show');
               $("#payroll-modal").html(response);
           
           }

    });

    }
    
</script>

@endsection

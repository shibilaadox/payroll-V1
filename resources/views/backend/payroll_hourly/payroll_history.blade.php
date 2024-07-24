@extends('layouts.master')
<?php use App\Models\Leave;
use App\Models\Deduction;
use App\Models\Paymentstatus; use App\Models\Rate;use App\Models\Roles;?>
@section('main-content')
    <div class="breadcrumb">

        <h2>Regular Payroll</h2>

    </div>


    <form class="m-form m-form--fit m-form--label-align-right" method="get" enctype="multipart/form-data">

        <div class="form-group m-form__group row">


            <div class="col-lg-6 col-md-9 col-sm-12">

                <div class="row">
                    <div class="col-lg-6 col-md-9 col-sm-12">
                        <select class="form-control m-select2 select_class" name="month" id="month">
                            <option value="">Select Month</option>
                            <option value="01" <?php if (isset($_GET['month']) && $_GET['month'] == '01') {
                                echo 'selected';
                            } ?>>January</option>
                            <option value="02" <?php if (isset($_GET['month']) && $_GET['month'] == '02') {
                                echo 'selected';
                            } ?>>February</option>
                            <option value="03" <?php if (isset($_GET['month']) && $_GET['month'] == '03') {
                                echo 'selected';
                            } ?>>March</option>
                            <option value="04" <?php if (isset($_GET['month']) && $_GET['month'] == '04') {
                                echo 'selected';
                            } ?>>April</option>
                            <option value="05" <?php if (isset($_GET['month']) && $_GET['month'] == '05') {
                                echo 'selected';
                            } ?>>May</option>
                            <option value="06" <?php if (isset($_GET['month']) && $_GET['month'] == '06') {
                                echo 'selected';
                            } ?>>June</option>
                            <option value="07" <?php if (isset($_GET['month']) && $_GET['month'] == '07') {
                                echo 'selected';
                            } ?>>July</option>
                            <option value="08" <?php if (isset($_GET['month']) && $_GET['month'] == '08') {
                                echo 'selected';
                            } ?>>August</option>
                            <option value="09" <?php if (isset($_GET['month']) && $_GET['month'] == '09') {
                                echo 'selected';
                            } ?>>September</option>
                            <option value="10" <?php if (isset($_GET['month']) && $_GET['month'] == '10') {
                                echo 'selected';
                            } ?>>October</option>
                            <option value="11" <?php if (isset($_GET['month']) && $_GET['month'] == '11') {
                                echo 'selected';
                            } ?>>November</option>
                            <option value="12" <?php if (isset($_GET['month']) && $_GET['month'] == '12') {
                                echo 'selected';
                            } ?>>December</option>

                        </select>
                    </div>

                </div>

            </div>

            <div class="col-lg-3 col-md-9 col-sm-12">

                <div class="row">
                    <div class="col-lg-6 col-md-9 col-sm-12">
                        <button id="get_report" type="submit" class="btn btn-primary" style="margin-left:-100%;">Get
                            Report</button>
                    </div>
                </div>

            </div>



        </div>
    </form>
    <br><br>


    <div class="separator-breadcrumb border-top"></div>



    <div class="row mb-12">
        <div class="col-md-4 mb-4">
            <div class="card o-hidden">

                <div class="card-body">
                    <span class="font-mm">Period:</span> <span class="font-semibold font-mm"><?php
                    if (isset($_GET['month']) && $_GET['month'] != '') {
                        $current_month = date('M', mktime(0, 0, 0, $_GET['month']));
                    } else {
                        $currentMonth = date('F');
                        $current_month = Date('F', strtotime($currentMonth . ' last month'));
                    }

                    echo $current_month . ' ' . date('Y'); ?></span> |
                    <span class="font-small">
                        <span id="ember1577" class="tooltip-container ember-view"> 26 Base Days
                        </span><br><br>
                        <div class="row mb-12">
                            <div class="col-md-6 mb-6">
                                <h4><?php echo '₹' . number_format($data['gross_pay_total'], 2); ?></h4>
                                <div class="text-uppercase font-ms payrun-label">Payroll Cost</div>
                            </div>
                            <div class="col-md-6 mb-6">
                                <h4><?php echo '₹' . number_format($data['net_pay_total'], 2); ?></h4>
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
                    <div class="text-uppercase font-small"><?php if (isset($_GET['month']) && $_GET['month'] != '') {
                        echo date('M', mktime(0, 0, 0, $_GET['month'] + 1));
                    } else {
                        echo date('M , Y');
                    } ?></div>

                    <div class="font-mm " style="border-top: 1px solid #e1dbdb;">
                        {{ $data['employee_count'] }} Employees
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-4 mb-4">
            <h4 class="font-xmedium">Taxes &amp; Deductions</h4>
            <table class="table noborder-table">
                <tbody>
                    
                    <tr>
                        <td class="payrun-label">Deductions</td>
                        <td class="text-right"><?php echo '₹' . number_format($data['deduction_total'], 2); ?></td>
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
                    <th scope="col">PAY SLIP</th>
                </tr>
            </thead>
            <tbody>

            <?php $i=1;foreach ($data['employees'] as $row1){ 

$j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;

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

    $role = $row->posicode;

    $rate_data = Rate::where('position',$role)->first();

    $ND_rate = $rate_data->nd;

    $COLA_rate = $rate_data->cola;

    $COLA = $COLA_rate * $j;

    $ND = $ND_rate * $row->nd_days;

    $SI = $row->incentive;

    $GP = $RegP + $ND + $COLA + $SI - $UA;
    
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

  } }

?>
              
                <tr>
                    <th scope="row">{{ $i++ }}</th>
                    <td><?php echo $row1->firstname . ' ' . $row1->lastname; ?></td>
                    <td><?php

                    
                    echo $no_8_days;
                    ?>
                    </td>
                    <td><?php

                    
                    echo '₹' . number_format($TOTAL_GP, 2);
                    ?>
                    </td>
                    <td><?php
                    

                    echo '₹' . number_format($DEDUCTIONS, 2); ?></td>
                    
                    
                    <td><?php echo $NET_PAY;
                    ?></td>
                    <td><?php if (isset($_GET['month']) && $_GET['month'] != '') {
                        $status = Paymentstatus::where('user_id', $row->id)
                            ->whereMonth('created_at', $_GET['month'] + 1)
                            ->first();
                    } else {
                        $status = Paymentstatus::where('user_id', $row->id)
                            ->whereMonth('created_at', Carbon::now()->month)
                            ->first();
                    }
                    if (empty($status)) {
                        echo "<span style='color: red;'>Yet to pay</span>";
                    } elseif ($status->status == 1) {
                        echo "<span style='color: green;'>Paid On " . $status->created_at->format('d/m/Y') . '</span>';
                    }

                    ?></td>
                    <td><button type="button" class="btn btn-primary btn-m ripple m-1"
                            onclick="get_payslip('{{ $row->id }}')">view</button>
    </div>
    </td>

    </tr>
    <?php } ?>
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
                        <button class="btn btn-primary pull-left" data-test-selector="download-payslip"
                            data-ember-action="" data-ember-action-3218="3218">Download Payslip</button>
                        <button data-test-selector="send-payslip" id="ember3219"
                            class="btn btn-default pull-right ember-view" type="submit"><!---->Send Payslip
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

        function get_payslip(id) {

            event.preventDefault();
            let _token = $('meta[name="csrf-token"]').attr('content');
            <?php if (isset($_GET['month']) && $_GET['month'] != '') {
                $mnth = $_GET['month'];
                $url = url('get_payslip') . '?month=' . $mnth;
            } else {
                $url = url('get_payslip');
            }
            ?>

            $.ajax({
                url: "<?php echo $url; ?>",
                type: "GET",
                data: {
                    id: id
                },
                cache: false,

                success: function(response) {


                    $('#payslip-modal').modal('show');
                    $("#payroll-modal").html(response);

                }

            });

        }
    </script>
@endsection

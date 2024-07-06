@extends('layouts.master')
<?php use App\Models\Leave;
use App\Models\Deduction;
use App\Models\Paymentstatus; ?>
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
                        <td class="payrun-label">Taxes</td>
                        <td class="text-right"><?php echo '₹' . number_format($data['tax_total'], 2); ?></td>
                    </tr>
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
                    <th scope="col">TAXES</th>
                    <th scope="col">BENEFITS</th>
                    <th scope="col">REIMBURSEMENTS</th>
                    <th scope="col">NET PAY</th>
                    <th scope="col">PAYMENT STATUS</th>
                    <th scope="col">PAY SLIP</th>
                </tr>
            </thead>
            <tbody>

                <?php $i=1; foreach ($data['employees'] as $row){ ?>
                <tr>
                    <th scope="row">{{ $i++ }}</th>
                    <td><?php echo $row->firstname . ' ' . $row->lastname; ?></td>
                    <td><?php

                    $paid_days = $row->user_timesheet->days_worked;

                    echo $paid_days;
                    ?>
                    </td>
                    <td><?php

                    $gross_pay_month = $row->userdetails->basic_salary + $row->userdetails->house_rent_allowance + $row->userdetails->conveyance_allowance + $row->userdetails->fixed_allowance;
                    $gross_pay_day = $gross_pay_month / 26;
                    $gross_pay = $gross_pay_day * $paid_days;
                    echo '₹' . number_format($gross_pay, 2);
                    ?>
                    </td>
                    <td><?php
                    if (isset($_GET['month']) && $_GET['month'] != '') {
                        $deduction = Deduction::where('type', 'Deduction')
                            ->where('user_id', $row->id)
                            ->whereMonth('created_at', $_GET['month'])
                            ->sum('amount');
                    } else {
                        $deduction = Deduction::where('type', 'Deduction')
                            ->where('user_id', $row->id)
                            ->whereMonth('created_at', Carbon::now()->month - 1)
                            ->sum('amount');
                    }

                    echo '₹' . number_format($deduction, 2); ?></td>
                    <td><?php
                    if (isset($_GET['month']) && $_GET['month'] != '') {
                        $tax = Deduction::where('type', 'Tax')
                            ->where('user_id', $row->id)
                            ->whereMonth('created_at', $_GET['month'])
                            ->sum('amount');
                    } else {
                        $tax = Deduction::where('type', 'Tax')
                            ->where('user_id', $row->id)
                            ->whereMonth('created_at', Carbon::now()->month - 1)
                            ->sum('amount');
                    }

                    echo '₹' . number_format($tax, 2); ?></td>
                    <td><?php echo '₹' . number_format(0, 2); ?></td>
                    <td><?php echo '₹' . number_format(0, 2); ?></td>
                    <td><?php $net_pay = $gross_pay - ($deduction + $tax);

                    echo '₹' . number_format($net_pay, 2);
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

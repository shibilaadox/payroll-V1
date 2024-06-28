
@extends('layouts.master')
<?php use App\Models\Leave;
use App\Models\Deduction;
use App\Models\Paymentstatus; ?>
@section('main-content')

    <div class="breadcrumb">

        <h2>{{ $project->name }}</h2>

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
                     <span class="font-semibold font-mm"><?php
                    if (isset($_GET['month']) && $_GET['month'] != '') {
                        $current_month = date('M', mktime(0, 0, 0, $_GET['month']));
                    } else {
                        $currentMonth = date('F');
                        $current_month = Date('F', strtotime($currentMonth . ' last month'));
                    }

                    echo $current_month . ' ' . date('Y'); ?></span>
                    <span class="font-small">
                        <br><br>

                        <?php

                        $data = [
                            'total' => 10,
                            'net_pay_total' => 50000,
                        ];
                        ?>

                        <div class="row mb-12">
                            <div class="col-md-6 mb-6">
                                <h4> <?php echo '' . number_format($data['total']); ?> </h4>
                                <div class="text-uppercase font-ms payrun-label">Employees</div>
                            </div>
                            <div class="col-md-6 mb-6">
                                <div class="text-uppercase font-ms payrun-label">Total Cost</div>
                                <h4> <?php echo '₹' . number_format($data['net_pay_total'], 2); ?> </h4>
                            </div>
                        </div>

                </div>

            </div>
        </div>
        <div class="col-md-2 mb-2">
            <div class="card o-hidden">

                <div class="card-body">
                    <div class="text-uppercase payrun-label font-small text-center">PROJECT LAUNCH DATE</div>
                    <div style="font-size: 20px" class="font-light text-center">After 60 Working Days</div>



                </div>

            </div>
        </div>
        
    </div>

    <div class="separator-breadcrumb border-top"></div>

    <div>

        <h1>Employee Details</h1>


        <div class="table-responsive">
            <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                <div class="row">
                    <div class="col-sm-12">
                        <table id="project_datatable" class="display table table-striped table-bordered dataTable"
                            style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                            <thead class="text-center">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Employee ID</th>
                                    <th scope="col">Project ID</th>
                                    <th scope="col">Month</th>
                                    <th scope="col">Payment</th>
                                    <th scope="col">Mode</th>
                                </tr>
                            </thead>

                            <tbody>

                                @php
                                        $i = 1;
                                    @endphp
                                <tr>
                                    <th scope="row">{{ $i++ }}</th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>


                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
@endsection

@extends('layouts.master')
<?php use App\Models\Leave;
use App\Models\Deduction;
use App\Models\Paymentstatus; ?>
@section('main-content')
    <div class="breadcrumb">

        <h2>{{ $client->name }}</h2>

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
                                <div class="text-uppercase font-ms payrun-label">Projects</div>
                            </div>
                            <div class="col-md-6 mb-6">
                                <h4> <?php echo '₹' . number_format($data['net_pay_total'], 2); ?> </h4>
                                <div class="text-uppercase font-ms payrun-label">Project Budget</div>
                            </div>
                        </div>

                </div>

            </div>
        </div>
        <div class="col-md-2 mb-2">
            <div class="card o-hidden">

                <div class="card-body">
                    <div class="text-uppercase payrun-label font-small">PROJECT LAUNCH DATE</div>
                    <div style="font-size: 28px" class="font-light">20</div>
                    <div class="text-uppercase font-small"><?php if (isset($_GET['month']) && $_GET['month'] != '') {
                        echo date('M', mktime(0, 0, 0, $_GET['month'] + 1));
                    } else {
                        echo date('M , Y');
                    } ?></div>


                </div>

            </div>
        </div>
        <div class="col-md-4 mb-4">
            <h4 class="font-xmedium">Task Details</h4>
            <table class="table noborder-table">
                <tbody>
                    <tr>
                        <td class="payrun-label">Upcoming Tasks</td>
                        <td class="text-right">5</td>

                    </tr>
                    <tr>
                        <td class="payrun-label">Workload</td>
                        <td class="text-right">2</td>
                    </tr>
                    <tr>
                        <td class="payrun-label">Overdue Tasks</td>
                        <td class="text-right">2</td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>

    <div class="separator-breadcrumb border-top"></div>

    <div>

        <h1>Client Details</h1>
        <p>Name: {{ $client->name }}</p>
        <p>Email: {{ $client->email }}</p>

        <div class="form-group col-md-12">
            <label for="client" class="ul-form__label">Projects :</label>
        </div>

        <div class="table-responsive">
            <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                <div class="row">
                    <div class="col-sm-12">
                        <table id="project_datatable" class="display table table-striped table-bordered dataTable"
                            style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Project Name</th>
                                    <th scope="col">Client</th>
                                    <th scope="col">Project Type</th>
                                    <th scope="col">Project Phases</th>
                                    <th scope="col">Project Status</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Assigned To</th>
                                    <th scope="col">Payment</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>


                            <tbody>
                                @php
                                    $i = 1;
                                @endphp
                                @foreach ($projects as $project)
                                    @if ($i > 20)
                                    @break
                                @endif

                                <tr>
                                    <th scope="row">{{ $i++ }}</th>
                                    <td>{{ $project->project_name }}</td>
                                    <td>{{ $client->name }}</td>
                                    <td><?php echo $project->project . ' - ' . $project->project_type; ?></td>
                                    <td>{{ $project->project_phase }}</td>
                                    <td>{{ $project->status }}</td>
                                    <td><?php echo $project->start_date . ' to ' . $project->end_date; ?></td>
                                    <td>{{ $project->description }}</td>
                                    <td>
                                        @foreach ($project->employees as $employee)
                                            {{ $project->employees->firstname }}

                                            {{ $project->employees->lastname }}
                                        @endforeach
                                    </td>
                                    <td>{{ $project->salary }}</td>
                                    <td>
                                        <a class="text-success mr-2" onclick="edit_project('{{ $project->id }}')">
                                            <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                        </a>
                                        <a class="text-danger mr-2" onclick="delete_project('{{ $project->id }}')"
                                            title="Delete Project">
                                            <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                        </a>
                                    </td>
                                </tr>

                                @php
                                    $i++;
                                @endphp
                            @endforeach
                        </tbody>


                    </table>

                </div>
            </div>

        </div>
    </div>
</div>
@endsection

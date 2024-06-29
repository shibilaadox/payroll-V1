@extends('layouts.master')

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
                            @foreach(range(1, 12) as $month)
                                <option value="{{ str_pad($month, 2, '0', STR_PAD_LEFT) }}" {{ request('month') == str_pad($month, 2, '0', STR_PAD_LEFT) ? 'selected' : '' }}>
                                    {{ date('F', mktime(0, 0, 0, $month)) }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-9 col-sm-12">
                <div class="row">
                    <div class="col-lg-6 col-md-9 col-sm-12">
                        <button id="get_report" type="submit" class="btn btn-primary" style="margin-left:-100%;">Get Report</button>
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
                    <span class="font-semibold font-mm">
                        @if (request('month'))
                            {{ date('F', mktime(0, 0, 0, request('month'))) }} {{ date('Y') }}
                        @else
                            {{ date('F Y', strtotime('last month')) }}
                        @endif
                    </span>
                    <br><br>
                    <div class="row mb-12">
                        <div class="col-md-6 mb-6">
                            <h4> {{ number_format(10) }} </h4>
                            <div class="text-uppercase font-ms payrun-label">Employees</div>
                        </div>
                        <div class="col-md-6 mb-6">
                            <div class="text-uppercase font-ms payrun-label">Total Cost</div>
                            <h4> ₹{{ number_format(50000, 2) }} </h4>
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
                            @foreach($employeeProjects as $index => $employeeProject)
                                <tr>
                                    <th scope="row">{{ $index + 1 }}</th>
                                    <td>{{ $employeeProject->user_id }}</td>
                                    <td>{{ $employeeProject->project_id }}</td>
                                    <td>{{ $employeeProject->month }}</td>
                                    <td>{{ $employeeProject->payment }}</td>
                                    <td>{{ $employeeProject->mode }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

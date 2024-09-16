@extends('layouts.master')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

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
                            @foreach (range(1, 12) as $month)
                                <option value="{{ str_pad($month, 2, '0', STR_PAD_LEFT) }}"
                                    {{ request('month', $projectMonth) == str_pad($month, 2, '0', STR_PAD_LEFT) ? 'selected' : '' }}>
                                    {{ DateTime::createFromFormat('!m', $month)->format('F') }}
                                </option>
                            @endforeach
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
                    <h5 style="font-weight:bold">Current Month</h5>
                    <span
                        class="font-semibold font-mm">{{ date('F', mktime(0, 0, 0, $selectedMonth, 1)) . ' ' . $currentYear }}</span>
                    <br><br>
                    <div class="row mb-12">
                        <div class="col-md-6 mb-6">
                            <h4> {{ $totalEmployees }} </h4>
                            <div class="text-uppercase font-ms payrun-label">Employees</div>
                        </div>
                        <div class="col-md-6 mb-6">
                            <div class="text-uppercase font-ms payrun-label">Total Cost</div>
                            <h4>₱ {{ number_format($totalCost, 2) }} </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-2">
            <div style="width: 300px" class="card o-hidden">
                <div class="card-body">
                    <div class="text-uppercase payrun-label font-small text-center text-nowrap">PROJECT LAUNCH DATE</div>
                    <div style="font-size: 19px" class="font-light text-center text-nowrap">
                        {{ date('F d, Y', strtotime($project->created_at)) }} </div>
                </div>
            </div>
        </div>
    </div>

    <div class="separator-breadcrumb border-top"></div>

    <div>
        <h1 class="text-center mb-4">Employee Details</h1>
        <div class="table-responsive">
            <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                <div class="row">
                    <div class="col-sm-12">
                        <table id="project_datatable" class="display table table-striped table-bordered dataTable"
                            style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                            <thead class="text-center">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Employee Name</th>
                                    <th scope="col">Project Name</th>
                                    <th scope="col">Month</th>
                                    <th scope="col">Payment</th>
                                    <th scope="col">Mode</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($employeeProjects as $index => $employeeProject)
                                    <tr>
                                        <th scope="row">{{ $index + 1 }}</th>

                                        <td>{{ $employeeProject->user ? $employeeProject->user->firstname : 'N/A' }}</td>

                                        <td>{{ $employeeProject->project ? $employeeProject->project->project_name : 'N/A' }}
                                        </td>
                                        <td>{{ $employeeProject->month }}</td>
                                        <td>{{ $employeeProject->payment }}</td>
                                        <td>{{ $employeeProject->mode }}</td>
                                        <td>
                                            <a class="text-success mr-2" onclick="edit_project('{{ $project->id }}')">
                                                <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                            </a>
                                            <a class="text-danger mr-2" onclick="delete_project('{{ $project->id }}')"
                                                title="Delete Project">
                                                <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                            </a>
                                            <a href="{{ route('employee.details', $employeeProject->id) }}"
                                                class="text-primary">
                                                <i style="font-size: 17px" class="fa-solid fa-circle-info"></i>
                                            </a>
                                            <a href="{{ route('employee.invoice', $employeeProject->id) }}"
                                                class="text-primary">
                                                <i style="font-size: 17px"
                                                    class="nav-icon i-Library font-weight-bold fs-16"></i>
                                            </a>

                                        </td>
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

@extends('layouts.master')
<?php use App\Models\Leave;
use App\Models\Deduction;
use App\Models\Paymentstatus; ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />


@section('main-content')
    <div class="breadcrumb">

        <h2>{{ $client->name }}</h2>

    </div>


    <form class="m-form m-form--fit m-form--label-align-right" method="get" enctype="multipart/form-data">


        <div class="form-group row">


            <div class="col-lg-6 col-md-9 col-sm-12">

                <div class="row">
                    <div class="col-lg-6 col-md-9 col-sm-12">
                        <select class="form-control m-select2 select_class" name="month" id="month">
                            <option value="">Select Month</option>

                            @foreach (range(1, 12) as $month)
                                <option value="{{ str_pad($month, 2, '0', STR_PAD_LEFT) }}"
                                    {{ request('month', date('m')) == str_pad($month, 2, '0', STR_PAD_LEFT) ? 'selected' : '' }}>
                                    {{ DateTime::createFromFormat('!m', $month)->format('F') }}
                                </option>
                            @endforeach

                        </select>
                    </div>
                </div>

            </div>

            <div class="col-lg-6 col-md-9 col-sm-12">

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
                    <span class="font-semibold font-mm">{{ $current_month . ' ' . date('Y') }}</span>
                    <span class="font-small">
                        <br><br>

                        <div class="row mb-12">
                            <div class="col-md-6 mb-6">
                                <h4> {{ number_format($projects->count()) }} </h4>
                                <div class="text-uppercase font-ms payrun-label">Projects</div>
                            </div>
                            <div class="col-md-6 mb-6">
                                <h4>₱ {{ number_format($totalAmount, 2) }} </h4>
                                <div class="text-uppercase font-ms payrun-label">Project Budget</div>
                            </div>
                        </div>
                </div>

            </div>
        </div>

        <div class="col-md-2 mb-2">
            <div class="card">
                <div class="card-body text-center d-flex flex-column justify-content-center align-items-center">
                    <div class="text-uppercase payrun-label font-small  text-nowrap">CLIENT START DATE</div>
                    <div style="font-size: 25px" class="display-6 font-light text-nowrap">
                        {{ $client->created_at->format('Y-m-d') }}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4 ml-5">
            <h4 class="font-xmedium">Project Details</h4>
            <table class="table noborder-table">
                <tbody>
                    <tr>
                        <td class="payrun-label">
                            <a href="#" class="filter-projects" data-status="completed"
                                style="color: rgb(69, 68, 68)">Completed</a>
                        </td>
                        <td class="text-right">{{ $completedProjects }}</td>
                    </tr>
                    <tr>
                        <td class="payrun-label">
                            <a href="#" class="filter-projects" data-status="ongoing"
                                style="color: rgb(69, 68, 68)">Ongoing</a>
                        </td>
                        <td class="text-right">{{ $ongoingProjects }}</td>
                    </tr>
                    <tr>
                        <td class="payrun-label">
                            <a href="#" class="filter-projects" data-status="hold"
                                style="color: rgb(69, 68, 68)">Hold</a>
                        </td>
                        <td class="text-right">{{ $onHoldProjects }}</td>
                    </tr>

                </tbody>
            </table>
        </div>

    </div>

    <div class="separator-breadcrumb border-top"></div>

    <div>

        <h1 class="text-center">Client Details</h1>
        <br>
        <div class="ml-3">
            <h5>Name : <span style="font-weight:bold">{{ $client->name }}</span></h5>
            <h5>Email : <span style="font-weight:bold">{{ $client->email }}</span></h5>
        </div>

        <div class="form-group col-md-12 mt-4">
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
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>


                            <tbody>
                                @php
                                    $i = 1;
                                @endphp
                                @foreach ($projects as $project)
                                    <tr>
                                        <th scope="row">{{ $i++ }}</th>
                                        <td><a href="{{ route('project.details', $project->id) }}"
                                                style="color: rgb(69, 68, 68)">{{ $project->project_name }}</a></td>
                                        <td>{{ $client->name }}</td>
                                        <td><?php echo $project->project . ' - ' . $project->project_type; ?></td>
                                        <td>{{ $project->project_phase }}</td>
                                        <td>{{ $project->status }}</td>
                                        <td><?php echo $project->start_date . ' to ' . $project->end_date; ?></td>
                                        <td>{{ $project->description }}</td>

                                        <td class="d-flex">
                                            <a class="text-success mr-2" onclick="edit_project('{{ $project->id }}')">
                                                <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                            </a>
                                            <a class="text-danger mr-2" onclick="delete_project('{{ $project->id }}')"
                                                title="Delete Project">
                                                <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                            </a>

                                            <a href="{{ route('project.details', $project->id) }}" class="text-primary">
                                                <i style="font-size: 17px" class="fa-solid fa-circle-info"></i>
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

                @if ($noProjects)
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <p>No Details Available This Month</p>
                        </div>
                    </div>
                @endif

            </div>
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.filter-projects').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const status = this.getAttribute('data-status');
                    filterProjects(status);
                });
            });
        });

        function filterProjects(status) {
            const rows = document.querySelectorAll('#project_datatable tbody tr');
            rows.forEach(row => {
                const projectStatus = row.querySelector('td:nth-child(6)').innerText.trim().toLowerCase();
                if (status === 'all' || projectStatus === status) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });

            const visibleRows = Array.from(rows).filter(row => row.style.display !== 'none');
            const noProjectsMessage = document.querySelector('.no-projects-message');
            if (visibleRows.length === 0) {
                if (!noProjectsMessage) {
                    const message = document.createElement('div');
                    message.className = 'row no-projects-message';
                    message.innerHTML = '<div class="col-sm-12 text-center"><p>No Details Available This Month</p></div>';
                    document.querySelector('#comma_decimal_table_wrapper').appendChild(message);
                }
            } else {
                if (noProjectsMessage) {
                    noProjectsMessage.remove();
                }
            }
        }
    </script>
@endsection

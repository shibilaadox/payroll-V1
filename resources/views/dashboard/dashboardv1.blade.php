@extends('layouts.master')
@section('main-content')
    <div class="breadcrumb">

        <ul>
            <li><a href="" style="color:green;font-size:18px;">Admin Dashboard</a></li>

        </ul>
    </div>

    <div class="separator-breadcrumb border-top"></div>

    <div class="row">
        <!-- ICON BG -->

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="{{ route('employees') }}">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-warning">
                    <div class="card-body text-center">
                        <i class="i-Add-User"></i>
                        <div class="content">
                            <p class="text-white text-20 line-height-1 mb-2">{{ $data['total_employees'] }}</p>
                            <p class="text-white mt-2 mb-0">Employees</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="{{ route('client.index') }}">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-danger">
                    <div class="card-body text-center">
                        <i class="i-Add-User"></i>
                        <div class="content">
                            {{-- <p class="text-white text-24 line-height-1 mb-2">{{$data['total_absent']}}</p>
                                <p class="text-white mt-2 mb-0">Absent</p> --}}
                            <p class="text-white text-20 line-height-1 mb-2">{{ $totalClients }}</p>
                            <p class="text-white mt-2 mb-0 text-nowrap">Clients</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="{{ route('projects.index') }}">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-success">
                    <div class="card-body text-center">
                        <i class="i-Add-User"></i>
                        <div class="content">
                            {{-- <p class="text-white text-24 line-height-1 mb-2">{{$data['total_present']}}</p>
                                <p class="text-white mt-2 mb-0">Present</p> --}}

                            <p class="text-white text-20 line-height-1 mb-2">{{ $totalProjects }}</p>
                            <p class="text-white mt-2 mb-0 text-nowrap">Projects</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="{{ route('departments.index') }}">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-warning">
                    <div class="card-body text-center">
                        <i class="i-Library"></i>
                        <div class="content">
                            <p class="text-white text-20 line-height-1 mb-2">{{ $data['total_departments'] }}</p>
                            <p class="text-white mt-2 mb-0">Departments</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="{{ route('timesheet.index') }}">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-danger">
                    <div class="card-body text-center">
                        <i class="i-Library"></i>
                        <div class="content">
                            <p class="text-white text-20 line-height-1 mb-2">{{ $totalHours ?? '0' }}</p>
                            <p class="text-white mt-2 mb-0 text-nowrap">Total Hours</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-lg-2 col-md-6 col-sm-6">
            <a href="">
                <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4 bg-success">
                    <div class="card-body text-center">
                        <i class="i-Library"></i>
                        <div class="content">
                            <p class="text-white text-20 line-height-1 mb-2">
                                {{ number_format($data['total_payment']) }}
                            </p>

                            <p class="text-white mt-2 mb-0 text-nowrap">Total Payment</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>


    </div>

    <div class="row" style="margin-top:3%">
        <div class="col-lg-6 col-md-12">
            <div class="card mb-4">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-50 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Total Salaries Paid') }}</h3>

                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart1" width="200" height="100"></canvas>



                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-12">


            <div class="row">
                <div class="col-md-12">
                    <div class="card o-hidden mb-4">
                        <div class="card-header d-flex align-items-center border-0 bg-info">
                            <h3 class="w-50 float-left card-title m-0" style="color:white;font-size:15px;">Latest Projects
                            </h3>
                            <h4 class="card-title mt-1" style="text-align: end;margin-left:35%;"><button type="button"
                                    class="btn btn-success btn-sm text-nowrap"><a style="color: white"
                                        href="{{ route('projects.index') }}">
                                        View All</a></button></h4>

                        </div>

                        <div class="">
                            <div class="table-responsive">
                                <table id="user_table" class="table  text-center">
                                    <thead>
                                        <tr style="font-size:14px;">
                                            <th scope="col">#</th>
                                            <th scope="col">Project Name</th>
                                            <th scope="col">Project Type</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Description</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($latestProjects as $project)
                                            <tr style="font-size:12px;">
                                                <th scope="row">{{ $loop->iteration }}</th>
                                                <td>{{ $project->project_name }}</td>
                                                <td>{{ $project->project_type }}</td>
                                                <td>{{ $project->start_date }} to {{ $project->end_date }}</td>
                                                <td>{{ $project->description }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>


    <div class="row" style="margin-top:3%">

        <div class="col-lg-6 col-sm-12">
            <div class="card mb-4" style="height:350px;">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Male to Female Employees') }}</h3>
                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart3" width="450" height="250"></canvas>



                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-sm-12">
            <div class="card mb-4" style="height:350px;">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Employees by Age Group') }}</h3>
                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart4" width="450" height="250"></canvas>



                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="row" style="margin-top:3%">
        <div class="col-lg-12 col-md-12">
            <div class="card mb-4">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-50 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Employees By Department') }}</h3>

                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart6" width="200" height="100"></canvas>



                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row" style="margin-top:3%">

        <div class="col-lg-6 col-sm-12">
            <div class="card mb-4" style="height:370px;">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Absentees Last 7 Days') }}</h3>
                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart2" width="450" height="250"></canvas>



                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-sm-12">

            <div class="card mb-4" style="height:370px;">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Project Status') }}</h3>
                </div>
                <div class="card-body">

                    <div class="m-widget3__item">

                        <canvas id="myChartDonut" width="450" height="250"></canvas>

                    </div>
                </div>
            </div>

        </div>



    </div>

    <div class="card o-hidden mb-4">
        <div class="card-header d-flex align-items-center border-0 bg-info">
            <h3 class="w-50 float-left card-title m-0" style="color:white;font-size:15px;">Clients</h3>
            <h4 class="card-title mt-1" style="text-align: end;margin-left:45%;"><button type="button"
                    class="btn btn-success btn-sm text-nowrap"><a style="color: white" href="{{ route('clients.index') }}">
                        View All</a></button></h4>

        </div>

        <div class="">
            <div class="table-responsive">
                <table id="user_table" class="table  text-center">
                    <thead>
                        <tr style="font-size:14px;">
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Address</th>

                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($latestClients as $clinets)
                            <tr style="font-size:12px;">
                                <th scope="row">{{ $loop->iteration }}</th>
                                <td>{{ $clinets->name }}</td>
                                <td>{{ $clinets->email }}</td>
                                <td>{{ $clinets->phone }}</td>
                                <td>{{ $clinets->address }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <div class="row" style="margin-top:3%">

        <div class="col-lg-12 col-sm-12">
            <div class="card mb-4">
                <div class="card-header d-flex align-items-center border-0 bg-info">
                    <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                        {{ __('Absentees This Month') }}</h3>
                </div>
                <div class="card-body">

                    <div class="m-widget3__item">


                        <canvas id="myChart5" width="450"></canvas>



                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row" style="margin-top:3%">

<div class="col-lg-6 col-sm-6">
    <div class="card mb-4">
        <div class="card-header d-flex align-items-center border-0 bg-info">
            <h3 class="w-70 float-left card-title m-0" style="color:white;font-size:15px;">
                {{ __('Payment--Last 6 Months') }}</h3>
        </div>
        <div class="card-body">

            <div class="m-widget3__item">


                <canvas id="myChart8" width="450"></canvas>



            </div>
        </div>
    </div>
</div>

</div>
@endsection

@section('page-js')
    <script src="https://code.jquery.com/jquery-1.11.0.min.js">
        < /script <
        script src = "{{ asset('assets/js/vendor/echarts.min.js') }}" >
    </script>
    <script src="{{ asset('assets/js/es5/echart.options.min.js') }}"></script>
    <script src="{{ asset('assets/js/es5/dashboard.v1.script.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>

    <script type="text/javascript">
        var chartDiv1 = $("#myChart1");
        var monthly_basic_salaries = <?php echo $data['monthly_basic_salaries']; ?>;

        labels1 = [];
        data1 = [];

        for (var i = 0; i < monthly_basic_salaries.length; i++) {
            labels1[i] = monthly_basic_salaries[i].text;
            data1[i] = monthly_basic_salaries[i].values;
        }

        var MonthlyBasicSalaries = {
            label: "Basic Salary",
            data: data1,
            backgroundColor: ["#0c0c7a"],
            barThickness: 28,
        };

        var barChart = new Chart(chartDiv1, {
            type: 'bar',
            data: {
                labels: labels1,
                datasets: [MonthlyBasicSalaries]
            }
        });

        var chartDiv8 = $("#myChart8");
        var monthly_payment = <?php echo $data['monthly_payment']; ?>;

        labels8 = [];
        data8 = [];

        for (var i = 0; i < monthly_payment.length; i++) {
            labels8[i] = monthly_payment[i].text;
            data8[i] = monthly_payment[i].values;
        }

        var MonthlyPayment = {
            label: "Payment",
            data: data8,
            backgroundColor: ["#0c0c7a"],
            barThickness: 28,
        };

        var barChart = new Chart(chartDiv8, {
            type: 'bar',
            data: {
                labels: labels8,
                datasets: [MonthlyPayment]
            }
        });

        var chartDiv2 = $("#myChart2");
        var absent_7days = <?php echo $data['absent_7days']; ?>;
        labels2 = [];
        data2 = [];


        for (var i = 0; i < absent_7days.length; i++) {
            labels2[i] = absent_7days[i].text;
            data2[i] = absent_7days[i].values;
        }

        var myChart2 = new Chart(chartDiv2, {
            type: 'doughnut',
            data: {
                labels: labels2,
                datasets: [{
                    data: data2,
                    backgroundColor: ["#c76161", "#91cf91", "#7157d8", "#e2b564", "#e37fe3", "#e2e263",
                        "#84ebe8"
                    ]
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Doughnut Chart'
                },
                /*plugins: {
                    legend: {
                    display: false
                    }
                },*/
                elements: {
                    arc: {
                        borderWidth: 0.5
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
            }
        });

        // Project status
        var chartDivDonut = $("#myChartDonut");
        var projectStatus = <?php echo $data['project_status']; ?>;
        var labelsDonut = [];
        var dataDonut = [];


        for (var i = 0; i < projectStatus.length; i++) {
            labelsDonut[i] = projectStatus[i].text;
            dataDonut[i] = projectStatus[i].values;
        }

        var myChartDonut = new Chart(chartDivDonut, {
            type: 'doughnut',
            data: {
                labels: labelsDonut,
                datasets: [{
                    data: dataDonut,
                    backgroundColor: ["#e2e263", "#e37fe3", "#c76161", "#e2b564"]
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Project Status'
                },
                /*plugins: {
                    legend: {
                    display: false
                    }
                },*/
                elements: {
                    arc: {
                        borderWidth: 0.5
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
            }
        });


        var absentee_month = <?php echo $data['absentee_month']; ?>;
        labels5 = [];
        data5 = [];


        for (var i = 0; i < absentee_month.length; i++) {
            labels5[i] = absentee_month[i].label;
            data5[i] = absentee_month[i].value;
        }


        var absentee_month = {
            labels: labels5,
            datasets: [{
                label: "Absentees",
                data: data5,
                borderColor: ["#5f985f"],
                backgroundColor: 'transparent',
            }]
        };

        var chartOptions = {
            legend: {
                display: true,
                position: 'top',
                labels: {

                    fontColor: 'black'
                }
            }
        };


        var chartDiv5 = $("#myChart5");

        var lineChart = new Chart(chartDiv5, {
            type: 'line',
            data: absentee_month,
            options: chartOptions
        });




        var chartDiv3 = $("#myChart3");
        var gender_counts = <?php echo $data['gender_counts']; ?>;
        labels3 = [];
        data3 = [];


        for (var i = 0; i < gender_counts.length; i++) {
            labels3[i] = gender_counts[i].text;
            data3[i] = gender_counts[i].values;
        }

        var myChart3 = new Chart(chartDiv3, {
            type: 'doughnut',
            data: {
                labels: labels3,
                datasets: [{
                    data: data3,
                    backgroundColor: ["#c76161", "#91cf91", "#7157d8"]
                }]
            },
            options: {

                title: {
                    display: true,
                    text: 'Doughnut Chart'
                },

                elements: {
                    arc: {
                        borderWidth: 0.5
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                is3D: true,
            }
        });


        var chartDiv4 = $("#myChart4");
        var age_group = <?php echo $data['age_group']; ?>;
        labels4 = [];
        data4 = [];

        labels4 = ["20-30", "30-40", "40-50", "50-60"];


        for (var i = 0; i < age_group.length; i++) {

            data4[i] = age_group[i].values;
        }

        var myChart4 = new Chart(chartDiv4, {
            type: 'doughnut',
            data: {
                labels: labels4,
                datasets: [{
                    data: data4,
                    backgroundColor: ["#c76161", "#91cf91", "#7157d8", "#e2b564"]
                }]
            },
            options: {

                title: {
                    display: true,
                    text: 'Doughnut Chart'
                },

                elements: {
                    arc: {
                        borderWidth: 0.5
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                is3D: true,
            }
        });


        var chartDiv6 = $("#myChart6");
        var employee_department = <?php echo $data['employee_department']; ?>;

        labels6 = [];
        data6 = [];

        for (var i = 0; i < employee_department.length; i++) {
            labels6[i] = employee_department[i].text;
            data6[i] = employee_department[i].values;
        }

        var EmployeeDepartment = {
            label: "Count",
            data: data6,
            backgroundColor: ["#0c0c7a"],
            barThickness: 20,
        };

        var barChart = new Chart(chartDiv6, {
            type: 'bar',
            data: {
                labels: labels6,
                datasets: [EmployeeDepartment]
            }
        });
    </script>
@endsection

@extends('layouts.master')

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Timesheet Entries
                    
                </h4>
                

                <div class="table-responsive">
                    <div id="timesheet_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12">

                            <form id="timesheet_form_1" name="timesheet_form_1" action="{{route('user_data_entry')}}" method="GET" class="needs-validation was-validated">
                    @csrf
                    
                    
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="payroll_period_start" class="ul-form__label">Payroll Start Date:</label>
                                <input type="date" class="form-control" id="payroll_period_start"
                                    name="payroll_period_start" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="payroll_period_end" class="ul-form__label">Payroll End Date:</label>
                                <input type="date" class="form-control" id="payroll_period_end"
                                    name="payroll_period_end" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="payroll_date" class="ul-form__label">Payroll Date:</label>
                                <input type="date" class="form-control" id="payroll_date" name="payroll_date"
                                    required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="week_number" class="ul-form__label">Week Number:</label>
                                <select class="form-control" id="week_number" name="week_number" required>
                                    <option value="" disabled selected>Select Week Number</option>
                                    <option value="A">A (1-15)</option>
                                    <option value="B">B (16-30)</option>
                                    

                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="client_id" class="ul-form__label">Client:</label>
                                <select class="form-control" id="client_id" name="client_id" required>
                                    <option value="" disabled selected>Select Client</option>
                                    @foreach ($clients as $client)
                                        <option value="{{ $client->id }}">{{ $client->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Location:</label>
                                <select class="form-control" id="location_id" name="location_id" required>
                                    <option value="" disabled selected>Select Location</option>
                                    @foreach ($locations as $location)
                                        <option value="{{ $location->id }}">{{ $location->location_name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="pay_type" class="ul-form__label">Pay Type:</label>
                                <select class="form-control" id="pay_type" name="pay_type" required>
                                    <option value="" disabled selected>Select Pay Type</option>
                                    <option>Daily Rate/Weekly Pay</option>
                                                    <option>Daily Rate/Monthly Pay</option>
                                                    <option>Monthly Rate/Weekly Pay</option>
                                                    <option>Monthly Rate/Monthly Pay</option>
                                                    <option>Monthly Rate/Executive</option>
                                                    <option>Reliever/Daily Rate</option>
                                                    <option>Reliever/Monthly Rate</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="month" class="ul-form__label">Month:</label>
                                <input type="text" class="form-control" id="month" name="month"
                                    placeholder="MM" required readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="year" class="ul-form__label">Year:</label>
                                <input type="text" class="form-control" id="year" name="year"
                                    placeholder="YYYY" required readonly>
                            </div>
                           
                        </div>
                    

             

                               
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="card-footer">
                                        <div class="mc-footer">
                                            <div class="row text-right">
                                                <div class="col-lg-10"></div>
                                                <div class="col-lg-2 text-left">
                                                    <button type="submit" class="btn btn-primary m-1"
                                                        id="save">DTR Entry</button>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
        </div>
    </div>

@endsection

@section('page-js')
    <script type="text/javascript">

        $("#payroll_period_end").click(function(){
            var date = $("#payroll_period_start").val();
            var dt = new Date( $("#payroll_period_start").val());
            var year_input = dt.getFullYear();
            var month_input = (dt.getMonth() < 10 ? '0' : '') + (dt.getMonth()+1);

            $("#month").val(month_input);
            $("#year").val(year_input);

        })

        $('#client_id').on('change', function() {
        var clientId = $(this).val();

        $('#user_id').empty().append('<option value="">Select Employee</option>');

        if (clientId) {
            $.ajax({
                url: 'employees-by-client/' + clientId,
                type: 'GET',
                success: function(data) {
                    $.each(data, function(key, employee) {
                        $('#user_id').append(
                            '<option value="' + employee.id + '">' + employee.firstname + ' ' + employee.lastname + '</option>'
                        );
                    });
                },
                error: function() {
                    alert('Error retrieving employees.');
                }
            });
        }
    });

    $(document).ready(function () {
        $('#user_id').change(function () {
            var employeeId = $(this).val();

            if (employeeId) {
                $.ajax({
                    url: 'get-employee-details/' + employeeId,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $('#employee_code').val(data.employee_code);
                        $('#posicode').val(data.job_role);
                    },
                    error: function () {
                        alert('Failed to fetch employee details.');
                    }
                });
            } else {
                $('#employee_code').val('');
                $('#posicode').val('');
            }
        });
    });

        // Call the function on page load
        $(document).ready(function() {
            initializeDataTable();
        });

        $('#client_id').change(function () {
            $('#location_id').html("");
            var clientId = $(this).val();

            if (clientId) {
                $.ajax({
                    url: 'get-locations/' + clientId,
                    type: 'GET',
                   
                    success: function(data) {
                    
                    $.each(data, function(key, location_data) {
                        
                        $('#location_id').append(
                            '<option value="' + location_data.id + '">' + location_data.location_name + '</option>'
                        );
                    });
                },
                    error: function () {
                        alert('Failed to fetch locations.');
                    }
                });
            } 
        });
    </script>
@endsection

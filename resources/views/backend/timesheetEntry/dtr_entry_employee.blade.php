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

                            
                    
                    
                        <div class="form-row">
                            <div class="form-group col-md-3" style="display:none">
                                <label for="payroll_period_start" class="ul-form__label">Payroll Start Date:</label>
                                <input type="date" class="form-control" id="payroll_period_start"
                                    name="payroll_period_start" required  value="{{$input['payroll_period_start']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="payroll_period_end" class="ul-form__label">Payroll End Date:</label>
                                <input type="date" class="form-control" id="payroll_period_end"
                                    name="payroll_period_end" required value="{{$input['payroll_period_end']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="payroll_date" class="ul-form__label">Payroll Date:</label>
                                <input type="date" class="form-control" id="payroll_date" name="payroll_date"
                                    required value="{{$input['payroll_date']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="week_number" class="ul-form__label">Week Number:</label>
                                <input type="text" class="form-control" id="week_number" name="week_number"
                                required value="{{$input['week_number']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="client_id" class="ul-form__label">Client:</label>
                                <input type="text" class="form-control" id="client_id" name="client_id"
                                required value="{{$input['client_id']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="location" class="ul-form__label">Location:</label>
                                <input type="text" class="form-control" id="location_id" name="location_id"
                                required value="{{$input['location_id']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="pay_type" class="ul-form__label">Pay Type:</label>
                                <input type="text" class="form-control" id="pay_type" name="pay_type"
                                required value="{{$input['pay_type']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="month" class="ul-form__label">Month:</label>
                                <input type="text" class="form-control" id="month" name="month"
                                    placeholder="MM" required value="{{$input['month']}}">
                            </div>
                            <div class="form-group col-md-3" style="display:none">
                                <label for="year" class="ul-form__label">Year:</label>
                                <input type="text" class="form-control" id="year" name="year"
                                    placeholder="YYYY" required value="{{$input['year']}}">
                            </div>





                            <table id="timesheet_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="timesheet_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Id</th>

                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Employee Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">First Name</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Last Name</th>
                                            
                                           
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i=1;foreach($employees as $row){?>
                                            <tr>
                                            <td>{{$i}}</td>
                                            <td>{{$row->employee_code}}</td>
                                            <td>{{$row->firstname}}</td>
                                            <td>{{$row->lastname}}</td>
                                        </tr>
                                        <?php  $i++;} ?>
                                    </tbody>
                                </table>




                           
                        </div>
                    

             

                               
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            
                                    
        </div>
    </div>

@endsection

@section('page-js')
    <script type="text/javascript">

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

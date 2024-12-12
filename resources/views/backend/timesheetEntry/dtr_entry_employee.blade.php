@extends('layouts.master')

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Timesheet Entries
                    
                </h4>

                <h4 class="mb-3 fs-22 font-weight-bold">
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_employee()">
                            New Employee</button></div>
                </h4>
                

                <div class="table-responsive">
                    <div id="timesheet_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12">

                            
                    
                    
                        <div class="form-row">
                           


                            <table id="timesheet_datatable_1" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="timesheet_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th tabindex="0" aria-controls="timesheet_datatable_1" rowspan="1"
                                                colspan="1">Id</th>

                                            <th tabindex="0" aria-controls="timesheet_datatable_1" rowspan="1"
                                                colspan="1">Employee Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable_1" rowspan="1"
                                                colspan="1">First Name</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable_1" rowspan="1"
                                                colspan="1">Last Name</th>
                                            
                                           
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i=1;foreach($employees as $row){?>
                                            <tr>
                                            <td>{{$i}}</td>
                                            <td onclick="add_timesheet({{$row->id}})">{{$row->employee_code}}</td>
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


    {{-- Add modal --}}
    <div class="modal fade" id="timesheet-modal" tabindex="-1" role="dialog" aria-labelledby="TimesheetModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document"
            style="max-width: 90%; margin: 0; top: 0; bottom: 0; left: 5%; right: 5%; display: flex;">
            <div class="modal-content">

                <form id="timesheet_form" name="timesheet_form" method="POST" class="needs-validation was-validated">
                    @csrf
                   
                    <div class="modal-body" id="timesheet-modal-body">
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


                                
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>

                </form>

            </div>
        </div>
    </div>

    {{-- Add modal --}}
    <div class="modal fade" id="employee-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="employee_form" name="employee_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Employee</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                        <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Employee_code:</label>
                                <input type="text" class="form-control" id="employee_code" name="employee_code" placeholder="Enter first name" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">First Name:</label>
                                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter first name" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Last Name:</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter first name" required>

                            </div>
                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Job Role:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="job_role" id="job_role">
                                                    <option value="">Select</option>

                                                    <option value="GUARD8">GUARD8</option>
                                                    <option value="GUARD10">GUARD10</option>
                                                    <option value="GUARD12">GUARD12</option>

                                                </select>
                                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="saveBtn">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>




    
@endsection

@section('page-js')
    <script type="text/javascript">


        function add_employee() {
            
            $('#employee-modal').modal('show');
        }

        //Submit add model
        $("#employee_form").on("submit", function(e) {
            e.preventDefault();
            var firstname = $("#firstname").val();
            var lastname = $("#lastname").val();
            var job_role = $("#job_role").val();
            var location_id = $("#location_id").val();
            var client_id = $("#client_id").val();
            var employee_code = $("#employee_code").val();
           
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('employee_store') }}",
                type: "GET",
                data: {firstname:firstname,lastname:lastname,job_role:job_role,client_id:client_id,location_id:location_id,employee_code:employee_code},
                dataType: 'text',
                success: function(response) {
                    // console.log(response.code);
                    //if (response.code == 200) {

                        $('#department-modal').modal('hide');
                        window.location.reload();


                    //}
                },
                error: function(response) {
                    
                }

            });

        });


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
            //initializeDataTable();
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

        function add_timesheet(user_id) {
            var client_id = $("#client_id").val();
            var location_id = $("#location_id").val();
            var pay_type = $("#pay_type").val();
            var payroll_period_start = $("#payroll_period_start").val();
            var payroll_period_end = $("#payroll_period_end").val();
            var payroll_date = $("#payroll_date").val();
            var week_number = $("#week_number").val();
            var month = $("#month").val();
            var payroll_period_start = $("#payroll_period_start").val();
            var year = $("#year").val();
            var user_id = user_id;

          

            $.ajax({
                url: "{{ route('userTimesheet.store') }}",
                type: "POST",
                dataType: 'text',
                data: {user_id:user_id,client_id:client_id,location_id:location_id,pay_type:pay_type,payroll_period_start:payroll_period_start,payroll_period_end:payroll_period_end,payroll_date:payroll_date,week_number:week_number,month:month,year:year},
                
                success: function(response) {
                    
                        $('#timesheet-modal').modal('show');
                        $("#timesheet-modal-body").html(response);
                      
                      
                },
                error: function(response) {
                    console.log(response);
                    //alert('Failed to save the timesheet entry. Please check the console for details.');
                }
            });
        }

    function delete_timesheet(id) {

        event.preventDefault();
        let _token = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
        url: "<?php echo url('delete_timesheet'); ?>",
        type: "GET",
        data: {
        id: id
        },
        cache: false,

        success: function(response) {

            $("#delete"+id+"").remove();

        },
        error: function(response) {

        }

        });

    }

$('#timesheet-modal').on('hidden.bs.modal', function () {
 location.reload();
})



</script>
@endsection

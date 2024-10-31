@extends('layouts.master')

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Timesheet Entries
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_timesheet()">
                            New Entry</button></div>
                </h4>
                <p class="fs-16">All Your Timesheet Entries</p>

                <div class="table-responsive">
                    <div id="timesheet_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="timesheet_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="timesheet_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Id</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Payroll Period</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Payroll Date</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Week Number</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Client</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Branch</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Pay Type</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Month</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Year</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1" colspan="1">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
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
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="timesheet_form" name="timesheet_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="TimesheetModalTitle">Add Timesheet Entry</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="start_date" class="ul-form__label">Payroll Start Date:</label>
                                <input type="date" class="form-control" id="start_date" name="start_date" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="end_date" class="ul-form__label">Payroll End Date:</label>
                                <input type="date" class="form-control" id="end_date" name="end_date" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="payroll_date" class="ul-form__label">Payroll Date:</label>
                                <input type="date" class="form-control" id="payroll_date" name="payroll_date" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="week_number" class="ul-form__label">Week Number:</label>
                                <select class="form-control" id="week_number" name="week_number" required>
                                    <option value="" disabled selected>Select Week Number</option>
                                    <option value="A">A (1-15)</option>
                                    <option value="B">B (16-30)</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="client_id" class="ul-form__label">Client:</label>
                                <select class="form-control" id="client_id" name="client_id" required>
                                    <option value="" disabled selected>Select Client</option>
                                    <!-- Populate with clients -->
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="branch_id" class="ul-form__label">Branch:</label>
                                <select class="form-control" id="branch_id" name="branch_id" required>
                                    <option value="" disabled selected>Select Branch</option>
                                    <!-- Populate with branches -->
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="pay_type" class="ul-form__label">Pay Type:</label>
                                <select class="form-control" id="pay_type" name="pay_type" required>
                                    <option value="" disabled selected>Select Pay Type</option>
                                    <!-- Populate with pay types -->
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="month" class="ul-form__label">Month:</label>
                                <input type="text" class="form-control" id="month" name="month" placeholder="MM" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="year" class="ul-form__label">Year:</label>
                                <input type="text" class="form-control" id="year" name="year" placeholder="YYYY" required>
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

{{-- @section('page-js')
    <script type="text/javascript">

        function add_timesheet() {
            $('#timesheet-modal').modal('show');
        }

        // Submit timesheet entry
        $("#timesheet_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                url: "{{ route('timesheets.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.code == 200) {
                        $('#timesheet-modal').modal('hide');
                        window.location.reload();
                    }
                },
                error: function(response) {
                }
            });
        });

        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('#timesheet_datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('timesheets.index') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'payroll_period', name: 'payroll_period' },
                    { data: 'payroll_date', name: 'payroll_date' },
                    { data: 'week_number', name: 'week_number' },
                    { data: 'client.name', name: 'client.name' },
                    { data: 'branch.name', name: 'branch.name' },
                    { data: 'pay_type', name: 'pay_type' },
                    { data: 'month', name: 'month' },
                    { data: 'year', name: 'year' },
                    { data: 'action', name: 'action', orderable: false },
                ]
            });
        });
    </script>
@endsection --}}

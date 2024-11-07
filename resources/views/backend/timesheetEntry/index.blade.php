@extends('layouts.master')

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Timesheet Entries
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1"
                            onclick="add_timesheet()">
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
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Id</th>

                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Payroll Date</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Week Number</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Client</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Location</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Pay Type</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Month</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Year</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Employee</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Employee Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Company Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Position Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT1 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT2 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT3 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT4 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT5 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT6 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT7 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT8 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT9 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT10 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT11 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT12 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT13 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day8 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day8 Rate</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day12 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day12 Rate</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">ND Days</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Undertime</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Incentive</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Actions</th>
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
        <div class="modal-dialog" role="document"
            style="max-width: 90%; margin: 0; top: 0; bottom: 0; left: 5%; right: 5%; display: flex;">
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
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
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
                                    @foreach ($salaryPayTypes as $payType)
                                        <option value="{{ $payType }}">{{ $payType }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="month" class="ul-form__label">Month:</label>
                                <input type="text" class="form-control" id="month" name="month"
                                    placeholder="MM" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="year" class="ul-form__label">Year:</label>
                                <input type="text" class="form-control" id="year" name="year"
                                    placeholder="YYYY" required>
                            </div>
                            <div class="line" style="border-bottom: 1px solid black; margin-top: 5px; width: 100%;">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="payroll_period_start" class="ul-form__label">Date:</label>
                                <input type="date" class="form-control" id="date" name="date" required>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Employee:</label>
                                <select class="form-control" id="user_id" name="user_id" required>
                                    <option value="" disabled selected>Select User</option>
                                    @foreach ($users as $user)
                                        <option value="{{ $user->id }}"><?php echo $user->firstname . ' ' . $user->middlename . ' ' . $user->lastname; ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Employee Code:</label>
                                <input type="text" class="form-control" id="employee_code" name="employee_code"
                                    required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Company Code:</label>
                                <input type="text" class="form-control" id="company_code" name="company_code"
                                    required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Position Code:</label>
                                <input type="text" class="form-control" id="posicode" name="posicode" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 1:</label>
                                <input type="text" class="form-control" id="ot1_hrs" name="ot1_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 2:</label>
                                <input type="text" class="form-control" id="ot2_hrs" name="ot2_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 3:</label>
                                <input type="text" class="form-control" id="ot3_hrs" name="ot3_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 4:</label>
                                <input type="text" class="form-control" id="ot4_hrs" name="ot4_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 5:</label>
                                <input type="text" class="form-control" id="ot5_hrs" name="ot5_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 6:</label>
                                <input type="text" class="form-control" id="ot6_hrs" name="ot6_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 7:</label>
                                <input type="text" class="form-control" id="ot7_hrs" name="ot7_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 8:</label>
                                <input type="text" class="form-control" id="ot8_hrs" name="ot8_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 9:</label>
                                <input type="text" class="form-control" id="ot9_hrs" name="ot9_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 10:</label>
                                <input type="text" class="form-control" id="ot10_hrs" name="ot10_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 11:</label>
                                <input type="text" class="form-control" id="ot11_hrs" name="ot11_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 12:</label>
                                <input type="text" class="form-control" id="ot12_hrs" name="ot12_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 13:</label>
                                <input type="text" class="form-control" id="ot13_hrs" name="ot13_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day8 Hrs:</label>
                                <input type="text" class="form-control" id="day8" name="day8" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day8 Rate:</label>
                                <input type="text" class="form-control" id="day8_rate" name="day8_rate" required
                                    value="{{ $rate8->rate8 }}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day12 Hrs:</label>
                                <input type="text" class="form-control" id="day12" name="day12" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day12 Rate:</label>
                                <input type="text" class="form-control" id="day12_rate" name="day12_rate" required
                                    value="{{ $rate12->rate12 }}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Night Differential Days:</label>
                                <input type="text" class="form-control" id="nd_days" name="nd_days" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Undertime:</label>
                                <input type="text" class="form-control" id="undertime" name="undertime" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Incentive:</label>
                                <input type="text" class="form-control" id="incentive" name="incentive" required>
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

    <!-- Edit Timesheet Modal -->
    <div class="modal fade" id="editTimesheetModal" tabindex="-1" role="dialog"
        aria-labelledby="editTimesheetModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 110%;">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTimesheetModalLabel">Edit Timesheet</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form  id="editTimesheetForm" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="modal-body">
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
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
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
                                    @foreach ($salaryPayTypes as $payType)
                                        <option value="{{ $payType }}">{{ $payType }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="month" class="ul-form__label">Month:</label>
                                <input type="text" class="form-control" id="month" name="month"
                                    placeholder="MM" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="year" class="ul-form__label">Year:</label>
                                <input type="text" class="form-control" id="year" name="year"
                                    placeholder="YYYY" required>
                            </div>
                            <div class="line" style="border-bottom: 1px solid black; margin-top: 5px; width: 100%;">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="payroll_period_start" class="ul-form__label">Date:</label>
                                <input type="date" class="form-control" id="date" name="date" required>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Employee:</label>
                                <select class="form-control" id="user_id" name="user_id" required>
                                    <option value="" disabled selected>Select User</option>
                                    @foreach ($users as $user)
                                        <option value="{{ $user->id }}"><?php echo $user->firstname . ' ' . $user->middlename . ' ' . $user->lastname; ?></option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Employee Code:</label>
                                <input type="text" class="form-control" id="employee_code" name="employee_code"
                                    required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Company Code:</label>
                                <input type="text" class="form-control" id="company_code" name="company_code"
                                    required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Position Code:</label>
                                <input type="text" class="form-control" id="posicode" name="posicode" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 1:</label>
                                <input type="text" class="form-control" id="ot1_hrs" name="ot1_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 2:</label>
                                <input type="text" class="form-control" id="ot2_hrs" name="ot2_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 3:</label>
                                <input type="text" class="form-control" id="ot3_hrs" name="ot3_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 4:</label>
                                <input type="text" class="form-control" id="ot4_hrs" name="ot4_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 5:</label>
                                <input type="text" class="form-control" id="ot5_hrs" name="ot5_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 6:</label>
                                <input type="text" class="form-control" id="ot6_hrs" name="ot6_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 7:</label>
                                <input type="text" class="form-control" id="ot7_hrs" name="ot7_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 8:</label>
                                <input type="text" class="form-control" id="ot8_hrs" name="ot8_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 9:</label>
                                <input type="text" class="form-control" id="ot9_hrs" name="ot9_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 10:</label>
                                <input type="text" class="form-control" id="ot10_hrs" name="ot10_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 11:</label>
                                <input type="text" class="form-control" id="ot11_hrs" name="ot11_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 12:</label>
                                <input type="text" class="form-control" id="ot12_hrs" name="ot12_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Overtime 13:</label>
                                <input type="text" class="form-control" id="ot13_hrs" name="ot13_hrs" required
                                    value=0>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day8 Hrs:</label>
                                <input type="text" class="form-control" id="day8" name="day8" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day8 Rate:</label>
                                <input type="text" class="form-control" id="day8_rate" name="day8_rate" required
                                    value="{{ $rate8->rate8 }}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day12 Hrs:</label>
                                <input type="text" class="form-control" id="day12" name="day12" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Day12 Rate:</label>
                                <input type="text" class="form-control" id="day12_rate" name="day12_rate" required
                                    value="{{ $rate12->rate12 }}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Night Differential Days:</label>
                                <input type="text" class="form-control" id="nd_days" name="nd_days" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Undertime:</label>
                                <input type="text" class="form-control" id="undertime" name="undertime" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="location" class="ul-form__label">Incentive:</label>
                                <input type="text" class="form-control" id="incentive" name="incentive" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Timesheet</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('page-js')
    <script type="text/javascript">
        function add_timesheet() {
            $('#timesheet-modal').modal('show');
            $('#timesheet_form')[0].reset();
            $('#saveBtn').text('Save changes');
            $('#timesheet_form').attr('data-id', '');
        }

        // Submit timesheet entry
        $("#timesheet_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                url: "{{ route('userTimesheet.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.code == 200) {
                        $('#timesheet-modal').modal('hide');
                        window.location.reload();
                    } else {
                        alert('Failed to save the timesheet entry.');
                    }
                },
                error: function(response) {
                    console.log(response);
                    alert('Failed to save the timesheet entry. Please check the console for details.');
                }
            });
        });

        function initializeDataTable() {
            $('#timesheet_datatable').DataTable().destroy();
            $('#timesheet_datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('userTimesheet.data') }}",
                columns: [{
                        data: 'id',
                        name: 'id'
                    },

                    {
                        data: 'payroll_date',
                        name: 'payroll_date'
                    },
                    {
                        data: 'week_number',
                        name: 'week_number'
                    },
                    {
                        data: 'client.name',
                        name: 'client.name'
                    },
                    {
                        data: 'location.name',
                        name: 'location.name'
                    },
                    {
                        data: 'pay_type',
                        name: 'pay_type'
                    },
                    {
                        data: 'month',
                        name: 'month'
                    },
                    {
                        data: 'year',
                        name: 'year'
                    },
                    {
                        data: 'user.name',
                        name: 'user.name'
                    },
                    {
                        data: 'employee_code',
                        name: 'employee_code'
                    },
                    {
                        data: 'company_code',
                        name: 'company_code'
                    },
                    {
                        data: 'posicode',
                        name: 'posicode'
                    },
                    {
                        data: 'ot1_hrs',
                        name: 'ot1_hrs'
                    },
                    {
                        data: 'ot2_hrs',
                        name: 'ot2_hrs'
                    },
                    {
                        data: 'ot3_hrs',
                        name: 'ot3_hrs'
                    },
                    {
                        data: 'ot4_hrs',
                        name: 'ot4_hrs'
                    },
                    {
                        data: 'ot5_hrs',
                        name: 'ot5_hrs'
                    },
                    {
                        data: 'ot6_hrs',
                        name: 'ot6_hrs'
                    },
                    {
                        data: 'ot7_hrs',
                        name: 'ot7_hrs'
                    },
                    {
                        data: 'ot8_hrs',
                        name: 'ot8_hrs'
                    },
                    {
                        data: 'ot9_hrs',
                        name: 'ot9_hrs'
                    },
                    {
                        data: 'ot10_hrs',
                        name: 'ot10_hrs'
                    },
                    {
                        data: 'ot11_hrs',
                        name: 'ot11_hrs'
                    },
                    {
                        data: 'ot12_hrs',
                        name: 'ot12_hrs'
                    },
                    {
                        data: 'ot13_hrs',
                        name: 'ot13_hrs'
                    },
                    {
                        data: 'day8',
                        name: 'day8'
                    },
                    {
                        data: 'day8_rate',
                        name: 'day8_rate'
                    },
                    {
                        data: 'day12',
                        name: 'day12'
                    },
                    {
                        data: 'day12_rate',
                        name: 'day12_rate'
                    },
                    {
                        data: 'nd_days',
                        name: 'nd_days'
                    },
                    {
                        data: 'undertime',
                        name: 'undertime'
                    },
                    {
                        data: 'incentive',
                        name: 'incentive'
                    },

                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
        }

        function editTimesheet(id) {
            $.ajax({
                url: "/user-timesheets/" + id + "/edit",
                method: 'GET',
                success: function(response) {
                    $(' #user_id').val(response.timesheet.user_id);
                    $('#editTimesheetModal #payroll_period_start').val(response.timesheet.payroll_period_start);
                    $('#editTimesheetModal #payroll_period_end').val(response.timesheet.payroll_period_end);
                    $('#editTimesheetModal #payroll_date').val(response.timesheet.payroll_date);
                    $('#editTimesheetModal #week_number').val(response.timesheet.week_number);
                    $('#editTimesheetModal #client_id').val(response.timesheet.client_id);
                    $('#editTimesheetModal #location_id').val(response.timesheet.location_id);
                    $('#editTimesheetModal #pay_type').val(response.timesheet.pay_type);
                    $('#editTimesheetModal #month').val(response.timesheet.month);
                    $('#editTimesheetModal #year').val(response.timesheet.year);
                    $('#editTimesheetModal #date').val(response.timesheet.date);
                    $('#editTimesheetModal #user_id').val(response.timesheet.user_id);
                    $('#editTimesheetModal #employee_code').val(response.timesheet.employee_code);
                    $('#editTimesheetModal #company_code').val(response.timesheet.company_code);
                    $('#editTimesheetModal #posicode').val(response.timesheet.posicode);
                    $('#editTimesheetModal #ot1_hrs').val(response.timesheet.ot1_hrs || 0);
                    $('#editTimesheetModal #ot2_hrs').val(response.timesheet.ot2_hrs || 0);
                    $('#editTimesheetModal #ot3_hrs').val(response.timesheet.ot3_hrs || 0);
                    $('#editTimesheetModal #ot4_hrs').val(response.timesheet.ot4_hrs || 0);
                    $('#editTimesheetModal #ot5_hrs').val(response.timesheet.ot5_hrs || 0);
                    $('#editTimesheetModal #ot6_hrs').val(response.timesheet.ot6_hrs || 0);
                    $('#editTimesheetModal #ot7_hrs').val(response.timesheet.ot7_hrs || 0);
                    $('#editTimesheetModal #ot8_hrs').val(response.timesheet.ot8_hrs || 0);
                    $('#editTimesheetModal #ot9_hrs').val(response.timesheet.ot9_hrs || 0);
                    $('#editTimesheetModal #ot10_hrs').val(response.timesheet.ot10_hrs || 0);
                    $('#editTimesheetModal #ot11_hrs').val(response.timesheet.ot11_hrs || 0);
                    $('#editTimesheetModal #ot12_hrs').val(response.timesheet.ot12_hrs || 0);
                    $('#editTimesheetModal #ot13_hrs').val(response.timesheet.ot13_hrs || 0);
                    $('#editTimesheetModal #day8').val(response.timesheet.day8);
                    $('#editTimesheetModal #day8_rate').val(response.timesheet.day8_rate);
                    $('#editTimesheetModal #day12').val(response.timesheet.day12);
                    $('#editTimesheetModal #day12_rate').val(response.timesheet.day12_rate);
                    $('#editTimesheetModal #nd_days').val(response.timesheet.nd_days);
                    $('#editTimesheetModal #undertime').val(response.timesheet.undertime);
                    $('#editTimesheetModal #incentive').val(response.timesheet.incentive);
                    $('#editTimesheetForm').attr('action', '/user-timesheets/' + id);

                    // Show the modal
                    $('#editTimesheetModal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching timesheet data: " + error);
                }
            });
        }

        $('#editTimesheetForm').submit(function(e) {
            e.preventDefault();
            var form = $(this);
            var url = form.attr('action');

            $.ajax({
                url: url,
                type: 'POST',
                data: form.serialize(),
                success: function(response) {
                    $('#editTimesheetModal').modal('hide');
                    alert('Timesheet updated successfully');
                },
                error: function(xhr, status, error) {
                    console.error("Error updating timesheet: " + error);
                }
            });
        });

        // Update timesheet
        $('#editTimesheetForm').submit(function(e) {
            e.preventDefault();
            var form = $(this);
            var url = form.attr('action');

            $.ajax({
                url: url,
                type: 'POST',
                data: form.serialize(),
                success: function(response) {
                    $('#editTimesheetModal').modal('hide');
                    $('#timesheet_datatable').DataTable().ajax.reload(null, false);
                    alert('Timesheet updated successfully');
                },
                error: function(xhr, status, error) {
                    console.error("Error updating timesheet: " + error);
                    alert('Failed to update timesheet.');
                }
            });
        });


        // Call the function on page load
        $(document).ready(function() {
            initializeDataTable();
        });
    </script>
@endsection

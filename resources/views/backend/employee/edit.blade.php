@extends('layouts.master')
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<style type="text/css">
    .toggle {
        width: 83px !important;
    }
</style>

@section('main-content')
    <div class="breadcrumb">
        <h1>Update Employee</h1>
    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <div class="row mb-12">

            <div class="col-lg-12 mb-3">
                <!--begin::form 2-->
                <form action="{{ route('employee.update', $user->id) }}" method="POST" class="needs-validation"
                    enctype="multipart/form-data">
                    <input name="_method" type="hidden" value="PATCH">
                    @csrf
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <div class="card">

                                    <div class="card-body">
                                        <div style="margin-bottom:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Basic Information</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">
                                        <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Employee Code:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="employee_code"
                                                    placeholder="Employee Code" name="employee_code"  value="{{ $user->employee_code }}" readonly>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    First Name:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="first_name"
                                                    placeholder="Enter first name" name="first_name" required
                                                    value="{{ $user->firstname }}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Middle Name:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="middle_name"
                                                    placeholder="Enter middle name" name="middle_name" required
                                                    value="{{ $user->middlename }}">
                                            </div>
                                            

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Last Name:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="last_name"
                                                    placeholder="Enter last name" name="last_name" required
                                                    value="{{ $user->lastname }}">
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">



                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Email address:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" name="email" id="email"
                                                    placeholder="Enter Email" required value="{{ $user->email }}">
                                            </div>

                                        </div>

                                        <div style="margin-bottom:20px;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Work Information</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">Department:</label> <span
                                                    class="text-danger">*</span>
                                                <select class="form-control" name="department" id="department_name" required>
                                                    <option value="">Select</option>
                                                    @foreach ($departments as $department)
                                                        <option value="{{ $department->id }}"
                                                            {{ $department->id == $userdetails->department ? 'selected' : '' }}>
                                                            {{ $department->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Client:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="client" id="client" required>
                                                    <option value="">Select</option>
                                                    @foreach ($clients as $client)
                                                        <option value="{{ $client->id }}" {{ $client->id == $user->client ? 'selected' : '' }}>{{ $client->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">Location: <span
                                                        class="text-danger">*</span></label>
                                                <select class="form-control" name="location_name" id="location_name" required>
                                                    <option value="">Select</option>
                                                    @foreach ($locations as $location)
                                                        <option value="{{ $location->id }}"
                                                            {{ $userdetails->location == $location->id ? 'selected' : '' }}>
                                                            {{ $location->location_name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">Designation: <span
                                                        class="text-danger">*</span></label>
                                                <select class="form-control" name="designation_name" id="designation_name" required>
                                                    <option value="">Select</option>
                                                    @foreach ($designations as $designation)
                                                        <option value="{{ $designation->id }}"
                                                            {{ $designation->id == $userdetails->designation ? 'selected' : '' }}>
                                                            {{ $designation->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>




                                        </div>

                                        <div class="form-row col-md-12">

                                            {{-- <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Designation:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="designation_name" id="designation_name">
                                                    <option value="">Select</option>
                                                    @foreach ($designations as $designation)
                                                        <option value="{{ $designation->id }}" <?php
                                                        // if ($designation->id == $user->designation) {
                                                        //     echo 'selected';
                                                        // }
                                                        ?>>
                                                            {{ $designation->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div> --}}

                                           
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Job Role:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="job_role" id="job_role" required>
                                                    <option value="">Select</option>

                                                    <option value="GUARD8" <?php if ($user->job_role == 'GUARD8') {
                                                        echo 'selected';
                                                    } ?>>GUARD8</option>
                                                    <option value="GUARD10" <?php if ($user->job_role == 'GUARD10') {
                                                        echo 'selected';
                                                    } ?>>GUARD10</option>
                                                    <option value="GUARD12" <?php if ($user->job_role == 'GUARD12') {
                                                        echo 'selected';
                                                    } ?>>GUARD12</option>
                                                    

                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Status:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="status" id="status" required>
                                                    <option value="">Select</option>

                                                    <option value="1" <?php if ($user->status == 1) {
                                                        echo 'selected';
                                                    } ?>>Active</option>
                                                    <option value="0" <?php if ($user->status == 0) {
                                                        echo 'selected';
                                                    } ?>>Terminated</option>
                                                    <option value="2" <?php if ($user->status == 2) {
                                                        echo 'selected';
                                                    } ?>>Deceased</option>
                                                    <option value="3" <?php if ($user->status == 4) {
                                                        echo 'selected';
                                                    } ?>>Resigned</option>

                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Joining Date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="joining_date"
                                                    placeholder="Enter Joining Date" name="joining_date"
                                                    value="{{ old('joining_date', $userdetails->joining_date) }}">
                                            </div>


                                        </div>

                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Personal Details</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            {{-- <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Date of Birth:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="dob"
                                                    placeholder="Enter DOB" name="dob" value="{{ $user->dob }}">
                                            </div> --}}

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Date of Birth:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="dob"
                                                    placeholder="Enter DOB" name="dob"
                                                    value="{{ old('dob', $user->dob) }}">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Gender:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="gender" id="gender">
                                                    <option value="">Select a gender</option>
                                                    <option value="Male" <?php if ($user->gender == 'Male') {
                                                        echo 'selected';
                                                    } ?>>Male</option>
                                                    <option value="Female" <?php if ($user->gender == 'Female') {
                                                        echo 'selected';
                                                    } ?>>Female</option>
                                                    <option value="Other" <?php if ($user->gender == 'Other') {
                                                        echo 'selected';
                                                    } ?>>Other</option>

                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Marital Status:</label> <span class="text-danger">*</span>
                                                <select name="marital_status" id="marital_status" class="form-control">
                                                    <option value="">Select a marital status</option>
                                                    <option value="Single"
                                                        @if ($userdetails->marital_status == 'Single') selected @endif>Single</option>
                                                    <option value="Married"
                                                        @if ($userdetails->marital_status == 'Married') selected @endif>Married</option>
                                                    <option value="Widowed"
                                                        @if ($userdetails->marital_status == 'Widowed') selected @endif>Widowed</option>
                                                    <option value="Seperated"
                                                        @if ($userdetails->marital_status == 'Seperated') selected @endif>Seperated</option>
                                                    <option value="Divorced"
                                                        @if ($userdetails->marital_status == 'Divorced') selected @endif>Divorced</option>
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Blood Group:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="blood_group" id="blood_group">
                                                    <option value="">Select a blood group</option>
                                                    <option @if ($userdetails->blood_group == 'A+') selected @endif>A+</option>
                                                    <option @if ($userdetails->blood_group == 'A-') selected @endif>A-</option>
                                                    <option @if ($userdetails->blood_group == 'B+') selected @endif>B+</option>
                                                    <option @if ($userdetails->blood_group == 'B-') selected @endif>B-</option>
                                                    <option @if ($userdetails->blood_group == 'AB+') selected @endif>AB+</option>
                                                    <option @if ($userdetails->blood_group == 'AB-+') selected @endif>AB-</option>
                                                    <option @if ($userdetails->blood_group == 'O+') selected @endif>O+</option>
                                                    <option @if ($userdetails->blood_group == 'O-') selected @endif>O-</option>
                                                    <option @if ($userdetails->blood_group == 'Unknown') selected @endif>Unknown
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">

                                                <label for="imgfile"
                                                    class="col-form-label">{{ __('Profile Image') }}</label>
                                                <br>
                                                <input type="file" name='imgfile' id="imgfile"
                                                    style="display:none">
                                                <input type="button" class="btn btn-sm btn-primary mb-1"
                                                    onClick="$('#imgfile').click()" value="{{ __('select File') }}">

                                                <br><br>
                                                <img src='<?php echo $user->profile_photo; ?>' id='ad_img'
                                                    style='max-height:100px;max-width:100px;' />

                                            </div>


                                        </div>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Identity Information</b>
                                            </h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <!--<label for="inputEmail1" class="ul-form__label">
                                                    Aadhaar:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="aadhaar_no"
                                                    placeholder="Enter Aadhaar No" name="aadhaar_no"
                                                    value="{{ $userdetails->adhaar_no }}">-->

                                                <label for="inputEmail1" class="ul-form__label">
                                                    SSS No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="sss_no"
                                                    placeholder="Enter SSS No" name="sss_no"
                                                    value="{{ $userdetails->sss_number }}">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    PhilHealth No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="philhealth_no"
                                                    placeholder="Enter PhilHealth No" name="philhealth_no"
                                                    value="{{ $userdetails->philHealth_number }}">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    HDMF:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="hdmf"
                                                    placeholder="Enter HDMF" name="hdmf"
                                                    value="{{ $userdetails->hdmf_number }}">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    Tax Identification No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="tax_identification_no"
                                                    placeholder="Enter Tax Identification No" name="tax_identification_no"
                                                    value="{{ $userdetails->tax_identification_number }}">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <!--<label for="inputEmail1" class="ul-form__label">
                                                    PAN:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="pan_no"
                                                    placeholder="Enter Pan No" name="pan_no"
                                                    value="{{ $userdetails->pan_no }}">-->

                                                <label for="inputEmail1" class="ul-form__label">
                                                    License No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="license_no"
                                                    placeholder="Enter License No" name="license_no"
                                                    value="{{ $userdetails->license_number }}">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    License expiration date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="license_expiration_date"
                                                    placeholder="Enter License Expiration Date No"
                                                    name="license_expiration_date"
                                                    value="{{ $userdetails->license_exp_date }}">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    Bank and Account Number:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="bank_and_account_no"
                                                    placeholder="Enter Bank And Account No" name="bank_and_account_no"
                                                    value="{{ $userdetails->bank_and_account_number }}">
                                            </div>

                                        </div>

                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Contact Details</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Mobile Number:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" name="phone" id="phone"
                                                    placeholder="Enter Phone number" required
                                                    value="{{ $user->phone }}">
                                            </div>



                                        </div>


                                        <div class="form-row col-md-12">
                                            @if ($useraddresses)
                                                <div class="form-group col-md-6">
                                                    <label for="inputEmail1" class="ul-form__label">
                                                        Present Address:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" name="present_address"
                                                        id="present_address" placeholder="Address" 
                                                        value="{{ $useraddresses->residential_address }}"><br>
                                                    <input type="text" class="form-control" name="present_city"
                                                        id="present_city" placeholder="City" 
                                                        value="{{ $useraddresses->residential_city }}"><br>
                                                    <input type="text" class="form-control" name="present_state"
                                                        id="present_state" placeholder="State" 
                                                        value="{{ $useraddresses->residential_state }}"><br>
                                                    <input type="text" class="form-control" name="present_country"
                                                        id="present_country" placeholder="Country" 
                                                        value="{{ $useraddresses->residential_country }}"><br>
                                                    <input type="text" class="form-control" name="present_national_id"
                                                        id="present_national_id" placeholder="National ID" 
                                                        value="{{ $useraddresses->present_national_id }}">
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="inputEmail1" class="ul-form__label">
                                                        Permanent Address:</label> <span class="text-danger"
                                                        style="margin-right:20px;">*</span><input type="checkbox"
                                                        id="address_checkbox">&nbsp;&nbsp;<label
                                                        class="ul-form__label">Same
                                                        as Present Address</label>
                                                    <input type="text" class="form-control" name="permanent_address"
                                                        id="permanent_address" placeholder="Address" 
                                                        value="{{ $useraddresses->permanent_address }}"><br>
                                                    <input type="text" class="form-control" name="permanent_city"
                                                        id="permanent_city" placeholder="City" 
                                                        value="{{ $useraddresses->permanent_city }}"><br>
                                                    <input type="text" class="form-control" name="permanent_state"
                                                        id="permanent_state" placeholder="State"
                                                        value="{{ $useraddresses->permanent_state }}"><br>
                                                    <input type="text" class="form-control" name="permanent_country"
                                                        id="permanent_country" placeholder="Country" 
                                                        value="{{ $useraddresses->permanent_country }}"><br>
                                                    <input type="text" class="form-control" name="permanent_national_id"
                                                        id="permanent_national_id" placeholder="National ID" 
                                                        value="{{ $useraddresses->permanent_national_id }}">
                                                </div>
                                            @else
                                                <p>No address found.</p>
                                            @endif

                                        </div>



                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Salary Details</b></h6>
                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Annual CTC:</label>
                                                <div class="input-group mb-3">

                                                    <div class="input-group-append">
                                                        <span class="input-group-text" id="basic-addon2">&#x20B9;</span>
                                                    </div>
                                                    <input type="text" class="form-control" name="annual_ctc"
                                                        id="annual_ctc" value="{{ $userdetails->annual_ctc_details }}" required>
                                                </div>

                                            </div>

                                            <div class="form-group col-md-6 ms-5">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Pay Type:</label>
                                                <select class="form-control" name="pay_type" id="pay_type" required>
                                                    <option value="">Select a Pay type</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Daily Rate/Weekly Pay') selected @endif>Daily Rate/Weekly Pay</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Daily Rate/Monthly Pay') selected @endif>Daily Rate/Monthly Pay</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Monthly Rate/Weekly Pay') selected @endif>Monthly Rate/Weekly Pay</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Monthly Rate/Monthly Pay') selected @endif>Monthly Rate/Monthly Pay</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Monthly Rate/Executive') selected @endif>Monthly Rate/Executive</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Reliever/Daily Rate') selected @endif>Reliever/Daily Rate</option>
                                                    <option @if ($userdetails->salary_pay_type == 'Reliever/Monthly Rate') selected @endif>Reliever/Monthly Rate</option>
                                                </select>
                                            </div>


                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Regular Rate:</label>
                                                <input type="text" class="form-control" name="regular_rate"
                                                    id="regular_rate" value="{{ $userdetails->regular_rate }}" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Supervisor Incentive:</label>

                                                <input type="text" class="form-control" name="supervisor_incentive"
                                                    id="supervisor_incentive" value="{{ $userdetails->supervisor_incentive }}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Transportation Allowance:</label>

                                                <input type="text" class="form-control" name="trans_allowance"
                                                    id="trans_allowance" value="{{ $userdetails->transportation_allowance }}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Cost Of Living Allowance:</label>

                                                <input type="text" class="form-control" name="COLA"
                                                    id="COLA" value="{{ $userdetails->supervisor_incentive }}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Daily Meal Allowance:</label>

                                                <input type="text" class="form-control" name="daily_meal_allowance"
                                                    id="daily_meal_allowance" value="{{ $userdetails->cost_of_living_allowance }}">
                                            </div>


                                        </div>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Seperation Information</b>
                                            </h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Contract Starting Date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="contract_start_date"
                                                    placeholder="Enter Contract Starting Date" name="contract_start_date"
                                                    value="{{ $userdetails->contract_starting_date }}">
                                            </div>
 
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Contract Ending Date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="contract_end_date"
                                                    placeholder="Enter Contract Ending Date" name="contract_end_date"
                                                    value="{{ $userdetails->contract_ending_date }}">
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Reason for Leaving:</label> <span class="text-danger">*</span>
                                                <textarea class="form-control" id="reason_for_leaving" placeholder="Enter Reason for Leaving"
                                                    name="reason_for_leaving" value="{{ $user->reason_for_leaving }}"></textarea>
                                            </div>



                                        </div>


                                    </div>

                                    <div class="card-footer">
                                        <div class="mc-footer">
                                            <div class="row text-right">
                                                <div class="col-lg-10"></div>
                                                <div class="col-lg-2 text-left">
                                                    <button type="submit" class="btn btn-primary m-1">Save</button>
                                                    <button type="button"
                                                        class="btn btn-outline-secondary m-1">Cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                </form>
                <!-- end::form 2-->
            </div>
            <div class="col-lg-3"></div>
        </div>
    </section>
@endsection
@section('page-js')
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script type="text/javascript">
        $('input[name="dob"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });


        $('input[name="psprt_expiry_date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            //maxYear: parseInt(moment().format('YYYY'),10)
        });

        $("#imgfile").change(function() {
            readURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#ad_img').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }



        $('input[name="joining_date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });


        $('input[name="contract_start_date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });


        $('input[name="contract_end_date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });


        $('#address_checkbox').change(function() {
            if ($(this).is(":checked")) {
                $("#permanent_address").val($("#present_address").val());
                $("#permanent_city").val($("#present_city").val());
                $("#permanent_state").val($("#present_state").val());
                $("#permanent_country").val($("#present_country").val());
                $("#permanent_pincode").val($("#present_pincode").val());
            } else {
                $("#permanent_address").val('');
                $("#permanent_city").val('');
                $("#permanent_state").val('');
                $("#permanent_country").val('');
                $("#permanent_pincode").val('');
            }
        });

        $(document).ready(function() {

            $('input[name="contract_start_date"]').val('');
            $('input[name="contract_end_date"]').val('');

        })



        function copyAddress() {
            // Get the checkbox and address fields
            var checkbox = document.getElementById('same_as_permanent_address');
            var permanentAddress = document.getElementById('permanent_address');
            var presentAddress = document.getElementById('present_address');

            // Check if the checkbox is checked
            if (checkbox.checked) {
                // Copy the value from permanent address to present address
                presentAddress.value = permanentAddress.value;
                // Disable the present address field to prevent editing
                presentAddress.setAttribute('readonly', true);
            } else {
                // Enable the present address field for editing
                presentAddress.removeAttribute('readonly');
                // Clear the present address field if needed
                presentAddress.value = '';
            }
        }

        $('#client').change(function () {
            $('#location_name').html("");
            var clientId = $(this).val();

            if (clientId) {
                $.ajax({
                    url: '../../get-locations/' + clientId,
                    type: 'GET',
                   
                    success: function(data) {
                    
                    $.each(data, function(key, location_data) {
                        
                        $('#location_name').append(
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

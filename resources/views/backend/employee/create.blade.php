@extends('layouts.master')
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<style type="text/css">
    .toggle {
        width: 83px !important;
    }
</style>
@section('main-content')
    <div class="breadcrumb">
        <h1>Add Employee</h1>
    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <div class="row mb-12">

            <div class="col-lg-12 mb-3">

                <form action="{{ route('employee.store') }}" method="POST" class="needs-validation">
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
                                                    placeholder="Employee Code" name="employee_code" readonly>
                                            </div>


                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    First Name:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="first_name"
                                                    placeholder="Enter first name" name="first_name" required>
                                            </div>



                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Last Name:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="last_name"
                                                    placeholder="Enter last name" name="last_name" required>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Email address:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" name="email" id="email"
                                                    placeholder="Enter Email" required>
                                            </div>

                                        </div>

                                        <div style="margin-bottom:20px;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Work Information</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Department:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="department_name" id="department_name">
                                                    <option value="">Select</option>
                                                    @foreach ($departments as $department)
                                                        <option value="{{ $department->id }}">{{ $department->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Location:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="location_name" id="location_name">
                                                    <option value="">Select</option>
                                                    @foreach ($locations as $location)
                                                        <option value="{{ $location->id }}">{{ $location->location_name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Deignation:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="designation_name" id="designation_name">
                                                    <option value="">Select</option>
                                                    @foreach ($designations as $designation)
                                                        <option value="{{ $designation->id }}">{{ $designation->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Job Role:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="job_role" id="job_role">
                                                    <option value="">Select</option>

                                                    <option value="Trainee">Trainee</option>
                                                    <option value="Employee">Employee</option>
                                                    <option value="New Venture">New Venture</option>

                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Status:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="status" id="status">
                                                    <option value="">Select</option>

                                                    <option value="0">Active</option>
                                                    <option value="1">Terminated</option>
                                                    <option value="2">Deceased</option>
                                                    <option value="3">Resigned</option>

                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Joining Date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="joining_date"
                                                    placeholder="Enter Joining Date" name="joining_date">
                                            </div>


                                        </div>

                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Personal Details</b></h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Date of Birth:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="dob"
                                                    placeholder="Enter DOB" name="dob">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Gender:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="gender" id="gender">
                                                    <option value="">Select a gender</option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Other">Other</option>

                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Marital Status:</label> <span class="text-danger">*</span>
                                                <select name="marital_status" id="marital_status" class="form-control">
                                                    <option value="">Select a marital status</option>
                                                    <option value="Single">Single</option>
                                                    <option value="Married">Married</option>
                                                    <option value="Widowed">Widowed</option>
                                                    <option value="Separated">Separated</option>
                                                    <option value="Divorced">Divorced</option>
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Blood Group:</label> <span class="text-danger">*</span>
                                                <select class="form-control" name="blood_group" id="blood_group">
                                                    <option value="">Select a blood group</option>
                                                    <option>A+</option>
                                                    <option>A-</option>
                                                    <option>B+</option>
                                                    <option>B-</option>
                                                    <option>AB+</option>
                                                    <option>AB-</option>
                                                    <option>O+</option>
                                                    <option>O-</option>
                                                    <option>Unknown</option>
                                                </select>
                                            </div>


                                        </div>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Identity Information</b>
                                            </h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Aadhaar:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="aadhaar_no"
                                                    placeholder="Enter Aadhaar No" name="aadhaar_no">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    SSS No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="sss_no"
                                                    placeholder="Enter SSS No" name="sss_no">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    PhilHealth No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="philhealth_no"
                                                    placeholder="Enter PhilHealth No" name="philhealth_no">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    HMDF:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="hdmf"
                                                    placeholder="Enter HDMF" name="hdmf">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    Tax Identification No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="tax_identification_no"
                                                    placeholder="Enter Tax Identification No" name="tax_identification_no">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    PAN:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="pan_no"
                                                    placeholder="Enter Pan No" name="pan_no">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    License No.:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="license_no"
                                                    placeholder="Enter License No" name="license_no">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    License expiration date:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="license_expiration_date"
                                                    placeholder="Enter License Expiration Date No" name="license_expiration_date">

                                                <label for="inputEmail1" class="ul-form__label">
                                                    Bank and Account Number:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" id="bank_and_account_no"
                                                    placeholder="Enter Bank And Account No" name="bank_and_account_no">
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
                                                    placeholder="Enter Phone number" required>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Whatsapp Number:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" name="whatsap_no"
                                                    id="whatsap_no" placeholder="Enter Whatsapp number" required>
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Present Address:</label> <span class="text-danger">*</span>
                                                <input type="text" class="form-control" name="present_address"
                                                    id="present_address" placeholder="Address" required><br>
                                                <input type="text" class="form-control" name="present_city"
                                                    id="present_city" placeholder="City" required><br>
                                                <input type="text" class="form-control" name="present_state"
                                                    id="present_state" placeholder="State" required><br>
                                                <input type="text" class="form-control" name="present_country"
                                                    id="present_country" placeholder="Country" required><br>
                                                <input type="text" class="form-control" name="present_pincode"
                                                    id="present_pincode" placeholder="Pincode" required>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Permanent Address:</label> <span class="text-danger"
                                                    style="margin-right:20px;">*</span><input type="checkbox"
                                                    id="address_checkbox">&nbsp;&nbsp;<label class="ul-form__label">Same
                                                    as Present Address</label>
                                                <input type="text" class="form-control" name="permanent_address"
                                                    id="permanent_address" placeholder="Address" required><br>
                                                <input type="text" class="form-control" name="permanent_city"
                                                    id="permanent_city" placeholder="City" required><br>
                                                <input type="text" class="form-control" name="permanent_state"
                                                    id="permanent_state" placeholder="State" required><br>
                                                <input type="text" class="form-control" name="permanent_country"
                                                    id="permanent_country" placeholder="Country" required><br>
                                                <input type="text" class="form-control" name="permanent_pincode"
                                                    id="permanent_pincode" placeholder="Pincode" required>
                                            </div>

                                        </div>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Work Experience</b></h6>
                                        </div>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="font-size:12px;">Previous Company Name</th>
                                                    <th scope="col" style="font-size:12px;">Job Title</th>
                                                    <th scope="col" style="font-size:12px;">From Date</th>
                                                    <th scope="col" style="font-size:12px;">To Date</th>
                                                    <th scope="col" style="font-size:12px;">Job Description</th>
                                                </tr>
                                            </thead>

                                            <tbody id="experience_row">
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" name="company_name[]"
                                                            id="company_name">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="job_title[]"
                                                            id="job_title">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control from_date"
                                                            name="from_date[]" id="from_date">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control to_date"
                                                            name="to_date[]" id="to_date">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="job_description[]" id="job_description">
                                                    </td>
                                                    <td>
                                                        <button type="button"
                                                            class="btn btn-sm btn-default btn-icon m-1 attr"
                                                            id="experience_add">
                                                            <span class="ul-btn__icon"><i class="i-Add"
                                                                    style="font-size: 20px;"></i></span>
                                                        </button>
                                                    </td>
                                                    <input type="hidden" class="form-control" name="work_experience"
                                                        id="work_experience">
                                                </tr>
                                            </tbody>
                                        </table>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Education Details</b></h6>
                                        </div>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="font-size:12px;">Institution Name</th>
                                                    <th scope="col" style="font-size:12px;">Degree/Diploma</th>
                                                    <th scope="col" style="font-size:12px;">Specialization</th>
                                                    <th scope="col" style="font-size:12px;">Date of Completion </th>

                                                </tr>
                                            </thead>

                                            <tbody id="education_row">
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="institution_name[]" id="institution_name">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="degree[]"
                                                            id="degree">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="specialization[]" id="specialization">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control date_of_completion"
                                                            name="date_of_completion[]" id="date_of_completion">
                                                    </td>

                                                    <td>
                                                        <button type="button"
                                                            class="btn btn-sm btn-default btn-icon m-1 attr"
                                                            id="education_add">
                                                            <span class="ul-btn__icon"><i class="i-Add"
                                                                    style="font-size: 20px;"></i></span>
                                                        </button>
                                                    </td>
                                                    <input type="hidden" class="form-control" name="education_details"
                                                        id="education_details">
                                                </tr>
                                            </tbody>
                                        </table>


                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Emergency Contacts</b></h6>
                                        </div>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="font-size:12px;">Name</th>
                                                    <th scope="col" style="font-size:12px;">Relationship</th>
                                                    <th scope="col" style="font-size:12px;">Phone</th>
                                                </tr>
                                            </thead>

                                            <tbody id="emergency_row">
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" name="em_name[]"
                                                            id="em_name">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="relation[]"
                                                            id="relation">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="em_phone[]"
                                                            id="em_phone">
                                                    </td>
                                                    <td>
                                                        <button type="button"
                                                            class="btn btn-sm btn-default btn-icon m-1 attr"
                                                            id="emergency_add">
                                                            <span class="ul-btn__icon"><i class="i-Add"
                                                                    style="font-size: 20px;"></i></span>
                                                        </button>
                                                    </td>
                                                    <input type="hidden" class="form-control" name="emergency"
                                                        id="emergency">
                                                </tr>
                                            </tbody>
                                        </table>





                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Seperation Information</b>
                                            </h6>
                                        </div>
                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Contract Starting Date:</label>
                                                <input type="text" class="form-control" id="contract_start_date"
                                                    placeholder="Enter Contract Starting Date" name="contract_start_date">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Contract Ending Date:</label>
                                                <input type="text" class="form-control" id="contract_end_date"
                                                    placeholder="Enter Contract Ending Date" name="contract_end_date">
                                            </div>

                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Reason for Leaving:</label>
                                                <textarea class="form-control" id="reason_for_leaving" placeholder="Enter Reason for Leaving"
                                                    name="reason_for_leaving"></textarea>
                                            </div>



                                        </div>





                                        <div style="margin-bottom:20px;;margin-top:20px;">
                                            <h6 style="font-size:15px;" class="card-title"><b>Salary Details</b></h6>
                                        </div>

                                        <div class="form-row col-md-12">

                                            <div class="form-group col-md-3">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Annual CTC:</label>
                                                <div class="input-group mb-3">

                                                    <div class="input-group-append">
                                                        <span class="input-group-text" id="basic-addon2">&#x20B9;</span>
                                                    </div>
                                                    <input type="text" class="form-control" name="annual_ctc"
                                                        id="annual_ctc">&nbsp;&nbsp;&nbsp;per year
                                                </div>
                                            </div>



                                        </div>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="font-size:12px;">SALARY COMPONENTS</th>
                                                    <th scope="col-md-3" style="font-size:12px;">CALCULATION TYPE</th>
                                                    <th scope="col" style="font-size:12px;">MONTHLY AMOUNT</th>
                                                    <th scope="col" style="font-size:12px;">ANNUAL AMOUNT</th>
                                                </tr>
                                            </thead>

                                            <tbody id="salary_row">
                                                <tr>
                                                    <td>
                                                        <h6 style="font-size:15px;" class=""><b>Earnings</b></h6>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td>

                                                        <label for="inputEmail1" class="ul-form__label">Basic</label>
                                                    </td>
                                                    <td>
                                                        <div class="input-group mb-3">
                                                            <input type="text" class="form-control"
                                                                name="basic_salary_per" id="basic_salary_per" value=50>
                                                            <div class="input-group-append">
                                                                <span class="input-group-text" id="basic-addon2">&nbsp;%
                                                                    of CTC</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="monthly_basic"
                                                            id="monthly_basic" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="annual_basic"
                                                            id="annual_basic" readonly>
                                                    </td>


                                                </tr>

                                                <tr>

                                                    <td>

                                                        <label for="inputEmail1" class="ul-form__label">House Rent
                                                            Allowance</label>
                                                    </td>
                                                    <td>
                                                        <div class="input-group mb-3">
                                                            <input type="text" class="form-control"
                                                                name="house_rent_per" id="house_rent_per" value=50>
                                                            <div class="input-group-append">
                                                                <span class="input-group-text" id="basic-addon2">&nbsp;%
                                                                    of Basic</span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="monthly_house_rent" id="monthly_house_rent" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="annual_house_rent" id="annual_house_rent" readonly>
                                                    </td>


                                                </tr>

                                                <tr>

                                                    <td>

                                                        <label for="inputEmail1" class="ul-form__label">Conveyance
                                                            Allowance</label>
                                                    </td>
                                                    <td>
                                                        <label for="inputEmail1" class="ul-form__label">Fixed</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="monthly_conveyance" id="monthly_conveyance" value=0>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control"
                                                            name="annual_conveyance" id="annual_conveyance" readonly
                                                            value=0>
                                                    </td>


                                                </tr>

                                                <tr>

                                                    <td>

                                                        <label for="inputEmail1" class="ul-form__label">Fixed
                                                            Allowance</label>
                                                    </td>
                                                    <td>
                                                        <label for="inputEmail1" class="ul-form__label">Fixed</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="monthly_fixed"
                                                            id="monthly_fixed" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="annual_fixed"
                                                            id="annual_fixed" readonly>
                                                    </td>


                                                </tr>

                                                <tr style="background-color: #cfebeb;">

                                                    <td>

                                                        <label for="inputEmail1" class="ul-form__label"><b>Cost to
                                                                Company<b></label>
                                                    </td>
                                                    <td>

                                                    </td>
                                                    <td>
                                                        <label for="inputEmail1" class="ul-form__label"
                                                            id="monthly_cost"></label>
                                                    </td>
                                                    <td>
                                                        <label for="inputEmail1" class="ul-form__label"
                                                            id="annual_cost"></label>
                                                    </td>


                                                </tr>



                                            </tbody>
                                        </table>





                                    </div>




                                    <div class="card-footer">
                                        <div class="mc-footer">
                                            <div class="row text-right">
                                                <div class="col-lg-10"></div>
                                                <div class="col-lg-2 text-left">
                                                    <button type="submit" class="btn btn-primary m-1"
                                                        id="save">Save</button>
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

            </div>

        </div>
    </section>
@endsection
@section('page-js')
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script type="text/javascript">
        $('input[name="dob"]').daterangepicker({

            singleDatePicker: true,
            locale: {
                format: 'DD/MM/YYYY',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });

        $('input[name="joining_date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });

        $('input[name="license_expiration_date"]').daterangepicker({
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

        $("#experience_add").click(function() {
            var html =
                '<tr><td><input type="text" class="form-control" name="company_name[]" id="company_name"></td>' +
                '<td><input type="text" class="form-control" name="job_title[]" id="job_title"></td>' +
                '<td><input type="text" class="form-control from_date" name="from_date[]" id="from_date">' +
                '<td><input type="text" class="form-control to_date" name="to_date[]" id="to_date"></td>' +
                '<td><input type="text" class="form-control" name="job_description[]" id="job_description"></td><td>  <button type="button"  class="btn btn-sm btn-default btn-icon m-1 attr experience_delete">' +
                '<span class="ul-btn__icon"><i class="i-Close-Window" style="font-size: 20px;"></i></span>' +
                '</button></td></tr>';
            $("#experience_row").append(html);

        });

        $("#education_add").click(function() {
            var html =
                '<tr><td><input type="text" class="form-control" name="institution_name[]" id="institution_name"></td>' +
                '<td><input type="text" class="form-control" name="degree[]" id="degree"></td>' +
                '<td><input type="text" class="form-control" name="specialization[]" id="specialization">' +
                '<td><input type="text" class="form-control date_of_completion" name="date_of_completion[]" id="date_of_completion"></td>' +
                '<td>  <button type="button"  class="btn btn-sm btn-default btn-icon m-1 attr education_delete">' +
                '<span class="ul-btn__icon"><i class="i-Close-Window" style="font-size: 20px;"></i></span>' +
                '</button></td></tr>';
            $("#education_row").append(html);

        });

        $("#emergency_add").click(function() {
            var html =
                '<tr><td><input type="text" class="form-control" name="em_name[]" id="em_name"></td>' +
                '<td><input type="text" class="form-control" name="relation[]" id="relation"></td>' +
                '<td><input type="text" class="form-control" name="em_phone[]" id="em_phone">' +
                '<td>  <button type="button"  class="btn btn-sm btn-default btn-icon m-1 attr emergency_delete">' +
                '<span class="ul-btn__icon"><i class="i-Close-Window" style="font-size: 20px;"></i></span>' +
                '</button></td></tr>';
            $("#emergency_row").append(html);

        });

        $(document).ready(function() {

            $('input[name="contract_start_date"]').val('');
            $('input[name="contract_end_date"]').val('');

        })

        $("#save").mouseover(function() {

            yourArray_experience = [];
            yourArray_education = [];
            yourArray_emergency = [];
            var company_names = document.getElementsByName('company_name[]');
            var job_titles = document.getElementsByName('job_title[]');
            var from_dates = document.getElementsByName('from_date[]');
            var to_dates = document.getElementsByName('to_date[]');
            var job_descriptions = document.getElementsByName('job_description[]');
            var institution_names = document.getElementsByName('institution_name[]');
            var degrees = document.getElementsByName('degree[]');
            var specializations = document.getElementsByName('specialization[]');
            var date_of_completions = document.getElementsByName('date_of_completion[]');
            var em_names = document.getElementsByName('em_name[]');
            var relations = document.getElementsByName('relation[]');
            var em_phones = document.getElementsByName('em_phone[]');

            for (var i = 0; i < company_names.length; i++) {
                var company_name = company_names[i];
                var job_title = job_titles[i];
                var from_date = from_dates[i];
                var to_date = to_dates[i];
                var job_description = job_descriptions[i];
                var work_experience = new WorkExperience(company_name.value, job_title.value, from_date.value,
                    to_date.value, job_description.value);
                yourArray_experience.push(work_experience);
                $("#work_experience").val(JSON.stringify(yourArray_experience));
            }

            for (var i = 0; i < institution_names.length; i++) {
                var institution_name = institution_names[i];
                var degree = degrees[i];
                var specialization = specializations[i];
                var date_of_completion = date_of_completions[i];
                var education_details = new EducationDetails(institution_name.value, degree.value, specialization
                    .value, date_of_completion.value);
                yourArray_education.push(education_details);
                $("#education_details").val(JSON.stringify(yourArray_education));
            }

            for (var i = 0; i < em_names.length; i++) {
                var em_name = em_names[i];
                var relation = relations[i];
                var em_phone = em_phones[i];
                var emergency = new Emergency(em_name.value, relation.value, em_phone.value);
                yourArray_emergency.push(emergency);
                $("#emergency").val(JSON.stringify(yourArray_emergency));
            }
        });

        function WorkExperience(company_name, job_title, from_date, to_date, job_description) {
            this.CompanyName = company_name;
            this.JobTitle = job_title;
            this.FromDate = from_date;
            this.ToDate = to_date;
            this.JobDescription = job_description;
        }

        function EducationDetails(institution_name, degree, specialization, date_of_completion) {
            this.InstitutionName = institution_name;
            this.Degree = degree;
            this.Specialization = specialization;
            this.DateofCompletion = date_of_completion;

        }

        function Emergency(em_wname, relation, em_phone) {
            this.Name = em_name;
            this.Relation = relation;
            this.Phone = em_phone;

        }

        $('body').on('click', '.experience_delete', function() {
            $(this).closest("tr").remove();

        });

        $('body').on('click', '.education_delete', function() {
            $(this).closest("tr").remove();

        });

        $('body').on('click', '.emergency_delete', function() {
            $(this).closest("tr").remove();

        });


        $('.from_date').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });

        $('.to_date').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });

        $('.date_of_completion').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'YYYY/MM/DD',
            },
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });

        $("#job_role").change(function() {

            var role = $("#job_role").val();

            $.ajax({

                type: "GET",
                url: "<?php echo url('get_employee_code'); ?>",
                dataType: 'text',
                cache: false,
                data: {
                    role: role
                },
                success: function(res) {

                    $("#employee_code").val(res);
                }
            });
        })

        $("#annual_ctc").keyup(function() {
            calculate_payment();
        });

        $("#monthly_conveyance").keyup(function() {
            $("#annual_conveyance").val(Math.round($("#monthly_conveyance").val() * 12));
            calculate_payment();
        });

        $("#basic_salary_per").keyup(function() {
            calculate_payment();
        });

        $("#house_rent_per").keyup(function() {
            calculate_payment();
        });


        function calculate_payment() {
            var annual_ctc = $("#annual_ctc").val();
            var basic_salary_per = $("#basic_salary_per").val();
            var house_rent_per = $("#house_rent_per").val();
            var annual_basic = Math.round((annual_ctc * basic_salary_per) / 100);
            $("#annual_basic").val(annual_basic);
            var monthly_ctc = annual_ctc / 12;
            var monthly_basic = Math.round((monthly_ctc * basic_salary_per) / 100);
            $("#monthly_basic").val(monthly_basic);

            var annual_house_rent = Math.round((annual_basic * house_rent_per) / 100);
            $("#annual_house_rent").val(annual_house_rent);
            var monthly_house_rent = Math.round((monthly_basic * house_rent_per) / 100);
            $("#monthly_house_rent").val(monthly_house_rent);

            var monthly_conveyance = $("#monthly_conveyance").val();
            var annual_conveyance = $("#annual_conveyance").val();

            var monthly_salary = Math.round(annual_ctc / 12);
            var annual_salary = annual_ctc;

            var monthly_total = parseInt(monthly_basic) + parseInt(monthly_house_rent) + parseInt(monthly_conveyance);
            var monthly_fixed = Math.round(monthly_salary - monthly_total);
            $("#monthly_fixed").val(monthly_fixed);

            var annual_total = parseInt(annual_basic) + parseInt(annual_house_rent) + parseInt(annual_conveyance);
            var annual_fixed = Math.round(annual_salary - annual_total);
            $("#annual_fixed").val(annual_fixed);

            $("#monthly_cost").empty();
            $("#annual_cost").empty();
            $("#monthly_cost").append("<b>&#x20B9; " + monthly_salary + "<b>");
            $("#annual_cost").append("<b>&#x20B9; " + annual_salary + "<b>");

        }
    </script>
@endsection

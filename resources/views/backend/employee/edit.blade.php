@extends('layouts.master')
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<style type="text/css">
	
	.toggle
	{
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
                <form action="{{ route('employee.update',$user->id) }}" method="POST" class="needs-validation">
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
                                                    First Name:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="first_name" placeholder="Enter first name"
                                        name="first_name" required value="{{$user->firtname}}">
                                            </div>

                                            <div class="form-group col-md-6">
                                            <label for="inputEmail1" class="ul-form__label">
                                                    Last Name:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="last_name" placeholder="Enter last name"
                                        name="last_name" required value="{{$user->lastname}}">
                                            </div>
                                            
                                        </div>

                                        <div class="form-row col-md-12">
                                        
                                           

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Email address:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" name="email" id="email"
                                        placeholder="Enter Email" required value="{{$user->email}}">
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
                                                    <option value="{{ $department->id }}" <?php if ($department->id == $user->department) echo "selected"?>>{{ $department->name }}</option>
                                                    @endforeach
                                                    </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Location:</label> <span class="text-danger">*</span>
                                                    <select class="form-control" name="location_name" id="location_name">
                                                    <option value="">Select</option>
                                                    @foreach ($locations as $location)
                                                    <option value="{{ $location->id }}" <?php if ($location->id == $user->location) echo "selected"?>>{{ $location->location_name }}</option>
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
                                                    <option value="{{ $designation->id }}" <?php if ($designation->id == $user->designation) echo "selected"?>>{{ $designation->name }}</option>
                                                    @endforeach
                                                    </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Job Role:</label> <span class="text-danger">*</span>
                                                    <select class="form-control" name="job_role" id="job_role">
                                                    <option value="">Select</option>
                                                    
                                                    <option value="Trainee" <?php if ($user->job_role=="Trainee") echo "selected"?>>Trainee</option>
                                                    <option value="Employee" <?php if ($user->job_role=="Employee") echo "selected"?>>Employee</option>
                                                    <option value="Manager" <?php if ($user->job_role=="Manager") echo "selected"?>>Manager</option>
                                                    <option value="Director" <?php if ($user->job_role=="Director") echo "selected"?>>Director</option>
                                                    
                                                    </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Status:</label> <span class="text-danger">*</span>
                                                    <select class="form-control" name="status" id="status">
                                                    <option value="">Select</option>
                                                    
                                                    <option value="0" <?php if ($user->status==0) echo "selected"?>>Active</option>
                                                    <option value="1" <?php if ($user->status==1) echo "selected"?>>Terminated</option>
                                                    <option value="2" <?php if ($user->status==2) echo "selected"?>>Deceased</option>
                                                    <option value="3" <?php if ($user->status==4) echo "selected"?>>Resigned</option>
                                                    
                                                    </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Joining Date:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="joining_date"
                                        placeholder="Enter Joining Date" name="joining_date" value="{{$user->joining_date}}">
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
                                        placeholder="Enter DOB" name="dob" value="{{$user->dob}}">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Gender:</label> <span class="text-danger">*</span>
                                                    <select class="form-control" name="gender" id="gender">
                                                        <option value="">Select a gender</option>
                                                        <option value="Male" <?php if ($user->gender=="Male") echo "selected"?>>Male</option>
                                                        <option value="Female" <?php if ($user->gender=="Female") echo "selected"?>>Female</option>
                                                        <option value="Other" <?php if ($user->gender=="Other") echo "selected"?>>Other</option>
                                       
                                                    </select>
                                            </div>
                                            
                                        </div>

                                        <div class="form-row col-md-12">
                                        
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Marital Status:</label> <span class="text-danger">*</span>
                                                    <select name="marital_status" id="marital_status" class="form-control">
                                                        <option value="">Select a marital status</option>       
                                                        <option value="Single" @if ($user->marital_status=="Single") selected @endif>Single</option>
                                                        <option value="Married"  @if ($user->marital_status=="Married") selected @endif>Married</option>
                                                        <option value="Widowed"  @if ($user->marital_status=="Widowed") selected @endif>Widowed</option>
                                                        <option value="Separated"  @if ($user->marital_status=="Seperated") selected @endif>Separated</option>
                                                        <option value="Divorced"  @if ($user->marital_status=="Divorced") selected @endif>Divorced</option>
                                                    </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Blood Group:</label> <span class="text-danger">*</span>
                                                    <select class="form-control" name="blood_group" id="blood_group">
                                                        <option value="">Select a blood group</option>
                                                        <option @if ($user->blood_group=="A+") selected @endif>A+</option>
                                                        <option @if ($user->blood_group=="A-") selected @endif>A-</option>
                                                        <option @if ($user->blood_group=="B+") selected @endif>B+</option>
                                                        <option @if ($user->blood_group=="B-") selected @endif>B-</option>
                                                        <option @if ($user->blood_group=="AB+") selected @endif>AB+</option>
                                                        <option @if ($user->blood_group=="AB-+") selected @endif>AB-</option>
                                                        <option @if ($user->blood_group=="O+") selected @endif>O+</option>
                                                        <option @if ($user->blood_group=="O-") selected @endif>O-</option>
                                                        <option @if ($user->blood_group=="Unknown") selected @endif>Unknown</option>
                                                    </select>
                                            </div>

                                            
                                        </div>


                                    <div style="margin-bottom:20px;;margin-top:20px;">
                                    <h6 style="font-size:15px;" class="card-title"><b>Identity Information</b></h6>
                                    </div>
                                        <div class="form-row col-md-12">
                                        
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Aadhaar:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="aadhaar_no"
                                        placeholder="Enter Aadhaar No" name="aadhaar_no" value="{{$user->adhaar_no}}">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    PAN:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="pan_no"
                                        placeholder="Enter Pan No" name="pan_no" value="{{$user->pan_no}}">
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
                                        placeholder="Enter Phone number" required value="{{$user->phone}}">
                                            </div>

                                           
                                            
                                        </div>

                                        <div class="form-row col-md-12">
                                        
                                        <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Present Address:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" name="present_address" id="present_address"
                                        placeholder="Address" required value="{{$user->residential_address}}"><br>
                                                    <input type="text" class="form-control" name="present_city" id="present_city"
                                        placeholder="City" required value="{{$user->residential_city}}"><br>
                                                    <input type="text" class="form-control" name="present_state" id="present_state"
                                        placeholder="State" required value="{{$user->residential_state}}"><br>
                                                    <input type="text" class="form-control" name="present_country" id="present_country"
                                        placeholder="Country" required value="{{$user->residential_country}}"><br>
                                                    <input type="text" class="form-control" name="present_pincode" id="present_pincode"
                                        placeholder="Pincode" required value="{{$user->residential_pincode}}">
                                            </div>

                                            <div class="form-group col-md-6">
                                            <label for="inputEmail1" class="ul-form__label">
                                                    Permanent Address:</label> <span class="text-danger" style="margin-right:20px;">*</span><input type="checkbox" id="address_checkbox">&nbsp;&nbsp;<label class="ul-form__label">Same as Present Address</label>
                                                    <input type="text" class="form-control" name="permanent_address" id="permanent_address"
                                        placeholder="Address" required value="{{$user->permanent_address}}"><br>
                                                    <input type="text" class="form-control" name="permanent_city" id="permanent_city"
                                        placeholder="City" required value="{{$user->permanent_city}}"><br>
                                                    <input type="text" class="form-control" name="permanent_state" id="permanent_state"
                                        placeholder="State" required value="{{$user->permanent_state}}"><br>
                                                    <input type="text" class="form-control" name="permanent_country" id="permanent_country"
                                        placeholder="Country" required value="{{$user->permanent_country}}"><br>
                                                    <input type="text" class="form-control" name="permanent_pincode" id="permanent_pincode"
                                        placeholder="Pincode" required value="{{$user->permanent_pincode}}">
                                            </div>
                                            
                                        </div>


                                    <div style="margin-bottom:20px;;margin-top:20px;">
                                    <h6 style="font-size:15px;" class="card-title"><b>Seperation Information</b></h6>
                                    </div>
                                        <div class="form-row col-md-12">
                                        
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Contract Starting Date:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="contract_start_date"
                                        placeholder="Enter Contract Starting Date" name="contract_start_date" value="{{$user->contract_start_date}}">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                Contract Ending Date:</label> <span class="text-danger">*</span>
                                                    <input type="text" class="form-control" id="contract_end_date"
                                        placeholder="Enter Contract Ending Date" name="contract_end_date" value="{{$user->contract_end_date}}">
                                            </div>
                                            
                                        </div>

                                        <div class="form-row col-md-12">
                                        
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail1" class="ul-form__label">
                                                    Reason for Leaving:</label> <span class="text-danger">*</span>
                                                    <textarea class="form-control" id="reason_for_leaving"
                                        placeholder="Enter Reason for Leaving" name="reason_for_leaving" value="{{$user->reason_for_leaving}}"></textarea>
                                            </div>

                                            
                                            
                                        </div>

                                        
                                    </div>

                                <div class="card-footer">
                                    <div class="mc-footer">
                                        <div class="row text-right">
                                            <div class="col-lg-10"></div>
                                            <div class="col-lg-2 text-left">
                                            <button type="submit"  class="btn btn-primary m-1">Save</button>
                                            <button type="button" class="btn btn-outline-secondary m-1">Cancel</button>
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
        maxYear: parseInt(moment().format('YYYY'),10)
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
      

      $('input[name="joining_date"]').daterangepicker({
        singleDatePicker: true,
         locale: {
          format: 'YYYY/MM/DD',
        },
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'),10)
      }); 
      

      $('input[name="contract_start_date"]').daterangepicker({
        singleDatePicker: true,
         locale: {
          format: 'YYYY/MM/DD',
        },
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'),10)
      });
      

      $('input[name="contract_end_date"]').daterangepicker({
        singleDatePicker: true,
         locale: {
          format: 'YYYY/MM/DD',
        },
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'),10)
      }); 
      

      $('#address_checkbox').change(function() {
        if($(this).is(":checked")) {
            $("#permanent_address").val($("#present_address").val());   
            $("#permanent_city").val($("#present_city").val());     
            $("#permanent_state").val($("#present_state").val());     
            $("#permanent_country").val($("#present_country").val());     
            $("#permanent_pincode").val($("#present_pincode").val());        
        }  
        
        else
        {
            $("#permanent_address").val('');
            $("#permanent_city").val('');
            $("#permanent_state").val('');
            $("#permanent_country").val('');
            $("#permanent_pincode").val('');
        }
    });
    
    $(document).ready(function(){

        $('input[name="contract_start_date"]').val('');
        $('input[name="contract_end_date"]').val('');

    })
   
    

</script>
@endsection

@extends('layouts.master')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

@section('main-content')
    <div>
        <h1 class="text-center mb-4">Employee Details</h1>
        <div class="table-responsive">
            <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-sm-6 ">

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Basic Information</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Employee Code : {{ $employee->employee_code }}</li>
                                <li class="list-group-item">First Name : {{ $employee->firstname }}</li>
                                <li class="list-group-item">Last Name : {{ $employee->lastname }}</li>
                                <li class="list-group-item">Email : {{ $employee->email }}</li>
                                <li class="list-group-item">Salary : {{ $userdetails->basic_salary }}</li>
                            </ul>
                        </div>

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Work Information</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Department : {{ $departments->name }}</li>
                                <li class="list-group-item">Location : {{ $userdetails->location }}</li>
                                <li class="list-group-item">Designation : {{ $userdetails->designation }} </li>
                                <li class="list-group-item">Job Role : {{ $employee->job_role }}</li>
                                <li class="list-group-item">Status : {{ $employee->status == 1 ? 'Active' : 'Not Active' }}</li>
                                <li class="list-group-item">Joining Date : {{ $userdetails->joining_date }}</li>
                            </ul>
                        </div>

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Personal Details</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Date Of Birth : {{ $employee->dob }}</li>
                                <li class="list-group-item">Gender : {{ $employee->gender }}</li>
                                <li class="list-group-item">Marital Status : {{ $userdetails->marital_status }} </li>
                                <li class="list-group-item">Blood Group : {{ $userdetails->blood_group }}</li>
                            </ul>
                        </div>

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Identity Information</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Aadhar : {{ $userdetails->adhaar_no }}</li>
                                <li class="list-group-item">Pan : {{ $userdetails->pan_no }} </li>
                            </ul>
                        </div>
                        {{--  --}}

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Contact Details</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Mobile Number : {{ $employee->phone }} </li>
                                <li class="list-group-item">Whatsapp Number : {{ $userdetails->whatsapp_no }} </li>
                                <li class="list-group-item">Permanent Address : {{ $useraddresses->permanent_address }}
                                    <br>
                                        City : {{ $useraddresses->permanent_city }} <br>
                                        State : {{ $useraddresses->permanent_state }} <br>
                                        Country : {{ $useraddresses->permanent_country }} <br>
                                        Pincode : {{ $useraddresses->permanent_pincode }} </li>
                            </ul>
                        </div>

                        {{--  --}}

                        {{-- <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Work Experiance</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Previous Company Name : {{ $userdetails->previous_company_name }}</li>
                                <li class="list-group-item">Job Title : {{ $userdetails->job_title }}</li>
                                <li class="list-group-item">From Date : {{ $userdetails->from_date }}</li>
                                <li class="list-group-item">To Date : {{ $userdetails->to_date }}</li>
                            </ul>
                        </div>



                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Education Details</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Institution Name : {{ $userdetails->institution_name }}</li>
                <li class="list-group-item">Degree/Diploma : {{ $userdetails->degree_diploma }}</li>
                <li class="list-group-item">Specialization : {{ $userdetails->specialization }}</li>
                <li class="list-group-item">Date of Completion : {{ $userdetails->date_of_completion }}</li>
                            </ul>
                        </div>



                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Emergency Contacts</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Name : </li>
                                <li class="list-group-item">Relationship : </li>
                                <li class="list-group-item">Phone : {{ $userdetails->emergency_no }}</li>
                            </ul>
                        </div>


                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Seperation Information</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Contract Starting Date : {{ $userdetails->contract_starting_date }}</li>
                <li class="list-group-item">Contract Ending Date : {{ $userdetails->contract_ending_date }}</li>
                <li class="list-group-item">Reason For Leaving : {{ $userdetails->reason_for_leaviing }}</li>
                            </ul>
                        </div> --}}

                    </div>
                    <div class="col-lg-3"></div>


                </div>
            </div>
        </div>
    </div>
@endsection


@section('script-content')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
@endsection

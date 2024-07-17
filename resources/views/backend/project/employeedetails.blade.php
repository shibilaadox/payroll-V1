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
                                <li class="list-group-item">Salary : </li>
                                <li class="list-group-item">Password : {{ $employee->password }}</li>
                            </ul>
                        </div>

                        <div class="card mt-5 text-center p-2"
                            style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Work Information</h3>
                        </div>

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Department :</li>
                                <li class="list-group-item">Location :</li>
                                <li class="list-group-item">Designation : {{ $employee->user_type }} </li>
                                <li class="list-group-item">Job Role : {{ $employee->job_role }}</li>
                                <li class="list-group-item">Status : {{ $employee->status }}</li>
                                <li class="list-group-item">Joining Date :</li>
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
                                <li class="list-group-item">Marital Status : </li>
                                <li class="list-group-item">Blood Group : </li>
                            </ul>
                        </div>

                        <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                            <h3>Identity Information</h3>
                    </div>

                    <div class="card mt-5" style="width: 100%; font-size:16px">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Aadhar : </li>
                            <li class="list-group-item">Pan : </li>
                        </ul>
                    </div>
                    {{--  --}}

                    <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                        <h3>Contact Details</h3>
                </div>

                <div class="card mt-5" style="width: 100%; font-size:16px">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Mobile Number : {{ $employee->phone }} </li>
                        <li class="list-group-item">Whatsapp Number : </li>
                        <li class="list-group-item">Present Address : </li>
                        <li class="list-group-item">Permanent Address : </li>

                    </ul>
                </div>

                {{--  --}}

                <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                    <h3>Work Experiance</h3>
            </div>

            <div class="card mt-5" style="width: 100%; font-size:16px">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Previous Company Name : </li>
                    <li class="list-group-item">Job Title : </li>
                    <li class="list-group-item">From Date : </li>
                    <li class="list-group-item">To Date : </li>
                    <li class="list-group-item">Job Description : </li>
                </ul>
            </div>

            {{--  --}}

            <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                <h3>Education Details</h3>
        </div>

        <div class="card mt-5" style="width: 100%; font-size:16px">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Institution Name : </li>
                <li class="list-group-item">Degree/Diploma : </li>
                <li class="list-group-item">Specialization : </li>
                <li class="list-group-item">Date of Completion : </li>
            </ul>
        </div>

        {{--  --}}

        <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
            <h3>Emergency Contacts</h3>
    </div>

    <div class="card mt-5" style="width: 100%; font-size:16px">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Name : </li>
            <li class="list-group-item">Relationship : </li>
            <li class="list-group-item">Phone : </li>
        </ul>
    </div>

            {{--  --}}

            <div class="card mt-5 text-center p-2" style="width: 100%; font-size:16px; background-color:rgb(233, 227, 227);">
                <h3>Seperation Information</h3>
        </div>

        <div class="card mt-5" style="width: 100%; font-size:16px">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Contract Starting Date : </li>
                <li class="list-group-item">Contract Ending Date : </li>
                <li class="list-group-item">Reason For Leaving : </li>
            </ul>
        </div>

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

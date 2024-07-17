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

                        <div class="card mt-5" style="width: 100%; font-size:16px">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Employee Name : {{ $employee->firstname }}</li>
                                <li class="list-group-item">Email : {{ $employee->email }}</li>
                                <li class="list-group-item">Password : {{ $employee->password }}</li>
                                <li class="list-group-item">Phone : {{ $employee->phone }}</li>
                                <li class="list-group-item">Gender : {{ $employee->gender }}</li>
                                <li class="list-group-item">DOB : {{ $employee->dob }}</li>
                                <li class="list-group-item">Employee Code : {{ $employee->employee_code }}</li>
                                <li class="list-group-item">Designation : {{ $employee->job_role }}</li>
                                <li class="list-group-item">Status : {{$employee->status}}</li>



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

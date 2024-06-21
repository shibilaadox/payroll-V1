@extends('layouts.master')
@section('page-css')

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
@endsection

@section('main-content')
    <div class="breadcrumb">
        <?php if ( Route::getCurrentRoute()->uri =='absent_employees' ){?>
        <h1>Absent Employees</h1>
        <?php } else if ( Route::getCurrentRoute()->uri =='present_employees' ){?>
        <h1>Present Employees</h1>
        <?php } else if ( Route::getCurrentRoute()->uri =='employees' ){?>
        <h1>All Employees</h1>
        <?php } ?>
        

    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <!-- end of row -->

        <div class="row mb-4">
            <div class="col-md-12 mb-3">
                <div class="card text-left">
                    <div class="card-body">
                        
                        <div class="table-responsive">
                            <table class="table table-striped" id="user_table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Department</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    {{-- <tr>
                                        <th scope="row">1</th>
                                        <td>Admin</td>
                                    </tr> --}}
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($users as $row)
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->firstname." ".$row->last_name }}</td>
                                            <td>{{ $row->email }}</td>
                                            <td>{{ $row->phone }}</td>
                                            <td>{{ $row->userdetails->departments->name}}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>


                    </div>
                </div>
            </div>
            <!-- end of col-->

        </div>
        <!-- end of row -->
    </section>

@endsection

@section('page-js')
<script>
   
        $('#user_table').DataTable();
        
</script>

@endsection

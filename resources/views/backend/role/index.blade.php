@extends('layouts.master')
@section('page-css')

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
@endsection

@section('main-content')
    <div class="breadcrumb">
        <h1>All Roles</h1>

    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <!-- end of row -->

        <div class="row mb-4">


            <div class="col-md-12 mb-3">
                <div class="card text-left">

                    <div class="card-body">
                        <h4 class="card-title mb-3" style="text-align: end;"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('roles.create') }}">
                                    New Role</a></button></h4>

                        <div class="table-responsive">
                            <table class="table table-striped" id="role_datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Name</th>

                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($roles as $role)

                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $role->name }}</td>

                                            <td>
                                                <a href="{{ route('roles.edit', $role->id) }}" class="text-success mr-2">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                                </a>
                                                <a onclick="remove({{ $role->id }},'roles')" class="text-danger mr-2">
                                                    <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                                </a>
                                            </td>
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

    <script type="text/javascript">
         function editRole(event) {
            var id = $(event).data("id");
            let _url = `roles/${id}`;
            $('#roleError').text('');


            $.ajax({
                url: _url,
                type: "GET",
                success: function(response) {
                    if (response) {
                        $("#role_id").val(response.id);
                        $("#role").val(response.role);
                        $('#role-modal').modal('show');
                    }
                }
            });
        }

        //Datatable
        $('#role_datatable').DataTable();
    </script>

@endsection

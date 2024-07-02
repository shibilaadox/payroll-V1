@extends('layouts.master')


@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Users
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_user()">
                            New User</button></div>
                </h4>
                <br>
                
                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="user_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="user_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="user_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Name</th>
                                            <th class="sorting" tabindex="0" aria-controls="user_datatable" rowspan="1"
                                                colspan="1" aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Email</th>
                                            <th class="sorting" tabindex="0" aria-controls="user_datatable" rowspan="1"
                                                colspan="1" aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Role</th>
                                            <th class="sorting" tabindex="0" aria-controls="user_datatable" rowspan="1"
                                                colspan="1" aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Actions</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i=1;foreach ($user as $key => $row){?>
                                        <tr>
                                            <td>{{ $i }}</td>
                                            <td>{{ $row->name }}</td>
                                            <td>{{ $row->email }}</td>
                                            <td>
                                                @if (!empty($row->getRoleNames()))
                                                    @foreach ($row->getRoleNames() as $v)
                                                        <label
                                                            class="badge badge-secondary text-white">{{ $v }}</label>
                                                    @endforeach
                                                @endif
                                            </td>
                                            <td>
                                                <a class="text-success mr-2" onclick="edit_user('{{ $row->id }}')"
                                                    title="Edit user">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                                </a>

                                                <a class="text-danger mr-2" onclick="delete_user('{{ $row->id }}')"
                                                    title="Delete user">
                                                    <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php $i++;} ?>
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
    <div class="modal fade" id="user-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="user_form" name="user_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Name:</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    placeholder="Enter name" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Email:</label>
                                <input type="text" class="form-control" id="email" name="email"
                                    placeholder="Enter email" required>
                                <input type="hidden" name="user_id" id="user_id" value="">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Password:</label>
                                <input type="text" class="form-control" id="password" name="password"
                                    placeholder="Enter password">

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Role:</label>
                                <select class="form-control" name="roles" id="roles">
                                    @foreach ($roles as $role)
                                        <option value="{{ $role }}">{{ $role }}</option>
                                    @endforeach
                                </select>

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

@section('page-js')
    <script type="text/javascript">
        //open model
        function add_user() {
            $('#user-modal').modal('show');
        }

        //Submit add model
        $("#user_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('users.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);


                    $('#user-modal').modal('hide');

                    location.reload();



                },
                error: function(response) {

                }

            });

        });


        //Edit Function

        function edit_user(id) {

            $.get("{{ route('users.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-User");
                $("#user-modal").modal('show');
                $("#user_id").val(data.id);
                $("#name").val(data.name);
                $("#email").val(data.email);
                $("#roles").val(data.user_type).change();
            });
        }

        function delete_user(id) {


            event.preventDefault();
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "<?php echo url('update_status'); ?>",
                type: "GET",
                data: {
                    id: id
                },
                cache: false,

                success: function(response) {


                    location.reload();


                },
                error: function(response) {

                }

            });

        }

        $('document').ready(function() {

            // csrf token
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            //Datatable
            $('#user_datatable').DataTable();

        });
    </script>
@endsection

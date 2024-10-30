@extends('layouts.master')
<meta name="csrf-token" content="{{ csrf_token() }}">

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Rates

                    <a class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#modal_excel_deduction"
                        style="float:right;margin-right: 1%;margin-bottom: 2%"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Upload Rate</button></a>

                    <a class="btn btn-bold btn-label-brand btn-sm" style="float:right;margin-right: 1%;margin-bottom: 2%"
                        href="<?php echo url('') . '/assets/format/rate_template.xlsx'; ?>" target="_blank"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Download
                            template</button></a>

                    <div style="float: right; margin-right: 1.5%;margin-bottom: 2%">
                        <button type="button" class="btn btn-primary ripple m-1" onclick="add_rate()">
                            New Rate</button>
                    </div>
                </h4>
                <p class="fs-16">All Your Rates</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="deduction_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Client Code</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Branch</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Position</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Day8 Rate</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Day12 Rate</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">COLA </th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">ND Rate</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $i=1;
                                    foreach ($data['rate'] as $row): ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->client_code }}</td>
                                            <td>{{ $row->branch }}</td>
                                            <td>{{ $row->position }}</td>
                                            <td>{{ $row->rate8 }}</td>
                                            <td>{{ $row->rate12 }}</td>
                                            <td>{{ $row->cola }}</td>
                                            <td>{{ $row->nd }}</td>
                                            <td class="d-flex justify-content-between align-items-center">
                                                <a class="text-success" onclick="edit_rate('{{ $row->id }}')">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                                </a>
                                                <a class="text-danger" onclick="delete_rate('{{ $row->id }}')"
                                                    title="Delete Rate">
                                                    <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php endforeach ?>
                                    </tbody>

                                </table>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="modal_excel_deduction" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">

                <form action="{{ route('import_rate.excel') }}" method="POST" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"> Upload File </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">

                        <div class="form-group">


                            <input type="file" name='file' id="file">


                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="submit_excel" name="upload">Submit</button>
                    </div>

                </form>

            </div>
        </div>
    </div>

    <!-- Edit Rate Modal -->
    <div class="modal fade" id="edit_rate_modal" tabindex="-1" role="dialog" aria-labelledby="editRateLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <form id="edit_rate_form" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h5 class="modal-title" id="editRateLabel">Edit Rate</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="rate_id" name="id">
                        <div class="form-group">
                            <label for="client_code">Client Code</label>
                            <input type="text" class="form-control" id="client_code" name="client_code" required>
                        </div>
                        <div class="form-group">
                            <label for="branch">Branch</label>
                            <input type="text" class="form-control" id="branch" name="branch" required>
                        </div>
                        <div class="form-group">
                            <label for="position">Position</label>
                            <input type="text" class="form-control" id="position" name="position" required>
                        </div>
                        <div class="form-group">
                            <label for="rate8">Day8 Rate</label>
                            <input type="text" class="form-control" id="rate8" name="rate8" required>
                        </div>
                        <div class="form-group">
                            <label for="rate12">Day12 Rate</label>
                            <input type="text" class="form-control" id="rate12" name="rate12" required>
                        </div>
                        <div class="form-group">
                            <label for="cola">COLA</label>
                            <input type="text" class="form-control" id="cola" name="cola" required>
                        </div>
                        <div class="form-group">
                            <label for="nd">ND Rate</label>
                            <input type="text" class="form-control" id="nd" name="nd" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add Rate Modal -->
    <div class="modal fade" id="add_rate_modal" tabindex="-1" role="dialog" aria-labelledby="addRateLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <form id="add_rate_form" method="POST" action="{{ route('rate.store') }}">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="addRateLabel">Add New Rate</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="new_client_code">Client Code</label>
                            <input type="text" class="form-control" id="new_client_code" name="client_code" required>
                        </div>
                        <div class="form-group">
                            <label for="new_branch">Branch</label>
                            <input type="text" class="form-control" id="new_branch" name="branch" required>
                        </div>
                        <div class="form-group">
                            <label for="new_position">Position</label>
                            <input type="text" class="form-control" id="new_position" name="position" required>
                        </div>
                        <div class="form-group">
                            <label for="new_rate8">Day8 Rate</label>
                            <input type="text" class="form-control" id="new_rate8" name="rate8" required>
                        </div>
                        <div class="form-group">
                            <label for="new_rate12">Day12 Rate</label>
                            <input type="text" class="form-control" id="new_rate12" name="rate12" required>
                        </div>
                        <div class="form-group">
                            <label for="new_cola">COLA</label>
                            <input type="text" class="form-control" id="new_cola" name="cola" required>
                        </div>
                        <div class="form-group">
                            <label for="new_nd">ND Rate</label>
                            <input type="text" class="form-control" id="new_nd" name="nd" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="add_rate_button">Add Rate</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('page-js')
    <script type="text/javascript">
        //open model
        function add_rate() {
            $('#add_rate_modal').modal('show');
        }

        // edit rate
        function edit_rate(id) {
            $.get("{{ url('rates') }}/" + id + "/edit", function(data) {
                // if (data.code && data.code === 404) {
                //     alert(data.status);
                //     return;
                // }
                $('#rate_id').val(data.id);
                $('#client_code').val(data.client_code);
                $('#branch').val(data.branch);
                $('#position').val(data.position);
                $('#rate8').val(data.rate8);
                $('#rate12').val(data.rate12);
                $('#cola').val(data.cola);
                $('#nd').val(data.nd);
                $('#edit_rate_modal').modal('show');
            });
        }

        // submit edit
        $("#edit_rate_form").on("submit", function(e) {
            e.preventDefault();
            var formData = $(this).serialize();
            var id = $('#rate_id').val();

            $.ajax({
                url: "{{ url('rates') }}/" + id,
                type: "POST",
                data: formData,
                success: function(response) {
                    if (response.code == 200) {
                        $('#edit_rate_modal').modal('hide');
                        location.reload();
                    } else {
                        alert('Error updating rate');
                    }
                }
            });
        });

        // AJAX form submission for adding a new rate
        $("#add_rate_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('rate.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.code == 200) {
                        $('#add_rate_modal').modal('hide');
                        window.location.reload();
                    } else {
                        alert("Error: Could not add rate.");
                    }
                },
                error: function(response) {}
            });
        });

        // Delete rate
        function delete_rate(id) {
            if (confirm('Are you sure you want to delete this rate?')) {
                $.ajax({
                    url: "{{ url('rates') }}/" + id,
                    type: 'DELETE',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content') // Include CSRF token
                    },
                    success: function(response) {
                        // Handle success
                        alert(response.message);
                        location.reload(); // Reload the page to see changes
                    },
                    error: function(xhr) {
                        // Handle error
                        alert('Error occurred while deleting the rate.');
                    }
                });
            }
        }


        //open model
        function add_deduction() {
            $('#deduction-modal').modal('show');
        }

        //Submit add model
        $("#deduction_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('deductions.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    window.location.reload();
                    if (response.code == 200) {

                        $('#deduction-modal').modal('hide');
                        swal_success();



                    }
                },
                error: function(response) {

                }

            });

        });


        //Edit Function

        function edit_deduction(id) {

            $.get("{{ route('deductions.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-Category");
                $("#deduction-modal").modal('show');
                $("#deduction_id").val(data.id);
                $("#user").val(data.user_id);
                $("#code").val(data.ded_code);
                $("#number").val(data.ded_no);
                $("#amount").val(data.ded_amount);
            });
        }

        //Delete Category
        function delete_deduction(id) {
            var url = 'deductions';
            remove(id, url);
        }

        $('document').ready(function() {

            // csrf token
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            //Datatable
            $('#deduction_datatable').DataTable();
        });
    </script>
@endsection

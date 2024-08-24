@extends('layouts.master')


@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Deductions
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_deduction()">
                            New Deduction</button></div>
                            <a class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#modal_excel_deduction"
                        style="float:right;margin-right: 1%;margin-bottom: 2%"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Upload Deduction</button></a>
                            <a class="btn btn-bold btn-label-brand btn-sm" 
                        style="float:right;margin-right: 1%;margin-bottom: 2%" href="<?php echo url('').'/assets/format/deduction_template.xlsx'?>" target="_blank"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Download template</button></a>	
                        </h4>
                <p class="fs-16">All Your Deductions</p>

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
                                                style="width: 181.002px;">User</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Code</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Number</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Amount</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Month</th>
                                            <th class="sorting" tabindex="0" aria-controls="deduction_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Actions</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                    <?php $i=1;
                                    foreach ($data['deduction'] as $row){ ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->user->name }}</td>
                                            <td>{{ $row->ded_code }}</td>
                                            <td>{{ $row->ded_no }}</td>
                                            <td>{{ $row->ded_amount }}</td>
                                            <td>{{ $row->month }}</td>
                                            <td><button class="btn btn-success" onclick="edit_deduction('{{$row->id}}')" type="button"><i class="nav-icon i-Pen-2 font-weight-bold"></i></button>
                                            <button class="btn btn-danger ml-3" onclick="delete_deduction('{{$row->id}}')" type="button"><i class="nav-icon i-Close-Window font-weight-bold"></i></button>
                                            </td>
                                        </tr>
                                    <?php } ?>
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
    <div class="modal fade" id="deduction-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="deduction_form" name="deduction_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Deduction</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">User:</label>
                                <select class="form-control" name="user" id="user">
                                                    <option value="">Select</option>
                                                    @foreach ($data['users'] as $row)
                                                    <option value="{{ $row->id }}">{{ $row->firstname }}</option>
                                                    @endforeach
                                                    </select>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Code:</label>
                                <input type="text" class="form-control" id="code" name="code" placeholder="Enter code" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Number:</label>
                                <input type="text" class="form-control" id="number" name="number" placeholder="Enter number" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Amount:</label>
                                <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter amount" required>
                                <input type="hidden" name="deduction_id" id="deduction_id" value="">
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
    <div class="modal fade" id="modal_excel_deduction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">

                <form action="{{ route('import_deduction.excel') }}" method="POST" enctype="multipart/form-data">
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

@endsection

@section('page-js')
    <script type="text/javascript">

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

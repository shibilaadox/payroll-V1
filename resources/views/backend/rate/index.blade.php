@extends('layouts.master')


@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Rates
                    
                            <a class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#modal_excel_deduction"
                        style="float:right;margin-right: 1%;margin-bottom: 2%"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Upload Rate</button></a>
                            <a class="btn btn-bold btn-label-brand btn-sm" 
                        style="float:right;margin-right: 1%;margin-bottom: 2%" href="<?php echo url('').'/assets/format/rate_format.xlsx'?>" target="_blank"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Format</button></a>		
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
                                            

                                        </tr>
                                    </thead>
                                    <tbody>

                                    <?php $i=1;
                                    foreach ($data['rate'] as $row){ ?>
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->client_code }}</td>
                                            <td>{{ $row->branch }}</td>
                                            <td>{{ $row->position }}</td>
                                            <td>{{ $row->rate8 }}</td>
                                            <td>{{ $row->rate12}}</td>
                                            <td>{{ $row->cola}}</td>
                                            <td>{{ $row->nd}}</td>
                                            
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

    
    <div class="modal fade" id="modal_excel_deduction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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

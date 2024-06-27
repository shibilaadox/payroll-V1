

@extends('layouts.master')
 

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
            <a class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#modal_excel"
                        style="float:right;margin-right: 1%;margin-bottom: 2%"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Upload Timesheet</button></a>
                            <a class="btn btn-bold btn-label-brand btn-sm" data-toggle="modal" data-target="#modal_excel_hourly"
                        style="float:right;margin-right: 1%;margin-bottom: 2%"> <button
                            class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air">Upload Hourly Timesheet</button></a>

                <h4 class="mb-3 fs-22 font-weight-bold">User's Work Timesheet
                    
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
                                                style="width: 181.002px;">Employee</th>
                                            <th class="sorting" tabindex="0" aria-controls="user_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">No:of Days Worked</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $i=1;foreach ($data as $key => $row){?>
  <tr>
  <td>{{ $i}}</td>
    <td>{{ $row->name }}</td>
    <td>{{ $row->days_worked }}</td>
    
    
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

    <div class="modal fade" id="modal_excel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">

                <form action="{{ route('import.excel') }}" method="POST" enctype="multipart/form-data">
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

    <div class="modal fade" id="modal_excel_hourly" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">

                <form action="{{ route('import_hourly.excel') }}" method="POST" enctype="multipart/form-data">
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




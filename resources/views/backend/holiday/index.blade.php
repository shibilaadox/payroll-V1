@extends('layouts.master')
 

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Holidays
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_holiday()">
                            New Holiday</button></div>
                </h4>
                <p class="fs-16">All Your Holidays</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="holiday_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="holiday_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="holiday_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Name</th>
                                            <th class="sorting" tabindex="0" aria-controls="holiday_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Date</th>
                                            <th class="sorting" tabindex="0" aria-controls="holiday_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Description</th>
                                            <th class="sorting" tabindex="0" aria-controls="holiday_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Actions</th>

                                        </tr>
                                    </thead>
                                    <tbody>

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
    <div class="modal fade" id="holiday-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="holiday_form" name="holiday_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Holiday</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter name" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Date:</label>
                                <input type="text" class="form-control" id="date" name="date" placeholder="Enter name" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Description:</label>
                                <textarea class="form-control" aria-label="With textarea" id="description" name="description" required></textarea>
                                <input type="hidden" name="holiday_id" id="holiday_id" value="">
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
        function add_holiday() {
            $('#holiday-modal').modal('show');
        }

        //Submit add model
        $("#holiday_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('holidays.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);
                    if (response.code == 200) {

                        $('#holiday-modal').modal('hide');
                        swal_success();


                    }
                },
                error: function(response) {
                    
                }

            });

        });

        
        //Edit Function

        function edit_holiday(id) {
            
            $.get("{{ route('holidays.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-Category");
                $("#holiday-modal").modal('show');
                $("#holiday_id").val(data.id);
                $("#name").val(data.name);
                $("#date").val(data.date);
                $("#description").val(data.description);
            });
        }

        //Delete Category
        function delete_holiday(id) {
            var url = 'holidays';
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
            $('#holiday_datatable').DataTable({
                processing: true,
                serverSide: true,
                type: "POST",
                ajax: "{{ route('holidays.index') }}",
                columns: [

                    {
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'date',
                        name: 'date'
                    },
                    {
                        data: 'description',
                        name: 'description'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    },
                ]
            });


        });


     $('input[name="date"]').daterangepicker({
       
        locale: {
         format: 'YYYY/MM/DD',
       },
       showDropdowns: true,
       minYear: 1901,
       maxYear: parseInt(moment().format('YYYY'),10)
     }); 

    </script>
@endsection


    
    
      

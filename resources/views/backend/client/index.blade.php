@extends('layouts.master')


@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Clients
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_client()">
                            New Client</button></div>
                </h4>
                <p class="fs-16">All Your Clients</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="client_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Name</th>
                                            <th class="sorting" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Email</th>
                                            <th class="sorting" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Phone</th>
                                            <th class="sorting" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Address</th>
                                            <th class="sorting" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Locations</th>
                                            <th class="sorting" tabindex="0" aria-controls="client_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">Actions</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $i = 1;
                                    foreach ($client as $key => $row) { ?>
                                    <tr>
                                    <td>{{$i}}</td>
                                    <td>{{$row->name;}}</td>
                                    <td>{{$row->email;}}</td>
                                    <td>{{$row->phone;}}</td>
                                    <td>{{$row->address;}}</td>
                                    <td><?php $location_id = explode(',', $row->locations);
                                              $lastElement = end($location_id);
                                              foreach ($location_id as $row3) {
                                                foreach ($locations as $row1) {

                                                    if ($row1->id == $row3) 
                                                    {   
                                                        if($row3 == $lastElement) 
                                                        echo $row1->location_name;
                                                        else
                                                        echo $row1->location_name . " , ";
                                                    }
                                                }
                                              }
                                    ?>
                                    <td><button class="btn btn-sm btn-success" onclick="edit_client('{{$row->id}}')" type="button"><i class="nav-icon i-Pen-2 font-weight-bold"></i></button>
                                    <button class="btn btn-danger btn-sm ml-3" onclick="delete_client('{{$row->id}}')" type="button"><i class="nav-icon i-Close-Window font-weight-bold"></i></button>
                                    <!--<a href="{{route('client.details', $row->id)}}" class="btn btn-primary btn-sm ml-3" style="float: right;
    position: absolute;" type="button"><i class="nav-icon i-File-Clipboard-Text--Image" title="Details"></i></a>-->
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
    <div class="modal fade" id="client-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="client_form" name="client_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Client</h5>
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
                                <label for="actual_name" class="ul-form__label">Email:</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Enter email" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Phone:</label>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Address:</label>
                                <textarea class="form-control" aria-label="With textarea" id="address" name="address" required></textarea>
                                <input type="hidden" name="client_id" id="client_id" value="">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Locations:</label>
                                <select class="form-control m-select2 select_class" id="location" name="location[]" required  multiple="multiple">
                                    <option value="">Please select</option>
                                    <?php foreach($locations as $row){ ?>
                                    <option value="{{$row->id}}">{{$row->location_name}}</option>
                                    <?php } ?>
                                    
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
        function add_client() {
            $('#client-modal').modal('show');
        }

        //Submit add model
        $("#client_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('clients.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);
                    if (response.code == 200) {

                        $('#client-modal').modal('hide');
                        //swal_success();
                        window.location.reload();


                    }
                },
                error: function(response) {

                }

            });

        });


        //Edit Function

        function edit_client(id) {

            $.get("{{ route('clients.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-Category");
                $("#client-modal").modal('show');
                $("#client_id").val(data.id);
                $("#name").val(data.name);
                $("#email").val(data.email);
                $("#phone").val(data.phone);
                $("#address").val(data.address);
                var res = data.locations.split(",");
                res.forEach(element =>{
     
                    $('#location option[value='+element+']').attr('selected','selected').change();
        
                });
            });
        }

        //Delete Category
        function delete_client(id) {
            var url = 'clients';
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
            $('#client_datatable').DataTable();
        });
    </script>
@endsection

@extends('layouts.master')
 

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Locations
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_location()">
                            New Location</button></div>
                </h4>
                <p class="fs-16">All Your Locations</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="location_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Location Code</th>

                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Location Name</th>

                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Region</th>

                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Address</th>

                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Phone</th>
                                           
                                           <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Latitude</th>

                                            <th class="sorting_asc" tabindex="0" aria-controls="location_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Longitude</th>

                                            <th class="sorting" tabindex="0" aria-controls="location_datatable"
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
    <div class="modal fade" id="location-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="location_form" name="location_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Location</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Location Code:</label>
                                <input type="hidden" name="location_id" id="location_id" value="">
                                <input type="text" class="form-control" id="location_code" name="location_code" placeholder="Enter station code" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Location Name:</label>
                                
                                <input type="text" class="form-control" id="location_name" name="location_name" placeholder="Enter station code" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Region:</label>
                                
                                <select class="form-control" id="region" name="region">
                                    <option vlaue="">Choose a region</option>
                                    <option vlaue="North">North</option>
                                    <option vlaue="South">South</option>
                                    <option vlaue="East">East</option>
                                    <option vlaue="West">West</option>
                                    <option vlaue="Central">Central</option>
                                </select>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Address:</label>
                                <textarea class="form-control" aria-label="With textarea" id="address" name="address" required></textarea>
                                
                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Phone:</label>
                                
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Location Info:</label>
                                
                                 <input type="hidden" name="location" id="location">
                                <label>{{__('Latitude')}}</label>
                                <input type="text" class="form-control" name="lat" id="lat" value="24.774265">
                                <br>
                                <label>{{__('Longitude')}}</label>
                                <input type="text" class="form-control" name="lng" id="lng" value="46.738586">
                                <br>
                                <div id="googleMap" style="width:100%;height:400px;"></div>

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
        function add_location() {
            $('#location-modal').modal('show');
        }

        //Submit add model
        $("#location_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('locations.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);
                    if (response.code == 200) {

                        $('#location-modal').modal('hide');
                        swal_success();


                    }
                },
                error: function(response) {
                    
                }

            });

        });

        
        //Edit Function

        function edit_location(id) {
            
            $.get("{{ route('locations.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-Location");
                $("#location-modal").modal('show');
                $("#location_id").val(data.id);
                $("#location_code").val(data.location_code);
                $("#location_name").val(data.location_name);
                $("#region").val(data.region).change();
                $("#address").val(data.address);
                $("#phone").val(data.phone);
                $("#lat").val(data.lat);
                $("#lng").val(data.lng);
            });
        }

        //Delete Category
        function delete_department(id) {
            var url = 'departments';
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
            $('#location_datatable').DataTable({
                processing: true,
                serverSide: true,
                type: "POST",
                ajax: "{{ route('locations.index') }}",
                columns: [

                    {
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'location_code',
                        name: 'location-code'
                    },
                    {
                        data: 'location_name',
                        name: 'location_name'
                    },
                    {
                        data: 'region',
                        name: 'region'
                    },
                    {
                        data: 'address',
                        name: 'address'
                    },
                    {
                        data: 'phone',
                        name: 'phone'
                    },
                    
                    {
                        data: 'lat',
                        name: 'latitude',
                    },

                    {
                        data: 'lng',
                        name: 'longitude',
                    },
                    
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    },
                ]
            });


        });

    function initMap() {

        var latitude = $("#lat").val();
        var longitude = $("#lng").val();


        var mapProp = {
            center: new google.maps.LatLng(latitude, longitude),
            zoom: 4,
        };


        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        map.addListener('click', function(e) {

            var lt = e.latLng;
            $("#lat").val(e.latLng.lat());
            $("#lng").val(e.latLng.lng());
            var latitude = $("#lat").val();
            var longitude = $("#lng").val();

        });

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(latitude, longitude),
            title: "Hello World!",
            visible: true
        });

        marker.setMap(map);

    }

    $("#lat").mouseout(function() {
        initMap();
    });

    $("#lng").mouseout(function() {
        initMap();
    });



    function setlocation(lat, lng) {

        lat = lat;
        log = lng;

        latLng = new google.maps.LatLng(lat, log)
        var mapOptions = {
            center: latLng,
            zoom: 5,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("googleMap1"), mapOptions);

        var marker = new google.maps.Marker({
            position: latLng,
            title: "Hello World!",
            visible: true
        });

        marker.setMap(map);
    }

    </script>

    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGx5h3BTGfUETTkX-YVnu_akUF--4rf3s&callback=initMap">
    </script>
@endsection

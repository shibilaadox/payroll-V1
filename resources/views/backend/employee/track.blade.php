@extends('layouts.master')
@section('page-css')

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
@endsection

@section('main-content')
    <div class="breadcrumb">
        <h1>Track Employees</h1>

    </div>
    
     <form name="filter_form" id="filter_form" method="get" enctype="multipart/form-data">
                        
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="employee" class="col-form-label">{{__('Employee')}}</label>
                            <select class="form-control m-select2 select_class" id="employee" name="employee" style="width: 100%">
                                <option value="">{{__('select an employee')}}</option>
                                <?php foreach ($data['all_users'] as $row1) { ?>
                                    <option value="<?php echo $row1->id ?>" <?php if (isset($_GET['employee']) && $_GET['employee'] == $row1->id) {
                                                                                echo "selected";
                                                                            } ?>><?php echo $row1->name; ?></option>
                                <?php } ?>
                                <option value="All" <?php if (isset($_GET['employee']) && $_GET['employee'] == "All") {
                                                        echo "selected";
                                                    } ?>>All</option>

                            </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="location" class="col-form-label">{{__('Location')}}</label>
                            <select class="form-control m-select2 select_class" id="location" name="location" style="width: 100%">
                                <option value="">{{__('select a location')}}</option>
                                <?php foreach ($data['all_locations'] as $row1) { ?>
                                    <option value="<?php echo $row1->lat.",".$row1->lng ?>" <?php if (isset($_GET['location']) && $_GET['location'] == $row1->lat.",".$row1->lng) {
                                                                                echo "selected";
                                                                            } ?>><?php echo $row1->location_name; ?></option>
                                <?php } ?>
                                <option value="All" <?php if (isset($_GET['location']) && $_GET['location'] == "All") {
                                                        echo "selected";
                                                    } ?>>All</option>

                            </select>
                        </div>
                        
                    </div>
                    <div class="row">

                        <div class="form-group col-md-12" style="margin-left: 45.7%">
                            <button name="filter_map" id="filter_map" type="submit" class="btn btn-primary">{{__('Apply')}}</button>
                        </div>
                    </div>


                </form>
    
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <!-- end of row -->

        <div class="row mb-12">
            <div class="col-md-12 mb-3">
                <div class="card text-left">
                    <div class="card-body">
                       

                        <div id="map" style="width: 1040px; height: 400px;"></div>


                    </div>
                </div>
            </div>
            <!-- end of col-->

        </div>
        <!-- end of row -->
    </section>

    

@endsection

@section('page-js')

<script type="text/javascript"  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGx5h3BTGfUETTkX-YVnu_akUF--4rf3s&callback=initMap"></script>

<script type="text/javascript">
    
    var locations = [];
    var i=0;
    <?php foreach($data['users'] as $row){ 

        $lat_lng =json_decode($row['location'],true); ?>
        locations[i] = ['{{$row['user'][0]['name']}}',{{$lat_lng['latitude']}},{{$lat_lng['longitude']}},1];
        i++;

    <?php } ?> 
    
    var lat = 23.8859;var lng = 45.0792;
    <?php if(isset($_GET['location']) && $_GET['location']!="" && $_GET['location']!="All"){ ?>
    var loc = $("#location").val();
    loc = loc.split(",");
    lat = loc[0];
    lng = loc[1];
    <?php } ?>
    
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(lat,lng),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    
    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    var routePoints = [];
    for (i = 0; i < locations.length; i++) {  
        routePoints.push(new google.maps.LatLng(locations[i][1], locations[i][2]));
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        
    });
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
      
      var route= new google.maps.Polyline({
      path: routePoints,
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2
      });

  route.setMap(map);
    }
  </script>


@endsection

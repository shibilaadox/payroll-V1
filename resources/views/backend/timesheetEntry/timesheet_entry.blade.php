
                
                <div class="table-responsive">
                    <div id="timesheet_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="timesheet_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="timesheet_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                            colspan="1"></th>
                                            
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Date</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Client</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Location</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Position Code</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT1 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT2 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT3 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT4 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">OT5 Hrs</th>
                                           
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day8 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Day12 Hrs</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">ND Days</th>
                                            <th tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
                                                colspan="1">Undertime</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i=1;foreach($data_employee as $row){ ?>
                                            <tr id="delete{{$row->id}}">
                                            <td><a class="text-danger mr-2" onclick="delete_timesheet({{ $row->id }})">
                                <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                            </a></td>
                                           
                                            <td>{{$row->date}}</td>
                                            <td>{{$row->client->name}}</td>
                                            <td>{{$row->location->location_name}}</td>
                                            <td>{{$row->job_role}}</td>
                                            <td><input value="{{$row->ot1_hrs}}" type="text"  class="form-control form-control-sm ot1_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot1_hrs"></td>
                                            <td><input value="{{$row->ot2_hrs}}" type="text"  class="form-control form-control-sm ot2_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot2_hrs"></td>
                                            <td><input value="{{$row->ot3_hrs}}" type="text"  class="form-control form-control-sm ot3_hrs" aria-controls="timesheet_datatable" style="width:52px" data-id="{{$row->id}}" data-column="ot3_hrs"></td>
                                            <td><input value="{{$row->ot4_hrs}}" type="text"  class="form-control form-control-sm ot4_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot4_hrs"></td>
                                            <td><input value="{{$row->ot5_hrs}}" type="text"  class="form-control form-control-sm ot5_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot5_hrs"></td>
                                            <td><input value="{{$row->day8}}" type="text"  class="form-control form-control-sm day8" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="day8"></td>
                                            <td><input value="{{$row->day12}}" type="text"  class="form-control form-control-sm day12" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="day12"></td>
                                            <td><input value="{{$row->nd_days}}" type="text"  class="form-control form-control-sm nd_days" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="nd_days"></td>
                                            <td><input value="{{$row->undertime}}" type="text"  class="form-control form-control-sm undertime" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="undertime"></td>
                                            </tr>
                                            
                                        <?php $i++;} ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

               

<script>
    $(".ot1_hrs,.ot2_hrs,.ot3_hrs,.ot4_hrs,.ot5_hrs,.day8,.day12,.nd_days,.undertime").keypress(function(e) {
    if(e.which == 13) {
        var id=$(this).attr('data-id');
        var column=$(this).attr('data-column');
        var value=$(this).val();
        $.ajax({

        type:"GET",
        url:"{{ route('update_entry') }}",
        dataType: 'text',
        data: {value:value,id:id,column:column},
        success: function (res) { }
        });

    }
    });

    
    </script>

                
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
                                            <th class="th_ot1hrs" tabindex="0" aria-controls="timesheet_datatable" rowspan="1"
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
                                            <td class="td_ot1hrs"><input value="{{$row->ot1_hrs}}" type="text"  class="form-control form-control-sm ot1_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot1_hrs"></td>
                                            <td class="td_ot2hrs"><input value="{{$row->ot2_hrs}}" type="text"  class="form-control form-control-sm ot2_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot2_hrs"></td>
                                            <td class="td_ot3hrs"><input value="{{$row->ot3_hrs}}" type="text"  class="form-control form-control-sm ot3_hrs" aria-controls="timesheet_datatable" style="width:52px" data-id="{{$row->id}}" data-column="ot3_hrs"></td>
                                            <td class="td_ot4hrs"><input value="{{$row->ot4_hrs}}" type="text"  class="form-control form-control-sm ot4_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot4_hrs"></td>
                                            <td class="td_ot5hrs"><input value="{{$row->ot5_hrs}}" type="text"  class="form-control form-control-sm ot5_hrs" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="ot5_hrs"></td>
                                            <td class="td_day8"><input value="{{$row->day8}}" type="text"  class="form-control form-control-sm day8" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="day8"></td>
                                            <td class="td_day12"><input value="{{$row->day12}}" type="text"  class="form-control form-control-sm day12" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="day12"></td>
                                            <td class="td_nd_days"><input value="{{$row->nd_days}}" type="text"  class="form-control form-control-sm nd_days" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="nd_days"></td>
                                            <td class="td_undertime"><input value="{{$row->undertime}}" type="text"  class="form-control form-control-sm undertime" aria-controls="timesheet_datatable" style="width: 52px" data-id="{{$row->id}}" data-column="undertime"></td>
                                           
                                        </tr>
                                            
                                        <?php $i++;} ?>
                                        <tfoot>
                                        <tr><td colspan=5><b>Total Hours</b></td>
                                        <td class="tdclass_ot1hrs"></td>
                                        <td class="tdclass_ot2hrs"></td>
                                        <td class="tdclass_ot3hrs"></td>
                                        <td class="tdclass_ot4hrs"></td>
                                        <td class="tdclass_ot5hrs"></td>
                                        <td class="tdclass_day8"></td>
                                        <td class="tdclass_day12"></td>
                                        <td class="tdclass_nd_days"></td>
                                        <td class="tdclass_undertime"></td>
                                        </tr>
                                        </tfoot>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

               

<script>
    $(".ot1_hrs,.ot2_hrs,.ot3_hrs,.ot4_hrs,.ot5_hrs,.day8,.day12,.nd_days,.undertime").on("input", function() {
       
   // if(e.which == 13) {
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

    //}
    });

    var sum_ot1hrs=0;
    $('.td_ot1hrs').each(function()
    {
        var ot1_hrs_new = $(this).html();
        var ot1_hrs_new1 = $(ot1_hrs_new);
        sum_ot1hrs = sum_ot1hrs+ parseFloat(ot1_hrs_new1.val());
        $(".tdclass_ot1hrs").html(sum_ot1hrs);
       
    });

    var sum_ot2hrs=0;
    $('.td_ot2hrs').each(function()
    {
        var ot2_hrs_new = $(this).html();
        var ot2_hrs_new1 = $(ot2_hrs_new);
        sum_ot2hrs = sum_ot2hrs+ parseFloat(ot2_hrs_new1.val());
        $(".tdclass_ot2hrs").html(sum_ot2hrs);
       
    });

    var sum_ot3hrs=0;
    $('.td_ot3hrs').each(function()
    {
        var ot3_hrs_new = $(this).html();
        var ot3_hrs_new1 = $(ot3_hrs_new);
        sum_ot3hrs = sum_ot3hrs+ parseFloat(ot3_hrs_new1.val());
        $(".tdclass_ot3hrs").html(sum_ot3hrs);
       
    });

    var sum_ot4hrs=0;
    $('.td_ot4hrs').each(function()
    {
        var ot4_hrs_new = $(this).html();
        var ot4_hrs_new1 = $(ot4_hrs_new);
        sum_ot4hrs = sum_ot4hrs+ parseFloat(ot4_hrs_new1.val());
        $(".tdclass_ot4hrs").html(sum_ot4hrs);
       
    });

    var sum_ot5hrs=0;
    $('.td_ot5hrs').each(function()
    {
        var ot5_hrs_new = $(this).html();
        var ot5_hrs_new1 = $(ot5_hrs_new);
        sum_ot5hrs = sum_ot5hrs+ parseFloat(ot5_hrs_new1.val());
        $(".tdclass_ot5hrs").html(sum_ot5hrs);
       
    });

    var sum_day8=0;
    $('.td_day8').each(function()
    {
        var day8_new = $(this).html();
        var day8_new1 = $(day8_new);
        sum_day8 = sum_day8+ parseFloat(day8_new1.val());
        $(".tdclass_day8").html(sum_day8);
       
    });

    var sum_day12=0;
    $('.td_day12').each(function()
    {
        var day12_new = $(this).html();
        var day12_new1 = $(day12_new);
        sum_day12 = sum_day12+ parseFloat(day12_new1.val());
        $(".tdclass_day12").html(sum_day12);
       
    });

    var sum_nd_days=0;
    $('.td_nd_days').each(function()
    {
        var nd_days_new = $(this).html();
        var nd_days_new1 = $(nd_days_new);
        sum_nd_days = sum_nd_days+ parseFloat(nd_days_new1.val());
        $(".tdclass_nd_days").html(sum_nd_days);
       
    });


    var sum_undertime=0;
    $('.td_undertime').each(function()
    {
        var undertime_new = $(this).html();
        var undertime_new1 = $(undertime_new);
        sum_undertime = sum_undertime+ parseFloat(undertime_new1.val());
        $(".tdclass_undertime").html(sum_undertime);
       
    });

    




    

    
    </script>
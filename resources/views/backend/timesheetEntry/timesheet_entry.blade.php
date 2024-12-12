
                
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
                                                colspan="1">Id</th>
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
                                            <td>{{$i}}</td>
                                            <td>{{$row->date}}</td>
                                            <td>{{$row->client->name}}</td>
                                            <td>{{$row->location->location_name}}</td>
                                            <td>{{$row->job_role}}</td>
                                            <td>{{$row->ot1_hrs}}</td>
                                            <td>{{$row->ot2_hrs}}</td>
                                            <td>{{$row->ot3_hrs}}</td>
                                            <td>{{$row->ot4_hrs}}</td>
                                            <td>{{$row->ot5_hrs}}</td>
                                            <td>{{$row->day8}}</td>
                                            <td>{{$row->day12}}</td>
                                            <td>{{$row->nd_days}}</td>
                                            <td>{{$row->undertime}}</td>
                                            </tr>
                                            
                                        <?php $i++;} ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

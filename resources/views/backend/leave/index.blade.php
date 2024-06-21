@extends('layouts.master')
@section('page-css')

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
@endsection

@section('main-content')
    <div class="breadcrumb">
        <h1>All Leave Requests</h1>

    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <!-- end of row -->

        <div class="row mb-4">
            <div class="col-md-12 mb-3">
                <div class="card text-left">
                    <div class="card-body">
                        

                        <div class="table-responsive">
                            <table class="table table-striped" id="leave_datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Added Date & Time</th>
                                        <th scope="col">Type</th>
                                        <th scope="col">Hours/Days</th>
                                        <th scope="col">Details</th>
                                        <th scope="col">Reason</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Reason For Rejection</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($data['leave'] as $row)
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->user->firstname }}</td>
                                            <td>{{ $row->created_at }}</td>
                                            <td>{{ $row->type }}</td>
                                            <td><?php if($row->type=="days") echo $row->count." days"; else if($row->type=="hours") echo $row->count." hrs"?></td>
                                            <td><?php 
                                                 $json = json_decode($row->details);
                                            
                                                 foreach($json as $key => $val) {
                                                          
                                                    echo $key." : ".$val;?>
                                                    <br>
    
                                                <?php  }?>
                                            </td>
                                            <td>{{$row->reason }}</td>
                                            <td><?php 
                                                if($row->status=="Pending"){
                                                    $color='btn-warning';
                                                }else if($row->status=='Rejected'){
                                                    $color='btn-danger';
                                                }else{
                                                    $color='btn-success'; } 
                                                ?>
                                                <?php //if($row->status=="Pending"){?>
                                                <div class="btn-group">

                                                <button type="button" class="btn {{$color}} dropdown-toggle btn_class{{$row->id}}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{$row->status}}</button>
                                                <div class="dropdown-menu" x-placement="top-start">
                                                <button class="dropdown-item"  onclick="status_change('{{$row->id}}','Approved')">Approve</button>
                                                <button class="dropdown-item" onclick="status_change('{{$row->id}}','Rejected')">Reject</button>
            
                                                </div>
                                                </div>
                                                <?php /*} else { ?>
                                                    <button type="button" class="btn {{$color}} btn_class{{$row->id}}"  aria-haspopup="true" aria-expanded="false">{{$row->status}}</button>
                                                <?php }*/?>
                                                </td>
                                            
                                            <td>{{$row->reject_reason }}</td>
                                            <td>
                                                <a class="text-danger mr-2" onclick="delete_leave('{{$row->id}}')" title="Disbale employee">
                                                    <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>


                    </div>
                </div>
            </div>
            <!-- end of col-->

        </div>
        <!-- end of row -->
    </section>
    
    
    {{-- Add modal --}}
    <div class="modal fade" id="reason_modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="reason_form" name="reason_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Reason</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Reason:</label>
                                <textarea class="form-control" aria-label="With textarea" id="reason" name="reason" required></textarea>
                                <input type="hidden" name="id" id="id" value="">
                                <input type="hidden" name="status" id="status" value="">
                                
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


@endsection

@section('page-js')

<script>

$('#leave_datatable').DataTable();


//Delete Leave
function delete_leave(id) {
    var url = 'leaves';
    remove(id, url);
}
   
function status_change(id,status) {
           
    event.preventDefault();
    let _token = $('meta[name="csrf-token"]').attr('content');
    
    if(status=="Rejected")
    {
        $('#reason_modal').modal('show');
        $("#id").val(id);
        $("#status").val(status);
    }
    
    
    else
    {
    $.ajax({
            url: "<?php echo url('leave_update_status'); ?>",
            type: "GET",
            data: {id:id,status:status},
            cache: false,
                
            success: function(response) {
                
            if (response) {

                location.reload();

            }
            
            }

        });
    }
            
    }
        
        
        
    $("#reason_form").on("submit", function(e) {
            e.preventDefault();
            var id = $("#id").val();
            var status = $("#status").val();
            var reason = $("#reason").val();
            
            $.ajax({
            url: "<?php echo url('leave_update_status'); ?>",
            type: "GET",
            data: {id:id,status:status,reason:reason},
            cache: false,
                
            success: function(response) {
                
            if (response) {


                location.reload();
                    
            }
            
            }

    });
    
    });
</script>


@endsection

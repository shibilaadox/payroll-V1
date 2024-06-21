@extends('layouts.master')
@section('page-css')
    <style>
    .app-admin-wrap 
    {   
        float:right;
    }
    </style>

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">
@endsection

@section('main-content')
    <div class="breadcrumb">
        <h1>All Employees</h1>

    </div>
    
    <section class="basic-action-bar">
        <!-- end of row -->

        
                        <h4 class="card-title mt-1" style="text-align: end;"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('employee.create') }}">
                                    New Employee</a></button></h4><br>

                        
                            
                            <?php foreach ($data['users'] as $row) { ?>
                            
                            <div class="col-md-3" style="float:left">
                            <div class="card card-profile-1 mb-4">
                                <div class="card-body text-center">
                                    <div class="avatar box-shadow-2 mb-3">
                                        <img src="https://odoos.in/apps/HRMS/assets/images/faces/1.jpg" alt="">
                                    </div>
                                    <h7 class="m-0"><b><?php echo $row->firstname." ".$row->lastname?></b></h7><br>
                                    <h8><?php //echo $row->userdetails->departments->name ?></h8><br>
                                    <h8><?php echo $row->email ?></h8><br>
                                    <h8><?php echo $row->phone ?></h8>
                                    
                                    <div class="card-socials-simple mt-4">
                                        <a class="text-success mr-2" href="{{ route('employee.edit', $row->id) }}">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                        </a>
                                        
                                        <a class="text-danger mr-2" onclick="delete_user('{{$row->id}}')" title="Disbale employee">
                                                    <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                            <?php }  ?> 
                            </div> 
                           

                   
        <!-- end of row -->
    </section>

@endsection

@section('page-js')

<script>
   
        $('#user_table').DataTable();
         
        function delete_user(id) {
           
           
            event.preventDefault();
            let _token = $('meta[name="csrf-token"]').attr('content');
            
            $.ajax({
                url: "<?php echo url('update_status'); ?>",
                type: "GET",
                data: {id:id},
                cache: false,
                
                success: function(response) {
                   
                   
                       location.reload();

                    
                },
                error: function(response) {

                }

            });
            
        }
</script>


@endsection

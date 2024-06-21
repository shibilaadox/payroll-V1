@extends('layouts.master')
 
@section('page-css')

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endsection

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">Projects
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_project()">
                            New Project</button></div>
                </h4>
                <br>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="project_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Project Name</th>
                                        <th scope="col">Client</th>
                                        <th scope="col">Project Type</th>
                                        <th scope="col">Project Phases</th>
                                        <th scope="col">Project Status</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Assigned To</th>
                                        <th scope="col">Payment</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($data['projects'] as $row)
                                        <tr>
                                            <th scope="row">{{ $i++ }}</th>
                                            <td>{{ $row->project_name }}</td>
                                            <td>{{ $row->clients->name }}</td>
                                            <td><?php echo $row->project." - ".$row->project_type?></td>
                                            <td>{{ $row->project_phase }}</td>
                                            <td>{{ $row->status }}</td>
                                            <td><?php echo $row->start_date." to ".$row->end_date?></td>
                                            <td>{{ $row->description }}</td>
                                            <td>{{ $row->employees->firstname }}</td>
                                            <td>{{ $row->salary }}</td>
                                            <td>
                                                <a class="text-success mr-2" onclick="edit_project('{{$row->id}}')">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                                                </a>
                                                <a class="text-danger mr-2" onclick="delete_project('{{$row->id}}')" title="Delete Project">
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

            </div>
        </div>
    </div>

    {{-- Add modal --}}
    <div class="modal fade" id="project-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="project_form" name="project_form" method="POST" class="needs-validation">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add Project</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project:</label>
                                <select class="form-control" id="project" name="project" required>
                                    <option value="">Select</option>
                                    <option value="Civil">Civil</option>
                                    <option value="Interior">Interior</option>
                                </select>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Type:</label>
                                <select class="form-control" id="project_type" name="project_type" required>
                                    <option value="">Select</option>
                                    <option value="Residential Project">Residential Project</option>
                                    <option value="Commercial Project">Commercial Project</option>
                                    <option value="Public Project">Public Project</option>
                                </select>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Name:</label>
                                <input type="text" class="form-control" id="project_name" name="project_name" placeholder="Enter project name" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Client:</label>
                                <select class="form-control" id="client" name="client" required>
                                    <option value="">Select</option>
                                    <?php foreach($data['clients'] as $row){?>
                                    <option value={{$row->id}}>{{$row->name}}</option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Phases:</label>
                                <select class="form-control" id="project_phase" name="project_phase" required>
                                    <option value="">Select</option>
                                    <option value="Construction">Construction</option>
                                    <option value="Consultancy">Consultancy</option>
                                    <option value="Proposal">Proposal</option>
                                </select>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Amount:</label>
                                <input type="text" class="form-control" id="project_amount" name="project_amount" placeholder="Enter name">

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Start Date:</label>
                                <input type="text" class="form-control" id="start_date" name="start_date" placeholder="Enter start date">

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">End Date:</label>
                                <input type="text" class="form-control" id="end_date" name="end_date" placeholder="Enter end date">

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Location:</label>
                                <input type="text" class="form-control" id="project_location" name="project_location" placeholder="Enter project location" required>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Description:</label>
                                <textarea class="form-control" aria-label="With textarea" id="description" name="description"></textarea>
                                <input type="hidden" name="project_id" id="project_id" value="">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Assigned To:</label>
                                <select class="form-control" id="employee" name="employee">
                                    <option value="">Select</option>
                                    <?php foreach($data['users'] as $row){?>
                                    <option value={{$row->id}}>{{$row->firstname}}</option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Payment:</label>
                                <input type="text" class="form-control" id="salary" name="salary" placeholder="Enter payment of employee">

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Project Status:</label>
                                <select class="form-control" id="project_status" name="project_status" required>
                                    <option value="">Select</option>
                                    <option value="Ongoing">Ongoing</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Hold">Hold</option>
                                    <option value="Upcoming">Upcoming</option>
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
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript">

        //open model
        function add_project() {
            $('#project-modal').modal('show');
        }

        //Submit add model
        $("#project_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('projects.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);
                    if (response.code == 200) {

                        $('#project-modal').modal('hide');
                        //swal_success();
                        window.location.reload();


                    }
                },
                error: function(response) {
                    
                }

            });

        });

        
        //Edit Function

        function edit_project(id) {
            
            $.get("{{ route('projects.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-Category");
                $("#project-modal").modal('show');
                $("#project_id").val(data.id);
                $("#project").val(data.project);
                $("#project_type").val(data.project_type).change();
                $("#project_name").val(data.project_name);
                $("#client").val(data.client);
                $("#project_phase").val(data.project_phase);
                $("#project_amount").val(data.project_amount);
                $("#start_date").val(data.start_date);
                $("#end_date").val(data.end_date);
                $("#project_location").val(data.project_location);
                $("#description").val(data.description);
                $("#employee").val(data.employee);
                $("#project_status").val(data.status);
                /*var res = data.project_phase.split(",");
    
                res.forEach(element =>{
     
                        $('#project_phase option[value='+element+']').attr('selected','selected').change();
        
                });*/
            });
        }

        //Delete Category
        function delete_project(id) {
            var url = 'projects';
            remove(id, url);
        }

        $('#project_datatable').DataTable();

        $('document').ready(function() {
            
            $('.select_class').select2();
            // csrf token
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

        });

    $('#start_date').daterangepicker({
        singleDatePicker: true,
         locale: {
          format: 'YYYY/MM/DD',
        },
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'),10)
    }); 

    $('#end_date').daterangepicker({
        singleDatePicker: true,
         locale: {
          format: 'YYYY/MM/DD',
        },
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'),10)
    }); 
    
   
    </script>
@endsection

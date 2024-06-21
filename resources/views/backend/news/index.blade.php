@extends('layouts.master')
 

@section('main-content')
<style>
    #news-modal {
   z-index: 9997;
}

#emdadUploader {
   z-index: 9998; // This will come above popup1
}

</style>
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">News
                    <div style="float: right"><button type="button" class="btn btn-primary ripple m-1" onclick="add_news()">
                            New News</button></div>
                </h4>
                <p class="fs-16">All Your News</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="news_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="news_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 90.002px;">Id</th>
                                                
                                            <th class="sorting_asc" tabindex="0" aria-controls="news_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Type: activate to sort column descending"
                                                style="width: 181.002px;">Type</th>
                                                
                                            <th class="sorting_asc" tabindex="0" aria-controls="news_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Heading</th>
                                            <th class="sorting" tabindex="0" aria-controls="news_datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Position: activate to sort column ascending"
                                                style="width: 270.002px;">News</th>
                                                
                                            <th class="sorting_asc" tabindex="0" aria-controls="news_datatable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 181.002px;">Image</th>
                                                
                                            <th class="sorting" tabindex="0" aria-controls="news_datatable"
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
    <div class="modal fade" id="news-modal" tabindex="-1" role="dialog" aria-labelledby="UnitModalTitle"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="news_form" name="news_form" method="POST" class="needs-validation was-validated">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="UnitModalTitle">Add News</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Type:</label>
                                <select class="form-control" id="type" name="type">
                                    <option value="news">News</option>
                                    <option value="notifications">Notifications</option>
                                </select>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="actual_name" class="ul-form__label">Heading:</label>
                                <input type="text" class="form-control" id="heading" name="heading" placeholder="Enter heading" required>

                            </div>
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">News:</label>
                                <textarea class="form-control" aria-label="With textarea" id="news" name="news" required></textarea>
                                <input type="hidden" name="news_id" id="news_id" value="">
                            </div>
                            
                            <div class="form-group col-md-12">
                                <label for="short_name" class="ul-form__label">Image:</label><span class="text-danger">*</span>
                                <div class="custom-file">
                                        <input class="custom-file-input" data-type="single" name="photos"
                                                        id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                                        <label class="custom-file-label" for="inputGroupFile01">Choose
                                                        file</label>
                                                        
                                        <img src='' id='img' style='max-height:100px;max-width:100px;' />
                                </div>
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
        function add_news() {
            $('#news-modal').modal('show');
        }

        //Submit add model
        $("#news_form").on("submit", function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            console.log(formData);
            let _token = $('meta[name="csrf-token"]').attr('content');

            $.ajax({
                url: "{{ route('news.store') }}",
                type: "POST",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    // console.log(response.code);
                    if (response.code == 200) {
                        
                        $('#news-modal').modal('hide');
                        swal_success();


                    }
                },
                error: function(response) {
                    
                }

            });

        });

        
        //Edit Function

        function edit_news(id) {
            
            $.get("{{ route('news.index') }}" + '/' + id + '/edit', function(data) {
                $("#saveBtn").val("Edit-News");
                $("#news-modal").modal('show');
                $("#news_id").val(data.id);
                $("#heading").val(data.heading);
                $("#news").val(data.content);
                $("#type").val(data.type).change();
            });
        }

        //Delete Category
        function delete_news(id) {
            var url = 'news';
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
            $('#news_datatable').DataTable({
                processing: true,
                serverSide: true,
                type: "POST",
                ajax: "{{ route('news.index') }}",
                columns: [

                    {
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'type',
                        name: 'type'
                    },
                    {
                        data: 'heading',
                        name: 'heading'
                    },
                    {
                        data: 'content',
                        name: 'content'
                    },
                    {
                        data: 'image',
                        name: 'image',
                        render: function(data, type, full, meta) {
                            if(data!="")
                            return '<a href=' + data + '  target="_blank"><img src=' + data +
                                ' border="0" width="80" class="img-rounded" align="center" /></a>';
                            else
                            return null;
                        }
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    },
                ]
            });


        });
    </script>
@endsection

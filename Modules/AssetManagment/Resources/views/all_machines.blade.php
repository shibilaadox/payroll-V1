
@extends('layouts.master')

@section('main-content')
    <div class="col-md-12 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="mb-3 fs-22 font-weight-bold">{{ __('Assets') }}
                    <div style="float: right"><a href="{{ route('machines.create') }}" type="button"
                            class="btn btn-primary ripple m-1">
                            {{ __('New Assets') }}</a></div>
                </h4>
                <p class="fs-16">{{ __('All Your Assets') }}</p>

                <div class="table-responsive">
                    <div id="comma_decimal_table_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="assets_datatable" class="display table table-striped table-bordered dataTable"
                                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                                    <thead>
                                        <tr role="row">
                                            <th>{{ __('SL NO') }}</th>
                                            <th>{{ __('Description') }}</th>
                                            <th>{{ __('QTY') }}</th>
                                            <th>{{ __('Brand Name') }}</th>
                                            <th>{{ __('Project') }}</th>
                                            <th>{{ __('Manufacture Date') }}</th>
                                            <th>{{ __('Status Report') }}</th>
                                             
                                            <th>{{ __('Actions') }}</th>

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
@endsection


@section('page-js')
    <script type="text/javascript">
        $('document').ready(function() {

            // csrf token
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            var i = 1;
            //Datatable
            $('#assets_datatable').DataTable({
                processing: true,
                serverSide: true,
                type: "POST",
                ajax: "{{ route('machines.index') }}",
                columns: [

                    {
                        'render': function() {
                            return i++;
                        }
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'qty',
                        name: 'qty'
                    },
                    {
                        data: 'manufacturer',
                        name: 'manufacturer'
                    },
                    {
                        data: 'project_name',
                        name: 'project_name'
                    },
                    {
                        data: 'date',
                        name: 'date'
                    },
                    {
                        data: 'status',
                        name: 'status'
                    },
                    

                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    },
                ]
            });

            table.draw();
        });

        // Delete assets
        function del_assets(id) {
            var url = 'machines';
            remove(url,id);
            // remove(id, url);
        }
    </script>
@endsection

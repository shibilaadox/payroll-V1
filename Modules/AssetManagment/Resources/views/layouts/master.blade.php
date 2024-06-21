<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Module AssetManagment</title>

    {{-- Laravel Mix - CSS File --}}

    <link id="gull-theme" rel="stylesheet" href="{{ asset('assets\fonts\iconsmind\iconsmind.css') }}">
    <link id="gull-theme" rel="stylesheet" href="{{ asset('assets/styles/css/themes/lite-purple.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/perfect-scrollbar.css') }}">
    {{-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> --}}
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

</head>

<body>
    <style>
        .select2-hidden-accessible {
            border: 0 !important;
            clip: rect(0 0 0 0) !important;
            height: 1px !important;
            margin: -1px !important;
            overflow: hidden !important;
            padding: 0 !important;
            position: absolute !important;
            width: 1px !important
        }

        .form-group label {
            font-size: 18px;
            color: #131214;
        }
    </style>
    <div class="app-admin-wrap layout-sidebar-large clearfix">
        {{-- @include('layouts.large-vertical-sidebar.header')
        @include('layouts.large-vertical-sidebar.sidebar') --}}
        <!-- ============ Body content start ============= -->
        <div class="main-content-wrap sidenav-open d-flex flex-column flex-grow-1">

            <div class="main-content">
                @yield('content')
            </div>

            <div class="flex-grow-1"></div>
            {{-- @include('layouts.common.footer') --}}
        </div>
        <div class="modal fade" id="cm_n_Modal" aria-labelledby="cm_n_Modal" aria-hidden="true">
            <div class="modal-dialog" id="cm_n_Modal_content">

            </div>
        </div>
        <div class="modal fade" id="cm_xl_Modal" aria-labelledby="cm_xl_Modal" aria-hidden="true">
            <div class="modal-dialog modal-xl" id="cm_xl_Modal_content">

            </div>
        </div>
        <div class="modal fade" id="cm_lg_Modal" aria-labelledby="cm_lg_Modal" aria-hidden="true"
            style="overflow:hidden;">
            <div class="modal-dialog modal-lg" id="cm_lg_Modal_content">
            </div>

        </div>
        <div class="modal fade" id="small_modal" aria-labelledby="small_modal" aria-hidden="true">
            <div class="modal-dialog modal-sm" id="small_modal_content">

            </div>
        </div>
        <div class="modal fade" id="cm_full_Modal" aria-labelledby="cm_full_Modal" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen" id="cm_full_Modal_content">

            </div>
        </div>
        <!-- ============ Body content End ============= -->
    </div>


    {{-- Laravel Mix - JS File --}}

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <!--<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>-->
   <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>
    <script src="{{ asset('assets/js/assetmanagment.js') }}"></script>

    <script src="{{ mix('js/app.js') }}"></script>
   
    @yield('page-js')

</body>

</html>

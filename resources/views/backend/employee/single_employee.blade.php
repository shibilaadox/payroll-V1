@extends('layouts.master')
@section('page-css')
    <style>
        .app-admin-wrap {
            float: right;
        }

        .nav-link:hover {
            border-bottom: 3px solid gray;
        }
    </style>

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
@endsection

@section('main-content')
    <div class="container">
        <h3 class="fw-bold ms-3">{{ $employee->firstname }} {{ $employee->lastname }}</h3>
        <hr>

        <!-- Tab Navigation -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link {{ request('tab') == 'profile' || !request()->has('tab') ? 'active' : '' }}"
                   href="{{ route('employee.profile', ['tab' => 'profile', 'id' => $employee->id]) }}">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('tab') == 'projects' ? 'active' : '' }}"
                   href="{{ route('employee.projects', ['tab' => 'projects', 'id' => $employee->id]) }}">Projects</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('tab') == 'timesheet' ? 'active' : '' }}"
                   href="{{ route('employee.timesheet', ['tab' => 'timesheet', 'id' => $employee->id]) }}">Timesheet</a>
            </li>
        </ul>

         <!-- Tab Content -->
         <div class="tab-content">
            @if (request('tab') == 'projects')
                @include('backend.employee.tabs.projects', ['employee' => $employee])
            @elseif (request('tab') == 'timesheet')
                @include('backend.employee.tabs.timesheet', ['employee' => $employee])
            @else
                @include('backend.employee.tabs.profile', ['employee' => $employee,'employee_project_id=>$employee_project_id'])
            @endif
        </div>
    </div>

@endsection

@section('script')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
@endsection

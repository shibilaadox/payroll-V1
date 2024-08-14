@extends('layouts.master')
@section('page-css')
    <style>
        .app-admin-wrap {
            float: right;
        }
    </style>

    <link rel="stylesheet" href="{{ asset('assets/styles/vendor/datatables.min.css') }}">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<style>
    .nav-link:hover {
        border-bottom: 3px solid gray;
    }
</style>

@endsection

@section('main-content')

<h1>{{ $employee->firstname }} {{ $employee->lastname }}</h1>
<hr>


<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item me-5 border">
            <a class="nav-link ps-5 pe-5 active" aria-current="page" href="#">Profile</a>
          </li>
          <li class="nav-item me-5 border" style="border-bottom: 3px solid transparent;">
            <a class="nav-link ps-5 pe-5" href="#">Projects</a>
          </li>
          <li class="nav-item me-5 border">
            <a class="nav-link ps-5 pe-5 " href="#">Timesheet</a>
          </li>
        </ul>
      </div>
    </div>

  </nav>

{{-- <p>Email: {{ $employee->email }}</p>
     <p>Phone: {{ $employee->phone }}</p>
     <p>Department: {{ $employee->userdetails->departments->name ?? 'N/A' }}</p> --}}

@endsection

@section('script')
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
@endsection

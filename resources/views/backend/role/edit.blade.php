@extends('layouts.master')

@section('main-content')
    <div class="breadcrumb">
        <h1>Create Roles</h1>

    </div>
    <div class="separator-breadcrumb border-top"></div>
    <section class="basic-action-bar">
        <div class="row mb-8">
            @php   $permissions = json_decode($role->permissions); @endphp
            <div class="col-md-12 mb-4">
                <div class="card text-left">
                    <form action="{{ route('roles.update', $role->id) }}" method="POST">
                        <input name="_method" type="hidden" value="PATCH">
                        @csrf
                        <div class="card-body roles-table">
                            <h3 class="mb-3 t-font-bold">Role Update</h4>
                                <div class="card-header">
                                    <div class="form-group col-md-6">
                                        <label for="inputtext11" class="ul-form__label">Name:</label>
                                        <input type="text" class="form-control" value="{{ $role->name }}"
                                            id="inputtext11" placeholder="Enter roll name" name="name">

                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-borderless">
                                        <thead>
                                            <h3 class="mb-4 mt-5 t-font-bold">Permissions</h4>
                                        </thead>
                                        <tbody class="mb-4">
                                            @foreach ($perms as $permission)
                                                <tr>

                                                    <td><label
                                                            class="col-from-label fs-18">{{ $permission->name }}</label>
                                                    </td>
                                                    <td></td>

                                                    <td>
                                                        <label class="checkbox checkbox-outline-primary">

                                                          
                                                                <input type="checkbox" name="permissions[]"   value="{{ $permission->name }}" @if($permission->hasRole($role->name)) checked @endif 
                                                                   >
                                                                <span class="checkmark"></span>
                                                         
                                                        </label>
                                                    </td>
                                                </tr>
                                            @endforeach


                                        </tbody>
                                    </table>
                                    <div style="text-align: end;">
                                        <button type="submit" class="btn btn-lg btn-primary m-1">Save</button>
                                    </div>
                                </div>


                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('page-js')

@endsection

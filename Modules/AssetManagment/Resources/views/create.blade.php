@extends('layouts.master')

@section('main-content')
    <div class="breadcrumb">
        <h1>Add New Machine</h1>
    </div>

    <div class="card mb-5">
        <div class="card-body">
            <form data-href="{{ route('machines.store') }}" class="adForm" id="adForm" method="POST">
                @csrf
                <input type="hidden" name="row_id" value="@if (isset($asset)) {{ $asset->id }} @endif">
                {{-- @php dd($asset->date); @endphp --}}
                <!--<div class="form-group row">-->
                <!--    <label for="inputEmail3" class="col-sm-2 col-form-label">Type</label>-->
                <!--    <div class="col-sm-5">-->
                <!--        <div class="input-group mb-3">-->
                <!--            <div class="input-group-prepend">-->
                <!--                <select class="form-control input-group-text  js-example-responsive" style="width:400px;"-->
                <!--                    name="machine_type"-->
                <!--                    value="@if (isset($asset))
{{ $asset->machine_type }}
@endif">-->
                <!--                    @if (isset($asset))
    -->
                <!--                        <option>{{ $asset->machine_type }}</option>-->
                <!--
    @endif-->
                <!--                     @foreach ($machine_types as $item)
    -->

                <!--                         <option value="{{ $item->id }}">{{ $item->name }}</option>-->
                <!--
    @endforeach-->
                <!--                </select>-->
                <!--                <span class="input-group-btn">-->
                <!--                    <a type="button" data-selector="#small_modal"-->
                <!--                        class="btn btn-primary  btn-flat btn-modal ad_Modal_btn"-->
                <!--                        data-url="{{ url('assetmanagment/machine_type/create') }}" data-toggle="modal"-->
                <!--                        title="Add Type"><i class="i-Add"></i></a>-->
                <!--                </span>-->

                <!--            </div>-->
                <!--        </div>-->
                <!--    </div>-->
                <!--</div>-->
                <div class="form-row col-md-12">
                    <div class="form-group col-md-6">
                        <label for="inputEmail1" class="ul-form__label">Name:</label> <span class="text-danger">*</span>
                        <input type="text" name="name" class="form-control" id="inputEmail3"
                            value="@if (isset($asset)) {{ $asset->name }} @endif">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Manufacturer</label>

                        <input type="text" name="manufacturer" class="form-control" id="inputEmail3"
                            value="@if (isset($asset)) {{ $asset->manufacturer }} @endif">
                    </div>
                </div>
                <div class="form-row col-md-12">
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Model</label>
                        <input type="text" name="model" class="form-control" id="inputEmail3"
                            value="@if (isset($asset)) {{ $asset->model }} @endif">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Quantity</label>
                        <input type="text" name="qty" class="form-control" id="inputEmail3"
                            value="@if (isset($asset)) {{ $asset->qty }} @endif">
                    </div>
                </div>
                <div class="form-row col-md-12">
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Active Service Date</label>
                        <input type="date" name="date" class="form-control" id="inputEmail3"
                            value="{{ date('d-m-Y', strtotime(isset($asset->date))) ??'' }} ">

                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Status</label>
                        <select class="form-control input-group-text select2 js-example-responsive" style="width:100%;"
                            name="status" value="@if (isset($asset)) {{ $asset->status }} @endif">
                            @if (isset($asset))
                                <option value="{{ $asset->status }}">{{ $asset->status }}</option>
                            @endif
                            <option value="Working">Working</option>
                            <option value="Good">Good</option>
                            <option value="Repair">Repair</option>

                        </select>

                    </div>
                </div>
                <div class="form-row col-md-12">
                    <div class="form-group col-md-6">
                       <label for="inputEmail2" class="ul-form__label fs-16">{{ __('Image') }}:</label><span
                                class="text-danger">*</span>
                            <div class="input-group mb-3" data-toggle="emdadUploader" data-type="image">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                                </div>
                                <div class="custom-file">
                                    <input class="custom-file-input" data-type="single" name="image" id="blog_img"
                                        aria-describedby="blog_img"
                                        value="@if (isset($blogs)) {{ $blogs->image }} @endif"
                                        data-img="@if (isset($blogs)) {{ image_preview($blogs->image) }} @endif">
                                    <label class="custom-file-label" for="blog_img">Choose
                                        file</label>
                                </div>
                            </div>
                            <div class="selected_files_preview d-flex" for="blog_img" id="blog_img_preview">

                            </div>
                            <div class="" id="file_holder"></div>
                    </div> 
                    <div class="form-group col-md-6">
                        <label for="inputEmail3" class="ul-form__label">Projects</label>
                        <select class="form-control input-group-text select2  js-example-responsive" style="width:100%;"
                            name="project" value="@if (isset($asset)) {{ $asset->project }} @endif">
                          

                            @foreach ($projects as $project)
                                <option {{ !empty($asset)&&$asset->project==$project->id?'selected':'' }} value="{{ $project->id }}">{{ $project->project_name }}</option>
                            @endforeach

                        </select>

                    </div>
                </div>



                <div class="form-group row" style="float:right">
                    <div class="col-sm-10">
                        <button type="submit" name="submitform" id="submitform" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

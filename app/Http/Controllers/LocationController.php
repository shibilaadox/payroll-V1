<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Location;
use DataTables;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $location = Location::all();
            return DataTables::of($location)
                ->addIndexColumn()
               
                ->addColumn('action', function ($row) {

                    $btn = '<button class="btn btn-success" onclick="edit_location('.$row->id.')" type="button"><i class="nav-icon i-Pen-2 font-weight-bold"></i></button>';
                    $btn = $btn . '<button class="btn btn-danger" onclick="delete_location('.$row->id.')" type="button"><i class="nav-icon i-Close-Window font-weight-bold"></i></button>';

                    return $btn;
                })
               
                ->rawColumns(['action'])
                ->make(true);
        }
      
        return view('backend.location.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {

            $input['location_code'] = $request->location_code;
            $input['location_name'] = $request->location_name;
            $input['region'] = $request->region;
            $input['phone'] = $request->phone;
            $input['region'] = $request->region;
            $input['lat'] = $request->lat;
            $input['lng'] = $request->lng;
            $input['address'] = $request->address;

            Location::updateOrCreate(['id' => $request->location_id] ,$input);

            return response()->json(['code' => '200', 'status' => 'Location added successfully']);

        } catch (Throwable $e) {

            report($e);
            return response()->json(['code' => '500', 'status' => $e]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $location = Location::find($id);
        return response()->json($location);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $location = Location::find($id);
        $location->delete();
    }
}

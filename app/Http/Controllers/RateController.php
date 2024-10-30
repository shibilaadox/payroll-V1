<?php

namespace App\Http\Controllers;

use App\Models\Deduction;
use Illuminate\Http\Request;
use App\Models\Rate;
use App\Models\User;
use DataTables;
use Throwable;

class RateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data['rate'] = Rate::get();
        $rate = Rate::all();

        return view('backend.rate.index',['data'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // return view('backend.rate.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'client_code' => 'required|string|max:255',
            'branch' => 'required|string|max:255',
            'position' => 'required|string|max:255',
            'rate8' => 'required|numeric',
            'rate12' => 'required|numeric',
            'cola' => 'required|numeric',
            'nd' => 'required|numeric',
        ]);

        // Create a new rate
        Rate::create([
            'client_code' => $request->client_code,
            'branch' => $request->branch,
            'position' => $request->position,
            'rate8' => $request->rate8,
            'rate12' => $request->rate12,
            'cola' => $request->cola,
            'nd' => $request->nd,
        ]);

        return response()->json(['code' => 200, 'message' => 'Rate added successfully']);
        try {
            Rate::create($validatedData);
            return response()->json(['code' => 200, 'message' => 'Rate added successfully']);
        } catch (\Exception $e) {
            return response()->json(['code' => 500, 'message' => $e->getMessage()]);
        }

        try {

            $input['user_id'] = $request->user;
            $input['ded_code'] = $request->code;
            $input['ded_no'] = $request->number;
            $input['ded_amount'] = $request->amount;

            Deduction::updateOrCreate(['id' => $request->deduction_id] ,$input);

            return response()->json(['code' => '200', 'status' => 'Deduction added successfully']);
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
    // public function edit($id)
    // {
    //     $deduction = Deduction::find($id);
    //     return response()->json($deduction);
    // }
    public function edit($id)
    {
        // Find the rate by its ID
        $rate = Rate::find($id);

        // Check if rate exists
        if (!$rate) {
            return response()->json(['code' => 404, 'status' => 'Rate not found']);
        }

        // Return the rate as JSON
        return response()->json($rate);
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
         $request->validate([
            'client_code' => 'required|string|max:255',
            'branch' => 'required|string|max:255',
            'position' => 'required|string|max:255',
            'rate8' => 'required|numeric',
            'rate12' => 'required|numeric',
            'cola' => 'required|numeric',
            'nd' => 'required|numeric',
        ]);

        try {
            $rate = Rate::findOrFail($id);

            $rate->client_code = $request->client_code;
            $rate->branch = $request->branch;
            $rate->position = $request->position;
            $rate->rate8 = $request->rate8;
            $rate->rate12 = $request->rate12;
            $rate->cola = $request->cola;
            $rate->nd = $request->nd;
            $rate->save();

            return response()->json(['code' => 200, 'status' => 'Rate updated successfully']);
        } catch (\Exception $e) {
            report($e);
            return response()->json(['code' => 500, 'status' => 'Error updating rate: ' . $e->getMessage()]);
        }

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $rate = Rate::find($id); // Use the model name you have for rates
        if ($rate) {
            $rate->delete();
            return response()->json(['message' => 'Rate deleted successfully.']);
        }
        return response()->json(['message' => 'Rate not found.'], 404);
        
        $deduction = Deduction::find($id);
        $deduction->delete();


    }
}

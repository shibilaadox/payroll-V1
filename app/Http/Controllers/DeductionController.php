<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Deduction;
use App\Models\User;
use DataTables;

class DeductionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data['deduction'] = Deduction::with('user')->get();
        $data['users'] = User::where('user_type','Employee')->get();
        return view('backend.deduction.index',['data'=>$data]);
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

        $request->validate([
            'user' => 'required',
            'code' => 'required',
            'description' => 'required',
        ]);

        Deduction::create([
            'user_id' => $request->user,
            'ded_code' => $request->code,
            'description' => $request->description,
        ]);

        return response()->json(['code' => 200, 'message' => 'Deduction saved successfully']);

        try {

            $input['user_id'] = $request->user;
            $input['ded_code'] = $request->code;
            $input['ded_no'] = $request->number;
            $input['ded_amount'] = $request->amount;
            $input['description'] = $request->description;


            Deduction::updateOrCreate(['id' => $request->deduction_id] ,$input);

            return response()->json(['code' => '200', 'description' => '200', 'status' => 'Deduction added successfully']);
        } catch (Throwable $e) {

            report($e);
            return response()->json(['code' => '500','description' => '500', 'status' => $e]);
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
        $deduction = Deduction::find($id);
        return response()->json($deduction);
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
        $deduction = Deduction::find($id);
        $deduction->delete();
    }
}

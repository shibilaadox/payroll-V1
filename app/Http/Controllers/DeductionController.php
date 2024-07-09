<?php

namespace App\Http\Controllers;

use App\Imports\DeductionsImport;
use Illuminate\Http\Request;
use App\Models\Deduction;
use App\Models\User;
use DataTables;
use Maatwebsite\Excel\Facades\Excel;

class DeductionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $deductions = Deduction::all();

        $data['deduction'] = Deduction::with('user')->get();
        $data['users'] = User::where('user_type','Employee')->get();
        return view('backend.deduction.index',['data'=>$data] , ['deductions' => $deductions]);
    }

    public function displayExcelData(Request $request)
    {
        $file = $request->file('file');
        $data = Excel::toArray([], $file);

        return view('backend.deduction.index', ['deductions' => $data[0]]);
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

            $input['user_id'] = $request->user;
            $input['type'] = $request->type;
            $input['name'] = $request->name;
            $input['amount'] = $request->amount;

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

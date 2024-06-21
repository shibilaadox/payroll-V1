<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Leave;
use DataTables;

class LeaveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data['leave'] = Leave::with('user')->orderBy('id','DESC')->get();
        return view('backend.leave.index', ['data' => $data]);
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
        $leave = Leave::find($id);
        $leave->delete();
    }

    public function leave_update_status()
    {
        $id = $_GET['id'];
        $status = $_GET['status'];
        $reason = "";
        $leave = Leave::findOrFail($id);
        
        if(!empty($_GET['reason']))
        {
            $reason =$_GET['reason'];
        }
        
        $leave->status = $status;
        $leave->reject_reason = $reason;

        if ($leave->save()) {
            toast('Leave Request Updated Successfully', 'success');
            return redirect()->route('leaves.index');
        } else {
            toast('Something went wrong', 'error');
            return redirect()->route('leave.index');
        }
    }

}



<?php

namespace Modules\AssetManagment\Http\Controllers;

use App\Models\MachineType;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class MachineTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        return view('assetmanagment::add_type');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    { 
        return view('assetmanagment::add_type');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $input = [
            'name' => $request->name
        ];
        $type = MachineType::create($input);
        if($type){
            $data= ['status' => 'success'];
            return $data;
        }
        else{
            $data= ['status' => 'error'];
            return $data;
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('assetmanagment::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('assetmanagment::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }
}

<?php

namespace Modules\AssetManagment\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use DataTables;
use App\Models\Asset;
use App\Models\MachineType;
use App\Models\Project;

class AssetManagmentController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $assets = Asset::join('projects','assets.project','projects.id')->get(); 
            return DataTables::of($assets)
                ->addIndexColumn()
                ->editColumn('name', function ($row) {
                    return $row->name;
                })
                ->editColumn('type', function ($row) {
                    return $row->machine_types->name;
                })
                ->editColumn('manufacturer', function ($row) {
                    return $row->manufacturer;
                })
                ->editColumn('model', function ($row) {
                    return $row->model;
                })
                ->editColumn('quantity', function ($row) {
                    return $row->sl_no;
                })
                ->editColumn('date', function ($row) {
                    return $row->date;
                })
                ->editColumn('status', function ($row) {
                    return $row->status;
                })

                ->addColumn('action', function ($row) {
                    $url = route('machines.edit', $row->id);
                    $btn = '<a class="btn btn-success" href="'.$url.'" type="button"><i class="nav-icon i-Pen-2 font-weight-bold"></i></a>';
                    $btn = $btn . '<button class="btn btn-danger ml-3" onclick="del_assets('.$row->id.')" type="button"><i class="nav-icon i-Close-Window font-weight-bold"></i></button>';

                    return $btn;
                })
                ->rawColumns(['action', 'title', 'description'])
                ->make(true);
        }
        return view('assetmanagment::all_machines');
    }


    public function create()
    {
        $machine_types = MachineType::all();
        
        $projects = Project::all();
        return view('assetmanagment::create',compact('machine_types','projects'));
    }

    public function store(Request $request)
    { 
        $input = $request->except('_token','row_id');
        $assets = Asset::UpdateOrCreate(['id'=>$request->row_id],$input);
        $data = [
            'status' => 'error'
        ];
        if ($assets) {
            $data = [
                'status' => 'success',
                'redirect'=>route('machines.index')
            ];
           
        }
            return $data;
        
    }


    public function show($id)
    {
        return view('assetmanagment::show');
    }


    public function edit($id)
    {
        $machine_types = MachineType::all();
        $projects = Project::all();
        $asset = Asset::find($id);
        return view('assetmanagment::create',compact('asset','machine_types','projects'));
    }


    public function update(Request $request, $id)
    {
        //
    }

    public function delete($id)
    {
        Asset::find($id)->delete();
        return 'success';
    }
}

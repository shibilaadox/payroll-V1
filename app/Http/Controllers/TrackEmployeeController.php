<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\TrackEmployee;
use App\Models\Location;

class TrackEmployeeController extends Controller
{
    public function index()
    {

        $data['users'] = TrackEmployee::with('user');
        if(isset($_GET['employee']) && $_GET['employee']!="" && $_GET['employee']!="All"){
        $data['users'] = $data['users']->where('user_id',$_GET['employee']);                       
        }
        $data['users'] = $data['users']->whereDate('created_at',date('Y-m-d'))->orderBy('id','DESC')->get();
        $data['all_users'] = User::where('status',0)->where('user_type','Employee')->get();
        $data['all_locations'] = Location::all();
        return view('backend.users.track', compact('data'));
    }
}

<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Status;
use App\Models\Timesheet;
use Illuminate\Support\Carbon;
use Illuminate\Support\Arr;

class UserController extends BaseController
{
    public function Get_employee_count()
    {
        
        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
        $present_id = array();
        $i=0;
        $present_count = 0;
        foreach($total_present_emp as $row)
        {
            $present_id[$i] = $row->user_id;
            $i++;
            
            $present_count++;
        }
        
        $present_users =  User::where('status',0)->whereIn('id',$present_id)->take(5)->get();
        
        $total_emp = User::where('user_type','Employee')->get();
        $total_emp_id = array();
        $i=0;
        foreach($total_emp as $row)
        {
            $total_emp_id[$i] = $row->id;
            $i++;
        }
        
        $absent_users = User::where('status',0)->whereIn('id',$total_emp_id)->whereNotIn('id',$present_id)->groupBy('id')->get();
        $absent_count = count($absent_users);
        
        $relieved_employee = User::where('status',1)->groupBy('id')->get();
        $relieved_count = count($relieved_employee);
         
        $data = array();
        $data['present_count'] = $present_count;
        $data['absent_count'] = $absent_count;
        $data['relieved_count'] = $relieved_count;
         
        return $this->sendResponse($data,"Success");
        
    }
    
    public function Get_employee_list(Request $request)
    {
        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
       
        $present_id = array();
        
        $i=0;
            
        foreach($total_present_emp as $row){
            $present_id[$i] = $row->user_id;
            $i++;
        }
            
            
        $total_emp = User::where('user_type','Employee')->get();
        $total_emp_id = array();
            
        $i=0;
        foreach($total_emp as $row){
            $total_emp_id[$i] = $row->id;
            $i++;
        }
            
            
        if($request->type == "present"){
            
            $users =  User::where('status',1)->with('userdetails')->with('timesheet:id,log')->whereIn('id',$present_id)->get();
           
        
        }else if($request->type == "absent"){
            
           $users = User::where('status',0)->with('userdetails')->with('timesheet:id,log')->whereIn('id',$total_emp_id)->whereNotIn('id',$present_id)->groupBy('id')->get();
           
        }else if($request->type == "relieved"){
            
            $users = User::where('status',1)->with('userdetails')->with('timesheet:id,log')->groupBy('id')->get();
        
        }else{
            
             $users = User::where('status',1)->with('userdetails')->with('timesheet:id,log')->groupBy('id')->get();
        }
         
        return $this->sendResponse($users,"Success");
    }
    
}

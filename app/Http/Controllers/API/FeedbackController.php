<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Status;
use App\Models\Timesheet;
use App\Models\Feedback;
use Illuminate\Support\Carbon;
use Illuminate\Support\Arr;

class FeedbackController extends BaseController
{
    public function Add_feedback(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
     
        
        $FeedbackType = $request->FeedbackType;
        
        $Feedbackmsg = $request->Feedbackmsg;
        
        
         
        
         Feedback::create([
                'user_id'=>$user_id,
                'date'=>date('Y-m-d'),
                'subject'=>$FeedbackType,
                'message'=>$Feedbackmsg,
                'status'=>'Pending',
            ]);
          
        $data = Feedback::where('user_id', $user_id)->orderBy('id','DESC')->first();
        return $this->sendResponse($data, "Success");
    }
    
    public function Add_leave_day(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        
        
        date_default_timezone_set('Asia/Kolkata'); 
        $timeofadd=date('h:i  A'); 
        $dateofadd=date("d/m/Y");
        
        
        $employee_id = $request->userid;
        $leave_type = 'Days';
        $start_date = $request->firstdate;
        $end_date = $request->enddate;
        
       
        if($end_date==""){
            $end_date=$start_date; 
            
        }
        $reason_leave = $request->reasonforl;
        $status = 'Pending';
         
  
         
        
         Leave::create([
                'employee_id'=>$employee_id,
                'hour_days'=>$leave_type,
                'start_date'=>$start_date,
                'end_date'=>$end_date,
                'reason'=>$reason_leave,
                'leave_status'=>$status,
                'added_date'=>$dateofadd,
                'added_time'=>$timeofadd
            ]);
          
        $data1 = Leave::where('employee_id', $employee_id)->orderBy('id','DESC')->first();
        return $this->sendResponse($data1, "Success");
    }
    public function Delete_Sticky(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $note = $request->note;
        $date = $request->date;
        
        $sticky = Leave::where('date', $date)->where('user_id', $user_id)->first();
        
        $old_data=$sticky->sticky_notes;
        $arr=json_decode($old_data,true);
            
        $data_to_rm=array('notes' => $note);
            
        array_except($arr,$data_to_rm);
        
        $arr = Arr::except($arr,$data_to_rm);
            
        $sticky_id=$sticky->id;
            
        $data=Leave::find($sticky_id);
            
        $data->update([
                     'user_id'=>$user_id,
                     'date'=>$date,
                     'sticky_notes' => $arr
                     ]);
        
        // $sticky = Leave::find($id);
        // if ($sticky) {
        //     $sticky->delete();
        //     return $this->sendResponse('', "Success");
        // } else {
        //     return $this->sendError('No sticky Found');
        // }
        
        $data1 = Leave::where('id', $sticky_id)->first();
        return $this->sendResponse($data1, "Success");
    }
     public function Edit_leave_hour(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        $leave_id_toedit = $request->leave_id_toedit;
         
         
        
        $employee_id =  $request->userid;
        
        
        
        $start_date = $request->firstdate;
        $time_start = $request->sth;
        $time_end = $request->eth;
        $reason = $request->reasonforl;
         
         
         
         
        $data=Leave::find($leave_id_toedit);
            
        $data->update([
                     'start_date'=>$start_date,
                     'time_start'=>$time_start,
                     'time_end' => $time_end,
                     'reason' => $reason
                     ]);
        $data1 = Leave::where('id', $leave_id_toedit)->first();
        return $this->sendResponse($data1, "Success");
    }
    public function Edit_leave_day(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        
        $leave_id_toedit = $request->leave_id_toedit;
         
         
        
        $employee_id = $request->userid;
        
        $start_date = $request->firstdate;
        $end_date = $request->enddate;
         
        $reason = $request->reasonforl;
        
        $data=Leave::find($leave_id_toedit);
            
        $data->update([
                     'start_date'=>$start_date,
                     'end_date'=>$end_date,
                     'reason' => $reason
                     ]);
        $data1 = Leave::where('id', $leave_id_toedit)->first();
        return $this->sendResponse($data1, "Success");
    }
    public function Get_leave(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        $user_type = auth('sanctum')->user()->user_type;
         
        
       
       if($user_type == "Admin"){
           $data=Leave::with('userdetails')->orderBy('id','desc')->get();
           
       }else{
           $data=Leave::with('userdetails')->where('employee_id',$user_id)->orderBy('id','desc')->get();
       }
        
        return $this->sendResponse($data,"");
        
    }
    public function Get_leave_by_id(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        $leave_id=$request->id;
         
        $data=Leave::with('userdetails')->where('leaves.id',$leave_id)->orderBy('leaves.id','desc')->first();
        return $this->sendResponse($data,"Success");
        
    }
    
}

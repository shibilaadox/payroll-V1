<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Status;
use App\Models\Timesheet;
use App\Models\StickyNotes;
use Illuminate\Support\Carbon;
use Illuminate\Support\Arr;

class StickeyController extends BaseController
{
    public function Add_Sticky(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $sticky_notes = $request->sticky_notes;
        $date = $request->date;
        
        $sticky_data[] = array('notes' => $sticky_notes,
            'date' => $date,
                     );
        $sticky_data_new = json_encode($sticky_data);
        
        $sticky = StickyNotes::where('date', $date)->where('user_id', $user_id)->first();
        if (empty($sticky)) 
        {
            StickyNotes::create([
                'user_id' => $user_id,
                'date' => $date,
                'sticky_notes' => $sticky_data_new,
            ]);
            
        }
        else 
        {
            $old_data=$sticky->sticky_notes;
            $arr=json_decode($old_data,true);
            
            $new_data=array('notes' => $sticky_notes,);
            
            array_push($arr,$new_data);
            
            $sticky_id=$sticky->id;
            
            $data=StickyNotes::find($sticky_id);
            
            $data->update([
                         'user_id'=>$user_id,
                         'date'=>$date,
                         'sticky_notes' => $arr
                         ]);
        }
        
        $data1 = StickyNotes::where('user_id', $user_id)->first();
        return $this->sendResponse($data1, "Success");
    }
    
    public function Delete_Sticky(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $note = $request->note;
        $date = $request->date;
        
        $sticky = StickyNotes::where('date', $date)->where('user_id', $user_id)->first();
        
        $old_data=$sticky->sticky_notes;
        $arr=json_decode($old_data,true);
            
        $data_to_rm=array('notes' => $note);
            
        array_except($arr,$data_to_rm);
        
        $arr = Arr::except($arr,$data_to_rm);
            
        $sticky_id=$sticky->id;
            
        $data=StickyNotes::find($sticky_id);
            
        $data->update([
                     'user_id'=>$user_id,
                     'date'=>$date,
                     'sticky_notes' => $arr
                     ]);
        
        // $sticky = StickyNotes::find($id);
        // if ($sticky) {
        //     $sticky->delete();
        //     return $this->sendResponse('', "Success");
        // } else {
        //     return $this->sendError('No sticky Found');
        // }
        
        $data1 = StickyNotes::where('id', $sticky_id)->first();
        return $this->sendResponse($data1, "Success");
    }
    public function Get_sticky(Request $request)
    {
        $date=$request->date;
        $data=StickyNotes::select('sticky_notes')->where('date',$date)->get();
        return $this->sendResponse($data,"");
        
    }
}

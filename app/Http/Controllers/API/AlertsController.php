<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\News;
use App\Models\User;
use App\Models\Firebase;


class AlertsController extends BaseController
{
    public function getAlerts()
    {
        
        $datas = News::orderBy('id','DESC')->get();
        
        $i=0;
        $data = array();
        foreach($datas as $row)
        {
            if($row->type=="notifications")
            $data[$i] = News::with('photos:id,file_name')->where('id',$row->id)->first();
            else
            $data[$i] = News::where('id',$row->id)->first();
            
            $i++;
            
        }
                           
        return $this->sendResponse($data,"Success");  
        
    }
    
   
}

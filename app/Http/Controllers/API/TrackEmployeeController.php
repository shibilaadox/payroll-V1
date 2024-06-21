<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\TrackEmployee;
use App\Models\Location;

class TrackEmployeeController extends BaseController
{
    public function storeLocation(Request $request)
	{
    
    	$user_id = auth('sanctum')->user()->id;
    	
    	$location = $request->location;
    	$date = $request->date;
    	
    	$user = User::where('id',$user_id)->first();
        
        $location_id = $user->location;
        
        $location_details = Location::where('id',$location_id)->first();
        
        $lat2 = (float)$location_details->lat;
        $lng2 = (float)$location_details->lng;
    	
    	$lat1 = (float)$request->latitude;
        $lng1 = (float)$request->longitude;
        
            
        $theta = $lng1 - $lng2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $distance = $miles * 1.609344;
        $distance = (float)number_format($distance,3);
        
        
        if($distance>1 && $user->office_employee==1)
        {
            TrackEmployee::create([
                'user_id'=>$user_id,
                'date'=>$date,
                'location'=>$location,
                ]);
            $data = "Not in office area";
            return $this->sendResponse($data,"Success");
        }
        
        else
        {
            TrackEmployee::create([
                'user_id'=>$user_id,
                'date'=>$date,
                'location'=>$location,
                ]);
            $data = TrackEmployee::where('user_id',$user_id)->where('date',$date)->first();
            return $this->sendResponse($data,"Success");
        }
    
    	
    
        // $to = "/topics/tracking-".$user_id;
    
        // $notification = array(
        
        // 'title'=> 'Bloomax',
        // 'body'=> 'Track Your Location',
        
        // );
    
        // $datapayload = array(
        
        // 'type'=>'tracking',
        // 'user_id'=>$user_id,
        // 'location'=>$location
        
        // );
    
        // $this->sendPushNotificationTracking($to,$notification,$datapayload);

        
        return $this->sendResponse($data,"Success");
    
	}
	
	function sendPushNotificationTracking($to,$notification,$datapayload) {
        
        $fields = array(
        'to'=>$to,
        'notification'=>$notification,
        'data'=>$datapayload,
        'priority' => 'high'
        
        );
        
        $serverKey = 'AAAAFm3fmHA:APA91bEE-m-AW_JMt5UeRu828tZklly4-DdDEzV5mVbVrkkGmShlHPwVNVzLqT176pOdR_f42SFH53umFZMLa_F9YGRvsRZL9dbZ7XJ2OlyFlq0sehJEzDDOE4K8RvUM58lOh27vCWdT';
        $headers = array(
        'Authorization: key='.$serverKey,
        'Content-Type: application/json'
        );
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        curl_close( $ch );
        
    }
    
    public function getLocation(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        $date = $request->date;
        $data = TrackEmployee::where('user_id',$user_id)->where('date',$date)->orderBy('id', 'desc')->first();
        return $this->sendResponse($data,"Success");
    }
    
    public function checkDistance()
    {
        $lat1 = (float)$_GET['latitude'];
        $lng1 = (float)$_GET['longitude'];
        
        $user_id = auth('sanctum')->user()->id;
    	
    	$user = User::where('id',$user_id)->first();
        
        $location_id = $user->location;
        
        $location_details = Location::where('id',$location_id)->first();
        
        $lat2 = (float)$location_details->lat;
        $lng2 = (float)$location_details->lng;
            
        $theta = $lng1 - $lng2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $distance = $miles * 1.609344;
        $distance = (float)number_format($distance,3);
        
        
        if($distance>=1 && $user->office_employee==0)
        {
            $data = "Not in office area";
            return $this->sendError($data);
        }
        
        else
        {
            $data = "Success";
            return $this->sendResponse($data,"Success");
        }
    }
    
    public function locationList()
    {
        $user_id = auth('sanctum')->user()->id;
        $datas = TrackEmployee::whereDate('created_at',date('Y-m-d'))->where('user_id',$user_id)->get();
        
        $i=0;
        foreach($datas as $row)
        {
            $data[$i] = $row->location;
            $i++;
        }
        return $this->sendResponse($data,"Success");
    }
}

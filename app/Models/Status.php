<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\TrackEmployee;

class Status extends Model
{
    use HasFactory;

    protected $fillable = [
      'user_id', 'status','date'
    ];
    
    public function status_out_notification()
    {
        $data = TrackEmployee::orderBy('id','DESC')->get()->unique('user_id');

        foreach($data as $row)
        {
            $lat_lng =json_decode($row['location'],true);
            $lat1 = (float)$lat_lng['latitude'];
            $lng1 = (float)$lat_lng['longitude'];
            
            $user = User::where('id',$row['user_id'])->first();
        
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
            
            if($distance>1 && $user->office_employee==1)
            {
                $user_id = $row->user_id;
                $status_data = Status::where('user_id',$user_id)->where('date',date('Y-m-d'))->first();
                $status_id =$status_data->id;
                $status = Status::find($status_id);

                $status->update([
                    'status' => 'Out'
                ]);    
            }

            $user_id =$row->user_id;
            $token_data = Firebase::where('user_id',$user_id)->first();
            $token =$token_data->token;
            $title = "Status Changed";
            $body = "Your status is changed to out because you are more than 1 kms away";
            $this->sendPushNotification($token,$title,$body);
        }
        
        
    }
    
    public function sendPushNotification($token,$title,$body) {
    
        $url = "https://fcm.googleapis.com/fcm/send";
        $serverKey = 'AAAADI7ef3Q:APA91bGQDRgYI8b3VUHeDvqAE7kXK7Qyv7GokYiwVipmHFNMn9OQ7mlEg8fKisCun7Erbb7Pt5imJioZTM-qlMh5WS5nQREZ9eR4OTZQbIFT9UrKtKbSnC5-Xkccw4wi41Xewkanu7ZT'; 
        $notification = array('title' =>$title , 'body' => $body, 'sound' => 'default', 'badge' => '1');
        $arrayToSend = array('to' => $token, 'notification' => $notification,'priority'=>'high');
        $json = json_encode($arrayToSend);
        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key='. $serverKey;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //Send the request
        $response = curl_exec($ch);
        //Close request
        curl_close($ch);
    }
}

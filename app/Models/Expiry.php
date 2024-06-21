<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expiry extends Model
{
    use HasFactory;
    protected $table = 'expiry_notifications';

    protected $fillable = [

        'user_id',
        'type',
        'expiry_date',
        'image',
        'number'
    ];
    
    public function passport_expiry_notification()
    {
        $data = Expiry::where('expiry_date', '<=', Carbon::now()->subDays(7)->toDateTimeString())->get();

        foreach($data as $row)
        {
            $user_id =$row->id;
            $token_data = Firebase::where('user_id',$user_id)->first();
            $token =$token_data->token;
            $expiry_date = $row->expiry_date;
            $type=$row->type;
            $title = $type."Getting Expired";
            $body = $type."will get expired on ".$expiry_date;
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

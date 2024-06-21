<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Firebase;
use Illuminate\Support\Facades\Auth;

class AuthController extends BaseController
{


   public function login(Request $request)
   {
        
        if (!Auth::attempt($request->only('email', 'password'))) {
            
            return $this->sendError("Invalid login details");
      
        }
        
        $api_token = $request->api_token;

        $user = User::where('email', $request['email'])->firstOrFail();
        
        $token = $user->createToken('auth_token')->plainTextToken;

        $user_id = $user->id;

        $user_details = User::where('users.id',$user_id)->with('userdetails')->first();

        $data['user_details'] = $user_details;
        $data['token'] = $user->createToken('auth_token')->plainTextToken;
        
        $api_token_user = Firebase::where('user_id', $user_id)->first(); 
                       
        if(!empty($api_token_user))
        {
            $api_token_id = $api_token_user->id;
            $api_token_data = Firebase::find($api_token_id);
            $api_token_data->token = $api_token;
            $api_token_data->save();

        }
        else
        {
            
            $api_token = Firebase::create([
                'token'=>$api_token,
                'user_id'=>$user_id,
            ]);
        }
      
        return $this->sendResponse($data,"Success");

    }

    public function forgot_password(Request $request)
    {

        $email=$request->email;

        $list = User::where('email',$email)->first();

        if($list){

             $login_type = $list->login_type;

             $url=url('password.email');
             $message="Please <i><a href='".$url."'> click this link </a></i> to reset password";
             $subject = "Reset  Password";
             $headers = "MIME-Version: 1.0" . "\r\n";
             $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
             mail($email,$subject,$message,$headers);
             $data=" Password recovery instruction has been sent to the email";


        } else{

         $data="This email id is not registered";

      }

      return response()->json($data);
    }
    
    public function getUserDetails()
    {
        $user_id = auth('sanctum')->user()->id;
        
        /*if(isset($_GET['latitude']) && isset($_GET['longitude']))
        {
        
            $user = User::where('id',$user_id)->first();
            $location = $user->location;
            $location_details = Location::where('id',$location)->first();
            
            $lat2 = (float)$_GET['latitude'];
            $lng2 = (float)$_GET['longitude'];
            $lat1 = (float)$location_details->lat;
            $lng1 = (float)$location_details->lng;
            
            $theta = $lng1 - $lng2;
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $miles = $dist * 60 * 1.1515;
            $distance = $miles * 1.609344;
            $distance = (float)number_format($distance,3);
            
            if($distance>1 && $user->office_employee==1)
            {
                $message = "Not in office area";
                return $this->sendError($message);    
            }
            
            else
            {
                $data = User::where('users.id',$user_id)->with('departments')->with('locations')->first();
        
                return $this->sendResponse($data,"Success");    
            }
            
        }
        
        else
        {*/
        
        $data = User::where('users.id',$user_id)->with('userdetails')->first();
        
        return $this->sendResponse($data,"Success");
        
        //}
    }

}

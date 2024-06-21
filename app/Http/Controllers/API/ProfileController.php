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
use Hash;
use Auth;

class ProfileController extends BaseController
{
    public function updateProfile(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        $array = ['name' => $request->name,
                  'email' => $request->email,
                  'phone'=>$request->phone,
                  'gender'=>$request->gender,
                  'dob'=>$request->dob,
                  'blood_group'=>$request->blood_group,
                  'marital_status'=>$request->marital_status,
                  'firstname'=>$request->firstname,
                  'lastname'=>$request->lastname,
                  'iqama'=>$request->iqama,
                  'passport_no'=>$request->passport_no,
                  'psprt_expiry_date'=>$request->psprt_expiry_date
                 ];
        
        User::where('id',$user_id)->update($array);
        
        $data = User::where('id',$user_id)->get();
        
        return $this->sendResponse($data,"Profile updated");
    }
    
    
    public function updateImage(Request $request)
    {
    
        $user_id = auth('sanctum')->user()->id;
      
        if(!$request->hasFile('fileName')) {
            return response()->json(['upload_file_not_found'], 400);
        }

        $allowedfileExtension=['jpeg','jpg','png','JPEG','PNG','JPG'];
        $files = $request->file('fileName'); 
        
        $errors = [];

        $extension = $files->getClientOriginalExtension();
   
        $check = in_array($extension,$allowedfileExtension);

        if($check) {
                       
            $name ="/public/uploads/".date('mdYHis').$files->getClientOriginalName();
            $destinationPath = base_path().'/public/uploads';
            $files->move($destinationPath, $name);
            
        } else {
            
            return response()->json(['invalid_file_format'], 422);
        }
        
        $array=['profile_photo'=>$name];
        User::where('id',$user_id)->update($array);
        $data = User::where('id',$user_id)->get();

        return $this->sendResponse($data,"Image updated");
      
    }
    
    
    public function changePassword(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;
        
        $data = User::select('password')->where('id',$user_id)->first();
        $password_db = $data->password;
       
        if (!(Hash::check($request->get('current_password'), $password_db))) {
    
            return $this->sendError("Your current password does not matches with the password.");
        }
        
        else{
            
            $user = Auth::user();
            $user->password = bcrypt($request->get('new_password'));
            $user->save();
            return $this->sendResponse("","password changed");
        }
       
    }
      
      
  }
    
    


<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Expiry;

class ExpiryController extends BaseController
{
    public function addOrEditExpiry(Request $request)
    {
          $input =[
            'user_id' => auth('sanctum')->user()->id,
            'type' => $request->type,
            'expiry_date' => $request->expiry_date ,
            // 'image' =>  $request->image ,
            'number' =>  $request->number ,
        ];
        
       
        $Expiry=Expiry::updateOrCreate(['id' => $request->id], $input);
        
        $data = Expiry::where('id',$Expiry->id)->first();
        return $this->sendResponse($data, "Success");
    }
    public function delete_Expiry(Request $request)
    {
        $id = $request->id;
        Expiry::destroy($id);
        return $this->sendResponse("Successfully removed data","Success");
    }
    
    public function get_Expirydata()
    {
        $data = Expiry::select('*')->orderBy('id','desc')->get();;
        return $this->sendResponse($data, "Success");
    }
    
   
}

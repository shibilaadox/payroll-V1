<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;
use App\Models\User;
use App\Models\Firebase;
use DataTables;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $news = News::all();
             return DataTables::of($news)
                ->addIndexColumn()
                ->addColumn('image', function ($row) {
                    if ($row->photo) {
                        $url =  image_preview($row->photo);
                        return $url;
                    } else {
                        return '';
                    }
                })
                ->addColumn('action', function ($row) {

                    $btn = '<button class="btn btn-success" onclick="edit_news('.$row->id.')" type="button"><i class="nav-icon i-Pen-2 font-weight-bold"></i></button>';
                    $btn = $btn . '<button class="btn btn-danger ml-3" onclick="delete_news('.$row->id.')" type="button"><i class="nav-icon i-Close-Window font-weight-bold"></i></button>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.news.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {

            $input['heading'] = $request->heading;
            $input['content'] = $request->news;
            $input['type'] = $request->type;
            $input['photo'] = $request->photos;
            
            News::updateOrCreate(['id' => $request->news_id] ,$input);
            
            $datas = News::where('status',0)->where('type','notifications')->orderBy('id','DESC')->get();
            
            foreach($datas as $row){
                
                $data_user = User::where('status',0)->get();

                foreach($data_user as $rows)
                {
                    $user_id =$rows->id;
                    $token_data = Firebase::where('user_id',$user_id)->first();
                    if(!empty($token_data) && $row->status==0){
                    $token =$token_data->token;
                    $title = $row->type;
                    $body = $row->content;
                    $this->sendPushNotification($token,$title,$body);
                    $array=['status'=>1];
                    News::where('id',$row->id)->update($array);
                    }
                }
            }

            return response()->json(['code' => '200', 'status' => 'Added successfully']);
        } catch (Throwable $e) {

            report($e);
            return response()->json(['code' => '500', 'status' => $e]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $news = News::find($id);
        return response()->json($news);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $news = News::find($id);
        $news->delete();
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

<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Status;
use App\Models\Timesheet;
use App\Models\Location;
use App\Models\StickyNotes;
use Illuminate\Support\Carbon;

class TimesheetController extends BaseController
{
    // redirect to user_timesheet
    public function index(){
        $data = User::all();
        $timesheet = User::all();
        return view('backend.users.user_timesheet', compact('data','timesheet'));
    }

    public function updateAttendance(Request $request)
    {
        $user_id = auth('sanctum')->user()->id;

        $user = User::where('id', $user_id)->first();

        $time = $request->time;
        $status = $request->status;
        $lat = (float)$request->lat;
        $lng = (float)$request->lng;
        $date = $request->date; 

        $post_data[] = array(
            'status' => $status,
            'time' => $time,
            'latitude' => $lat,
            'longitude' => $lng,
        );

        $post_data_new = json_encode($post_data);

        $attendance = Timesheet::where('date', $date)->where('user_id', $user_id)->first();

        if (empty($attendance)) {
            if ($status == "Out") {
                $last_attendance = Timesheet::where('user_id', $user_id)->orderBy('id', 'DESC')->first();
                $status_now = $last_attendance->log;
                $arr = json_decode($status_now, true);
                $new_data = array(
                    'status' => $status,
                    'time' => $time,
                    'latitude' => $lat,
                    'longitude' => $lng,
                );
                array_push($arr, $new_data);

                $timesheet_id = $last_attendance->id;
                $timesheet = Timesheet::find($timesheet_id);

                $timesheet->update([
                    'user_id' => $user_id,
                    'log' => $arr,
                    'date' => $date,
                    'time' => $time,
                    'latitude' => $lat,
                    'longitude' => $lng
                ]);
            } else {
                Timesheet::create([
                    'user_id' => $user_id,
                    'log' => $post_data_new,
                    'date' => $date,
                    'time' => $time,
                    'latitude' => $lat,
                    'longitude' => $lng
                ]);
            }
        } else {

            $status_now = $attendance->log;
            $arr = json_decode($status_now, true);
            $new_data = array(
                'status' => $status,
                'time' => $time,
                'latitude' => $lat,
                'longitude' => $lng,
            );
            array_push($arr, $new_data);

            $timesheet_id = $attendance->id;
            $timesheet = Timesheet::find($timesheet_id);

            $timesheet->update([
                'user_id' => $user_id,
                'log' => $arr,
                'date' => $date,
                'time' => $time,
                'latitude' => $lat,
                'longitude' => $lng
            ]);
        }

        $id = Status::where('user_id', $user_id)->first();

        if (empty($id)) {
            Status::create([
                'user_id' => $user_id,
                'status' => $request->status,
                'date' => $date
            ]);
        } else {
            $status_id = $id->id;
            $status = Status::find($status_id);

            $status->update([
                'user_id' => $user_id,
                'status' => $request->status,
                'date' => $date
            ]);
        }

        $data = Timesheet::where('user_id', $user_id)->orderBy('id', 'DESC')->first();
        return $this->sendResponse($data, "Success");
    }

    public function getLog()
    {
        $user_id = auth('sanctum')->user()->id;

        $log_data = Timesheet::where('user_id', $user_id)->orderBy('id', 'DESC')->first();

        if (!empty($log_data)) {
            $data = json_decode($log_data->log, true);
            $last = end($data);
            return $this->sendResponse($last, "Success");
        } else {
            date_default_timezone_set('Asia/kolkata');
            $data = array(
                'status' => "Out",
                'time' => date("h:i:s"),
            );

            return $this->sendResponse($data, "Success");
        }
    }

    public function getAllLogs()
    {
        $user_id = auth('sanctum')->user()->id;

        $datas = Timesheet::select('*')->where('user_id', $user_id)->orderBy('id', 'DESC')->get();
        $data = [];
        if (!empty($datas)) {
            $i = 0;
            foreach ($datas as $row) {
                $data[$i]['id'] = $row->id;
                $data[$i]['user_id'] = $row->user_id;
                $data[$i]['date'] = $row->date;

                $log = json_decode($row->log, true);

                $first = $log[0]['time'];
                $last = end($log);

                $logs = array();
                $logs['time_in'] = $first;

                if ($last['status'] == "Out")
                    $logs['time_out'] = $last['time'];

                else
                    $logs['time_out'] = '';


                $data[$i]['log'] = $logs;
                $data[$i]['time'] = $row->time;

                $i++;
            }
        } else {

            date_default_timezone_set('Asia/kolkata');
            $data = array(
                'status' => "Out",
                'time' => date("h:i:s"),
            );
        }

        return $this->sendResponse($data, "Success");
    }

    public function homeCount()
    {
        $user_id = auth('sanctum')->user()->id;
        $data['attendance'] = Timesheet::whereMonth('date', Carbon::now()->month)->where('user_id', $user_id)->count();
        $last_updated_date = User::select('updated_at')->where('id', $user_id)->first();
        $data['last_updated_date'] = $last_updated_date->updated_at;
        $working_days = $this->countDays(date('Y'), date('m'), array(0, 6));
        $data['working_days'] = $working_days;
        //$data['leave'] = $working_days-$data['attendance'];
        $data['leave'] = 0;
        $data['total_leave'] = 0;
        $data['sticky_note'] = StickyNotes::where('user_id', $user_id)->count();
        $data['late'] = 5;
        $data['on_time'] = $working_days - 5;
        $data['working_hrs'] = $working_days * 8;
        $data['profile_complete_perc'] = 73;
        return $this->sendResponse($data, "Success");
    }

    function countDays($year, $month, $ignore)
    {
        $count = 0;
        $counter = mktime(0, 0, 0, $month, 1, $year);
        while (date("n", $counter) == $month) {
            if (in_array(date("w", $counter), $ignore) == false) {
                $count++;
            }
            $counter = strtotime("+1 day", $counter);
        }
        return $count;
    }

    public function getLogByDate(Request $request)
    {
        $date = $request->date;
        $user_id = auth('sanctum')->user()->id;
        $data = Timesheet::select('*')
            ->whereDate('date', $date)
            //   ->where('date',$date)
            ->where('user_id', $user_id)
            ->get();

        return $this->sendResponse($data, "Success");
    }

    public function Get_complete_log()
    {
        $data = array();
        $user_id = auth('sanctum')->user()->id;
        $user_type = auth('sanctum')->user()->user_type;
        // echo $user_type;
        // exit;


        if ($user_type == "Admin") {
            $datas = Timesheet::select('*')->with('user:id,firstname')->orderBy('id', 'DESC')->get();
        } else {
            $datas = Timesheet::select('*')->where('user_id', $user_id)->with('user:id,firstname')->orderBy('id', 'DESC')->get();
        }



        if (!empty($datas)) {
            $i = 0;
            foreach ($datas as $row) {
                $data[$i]['id'] = $row->id;
                $data[$i]['user_id'] = $row->user_id;
                $data[$i]['date'] = $row->date;
                $data[$i]['user']=$row->user->firstname;

                $log = json_decode($row->log, true);

                $first = $log[0]['time'];
                $last = end($log);

                $logs = array();
                $logs['time_in'] = $first;

                if ($last['status'] == "Out")
                    $logs['time_out'] = $last['time'];

                else
                    $logs['time_out'] = '';


                $data[$i]['log'] = $logs;
                $data[$i]['time'] = $row->time;

                $i++;
            }
        } else {
            date_default_timezone_set('Asia/kolkata');
            $data = array(
                'status' => "Out",
                'time' => date("h:i:s"),
            );
        }

        return $this->sendResponse($data, "Success");
    }
}

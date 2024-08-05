<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Status;
use App\Models\Department;
use App\Models\Project;
use Carbon\Carbon;
use DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $data['total_employees'] = User::where('status',1)->where('user_type','Employee')->count();
        $data['total_departments'] = Department::count();
        $data['total_present'] = Status::where('date', date('Y-m-d'))->count();
        $data['total_absent'] = $data['total_employees'] - $data['total_present'];
        $data['new_users'] = User::where('status',1)->get();

        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
        $present_id = array();
        $i=0;
        foreach($total_present_emp as $row)
        {
            $present_id[$i] = $row->user_id;
            $i++;
        }

        $data['present_employees'] = User::where('status',1)->whereIn('id',$present_id)->get();

        $total_emp = User::where('status',0)->where('user_type','Employee')->get();
        $total_emp_id = array();
        $i=0;
        foreach($total_emp as $row)
        {
            $total_emp_id[$i] = $row->id;
            $i++;
        }

        $data['total_absent_emp'] = User::where('status',1)->whereIn('id',$total_emp_id)->whereNotIn('id',$present_id)->groupBy('id')->get();

        for ($i = 0; $i <= 5; $i++)
        {
            $monthly_attendance[] = Status::whereMonth('date',date("m", strtotime( date( 'Y-m-01' )." -$i months")))->count();
        }

        for ($j=5,$m=0; $j>=0,$m<=5; $j--,$m++)
        {
            $result1[$m]['values'] = $monthly_attendance[$j];
            $result1[$m]['text'] = date("F", strtotime( date( 'Y-m-01' )." -$j months"));
        }

        $data['monthly_attendance'] = json_encode($result1);

        $date_array = array();
        $absent_count = array();

        $i = 0;
        while ($i < 7) {
            $today = Carbon::today();
            array_push( $date_array, $today->subDays($i)->format('d-m-y') );
            $i++;
        }

        $j=0;
        if(! empty( $date_array ) ){
            foreach($date_array as $date){
                $total_present = Status::where('date', $date)->count();
                //$total_absent = $data['total_employees'] - $total_present;
                $absent_count[$j] = $data['total_employees'] - $total_present;
                //$absent_count = [5,2,3,1,1,4,3];
                $j++;
            }
        }

        $absent_7days = array();

        $i = 0;
        while ($i < 7) {
            $absent_7days[$i]['text'] = [$date_array[$i]];
            $absent_7days[$i]['values'] = $absent_count[$i];
            $i++;
        }

        $data['absent_7days']= json_encode($absent_7days);

        $i=0;
        $date = date('F Y');//Current Month Year

        while (strtotime($date) < strtotime(date('Y-m') . '-' . date('t', strtotime($date)))) {
            $date = date("Y-m-d", strtotime("+1 day", strtotime($date)));//Adds 1 day onto current date
            $date1 = date("m-d", strtotime("-1 day", strtotime($date)));//Adds 1 day onto current date
            $total_present = Status::where('date', $date)->count();
            $total_absent = $data['total_employees'] - $total_present;
            $result[$i]['label'] = $date1;
            $result[$i]['value'] = $total_absent;
            $i++;
        }

        $data['absentee_month'] = json_encode($result);

        $k=0;
        $data_gender = array();
        $data['gender_count'] = User::select(DB::raw("count(gender) as gender_count"),'users.gender')->groupBy('gender')->get();

        foreach($data['gender_count'] as $row){

            $data_gender[$k]['values'] = [$row->gender_count];
            $data_gender[$k]['text'] = $row->gender;
            $k++;
        }

        $data['gender_counts']= json_encode($data_gender);

        $users = User::where('user_type','Employee')->get();

        $age_20_30 = 0;
        $age_30_40 = 0;
        $age_40_50 = 0;
        $age_50_60 = 0;

        foreach($users as $row)
        {

            $dateOfBirth = Carbon::createFromFormat('d/m/Y', $row->dob)->format('Y-m-d');
            $years = \Carbon::parse($dateOfBirth)->age;

            if($years>=20 && $years<30)
            $age_20_30++;

            else if($years>=30 && $years<40)
            $age_30_40++;

            else if($years>=40 && $years<50)
            $age_40_50++;

            else if($years>=50 && $years<60)
            $age_50_60++;

        }

        $data_age_group = array();

        $data_age_group[0]['values'] = [$age_20_30];

        $data_age_group[1]['values'] = [$age_30_40];

        $data_age_group[2]['values'] = [$age_40_50];

        $data_age_group[3]['values'] = [$age_50_60];

        $data['age_group']= json_encode($data_age_group);

        $data['employee_departments'] = User::leftJoin('userdetails', 'userdetails.user_id', '=', 'users.id')->join('departments', 'userdetails.department', '=', 'departments.id')->select(DB::raw("count(department) as count"),'departments.name as dep_name')->groupBy('department')->get();

        $m=0;
        $data_employee_department = array();
        foreach($data['employee_departments'] as $row){

            $data_employee_department[$m]['values'] = $row->count;
            $data_employee_department[$m]['text'] = $row->dep_name;
            $m++;
        }

        $data['employee_department'] = json_encode($data_employee_department);

        $totalClients = Client::count();
        $totalProjects = Project::count();
        return view('dashboard.dashboardv1',['data'=>$data], compact('totalClients','totalProjects'));
    }
}

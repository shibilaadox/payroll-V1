<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Deduction;
use App\Models\Department;
use App\Models\EmployeeProject;
use App\Models\Rate;
use App\Models\Roles;
use App\Models\User;
use App\Models\Status;
use App\Models\Timesheet;
use App\Models\StickyNotes;
use Illuminate\Support\Carbon;
use Hash;
use Auth;
use Illuminate\Support\Facades\DB;

class ProfileController extends BaseController
{

    public function show($id)
    {
        // Find the EmployeeProject by ID
        $employeeProject = EmployeeProject::findOrFail($id);

        // Get the associated user (employee) details
        $employee = $employeeProject->user;

        // Get userdetails for the employee
        $userdetails = DB::table('userdetails')->where('user_id', $employee->id)->first();

        // Get userdetails for the employee
        $useraddresses = DB::table('useraddresses')->where('user_id', $employee->id)->first();

        // Get the department details
        $departments = Department::find($userdetails->department);

        // Pass the employee data to the view
        return view('backend.project.employeedetails', compact('employee', 'userdetails','useraddresses', 'departments', 'employeeProject'));
    }

    public function invoice($project_id)
    {
            $employeeProject = EmployeeProject::findOrFail($project_id);
            $id = $employeeProject->user_id;
            $user_id = $employeeProject->user_id;

            $data['employee'] = User::with('userdetails')->with('user_timesheet_hourly')->has('user_timesheet_hourly')->whereHas('user_timesheet_hourly', function ($query) {

                return $query->where('month',date('m',strtotime("-1 month")));

            })->where('id',$id)->first();

            if(!empty($data['employee'])){

            $j = 0 ;$TOTAL_GP = 0; $no_8_days = 0;$NET_PAY = 0;$TOTAL_RP = 0;$DEDUCTIONS = 0;$EMSSS=0;$TOTAL_ND=0;$TOTAL_OT=0;

                                            foreach($data['employee']->user_timesheet_hourly as $row){

                                                $j++;

                                                if($j==1)
                                                $start_date = $row->date;

                                                $end_date = $row->date;

                                                $data['clientcd'] = $row->clientcd;

                                                $data['posicode'] = $row->posicode;

                                                $day8_rate = $employeeProject->payment;

                                                $no_8_days = $no_8_days + $row->day8;

                                                $RegP = $row->day8*$day8_rate;

                                                $TOTAL_RP = $TOTAL_RP+$RegP;

                                                if($row->day12==4)
                                                $Pay12 = $row->day12_rate-$RegP;
                                                else
                                                $Pay12 = $day8_rate*$row->day12;

                                                $UA = $row->undertime * ($day8_rate/60);

                                                $ot1 = $row->ot1_hrs;
                                                $ot2 = $row->o21_hrs;
                                                $ot3 = $row->ot3_hrs;
                                                $ot4 = $row->ot4_hrs;
                                                $ot5 = $row->ot5_hrs;
                                                $ot6 = $row->ot6_hrs;
                                                $ot7 = $row->ot7_hrs;
                                                $ot8 = $row->ot8_hrs;
                                                $ot9 = $row->ot9_hrs;
                                                $ot10 = $row->ot10_hrs;
                                                $ot11 = $row->ot11_hrs;
                                                $ot12 = $row->ot12_hrs;
                                                $ot13 = $row->ot13_hrs;

                                                $OT_total = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;

                                                $OT_premium = $day8_rate * 1.25;

                                                $OT = $OT_total * $OT_premium;

                                                $role = $row->posicode;

                                                $rate_data = Rate::where('position',$role)->first();

                                                $ND_rate = $rate_data->nd;

                                                $COLA_rate = $rate_data->cola;

                                                $COLA = $COLA_rate * $j;

                                                $ND = $ND_rate * $row->nd_days;

                                                $TOTAL_ND = $TOTAL_ND + $ND;

                                                $TOTAL_OT = $TOTAL_OT + $OT;

                                                $SI = $row->incentive;

                                                $GP = $RegP + $ND + $OT+$COLA + $SI - $UA;

                                                $role_data = Roles::where('name',$role)->first();
                                                $EMPH_per = $role_data->philhealth;

                                                if($GP<10000)
                                                $EMPH = 500;
                                                else if($GP>10000.01 && $GP<99999.99)
                                                $EMPH = $GP * $EMPH_per;
                                                else
                                                $EMPH = 5000;


                                                $EMHDMF_per = $role_data->hdmf;
                                                if($GP<1500)
                                                $EMHDMF = $GP * $EMHDMF_per;
                                                else
                                                $EMHDMF = 200;

                                                if($GP<=4250)
                                                $EMSSS = 180;
                                                else if($GP>4250 && $GP<4749.99)
                                                $EMSSS = 202.50;
                                                else if($GP>4749.99 && $GP<5249.99)
                                                $EMSSS = 225.00;
                                                else if($GP>5249.99 && $GP<5749.99)
                                                $EMSSS = 247.50;
                                                else if($GP>5749.99 && $GP<6249.99)
                                                $EMSSS = 270.00;

                                                //$taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;

                                                $TOTAL_GP = $TOTAL_GP + $GP;

                                                $deductions = $EMPH+$EMHDMF+$EMSSS;

                                                $taxable_income = $TOTAL_GP - $deductions;

                                                if($taxable_income<=20833)
                                                $tax = 0;
                                                else if($taxable_income>20833 && $GP<33332)
                                                $tax = 0;
                                                else if($taxable_income>33333 && $GP<66666)
                                                $tax = 1875;
                                                else if($taxable_income>66666 && $GP<166666)
                                                $tax = 8541.80;

                                              }

            if(isset($_GET['month']) && $_GET['month']!="")
                $deduction = Deduction::where('user_id',$id)->whereMonth('created_at',$_GET['month'])->sum('ded_amount');
            else
                $deduction = Deduction::where('user_id',$id)->whereMonth('created_at',Carbon::now()->month-1)->sum('ded_amount');

            $data['net_pay'] = $NET_PAY;
            $data['paid_days'] = $no_8_days;
            $data['gross_pay']= $TOTAL_GP;
            $data['deduction'] = $deduction;
            $data['net_pay'] = $TOTAL_GP - $deductions - $tax;
            $data['EMHMDF'] = $EMHDMF;
            $data['EMPH'] = $EMPH;
            $data['EMSSS'] = $EMSSS;
            $data['tax'] = $tax;
            $data['deduction_total'] = $deductions;
            $data['start_date'] = $start_date;
            $data['end_date'] = $end_date;
            $data['night_diff'] = $TOTAL_ND;
            $data['overtime'] = $TOTAL_OT;
            $data['TOTAL_RP'] = $TOTAL_RP;
            //return view('backend.payroll_hourly.payroll_ajax',['data'=>$data]);
            $view = \View::make('pdf.payslip',compact('data'));
        $html = $view->render();

        $pdf = new TCPDf();
        $pdf::SetTitle('INVOICE');
        $pdf::AddPage();
        $pdf::writeHTML($html, true, false, true, false, '');
        $pdf::Output('hello_world.pdf');

        }


        $user_id = $employeeProject->user_id;

    // Fetch employee details and timesheet data
    $employee = User::with(['userdetails', 'user_timesheet_hourly'])
        ->where('id', $user_id)
        ->whereHas('user_timesheet_hourly', function ($query) {
            return $query->where('month', date('m', strtotime("-1 month")));
        })->first();

    if ($employee) {
        // Payroll calculations...
        $TOTAL_GP = 0; // Example gross pay
        $NO_8_DAYS = 0; // Example days worked

        foreach ($employee->user_timesheet_hourly as $timesheet) {
            $regularPay = $timesheet->day8 * $employeeProject->payment;
            $TOTAL_GP += $regularPay;
            $NO_8_DAYS += $timesheet->day8;
        }

        // Return payslip data
        return view('backend.project.payslip', [
            'employee' => $employee,
            'gross_pay' => $TOTAL_GP,
            'paid_days' => $NO_8_DAYS,
        ]);
    }

    return abort(404, 'Employee not found');


    }

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




<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Models\EmployeeProject;
use App\Models\User;
use App\Models\Rate;
use App\Models\Roles;
use App\Models\Deduction;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Elibyy\TCPDF\Facades\TCPDF;
use Carbon;

class DetailsEmployeeController extends Controller
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
        return view('backend.project.employeedetails', compact('employee', 'userdetails', 'useraddresses', 'departments', 'employeeProject'));
    }

    public function invoice($project_id)
    {
        $employeeProject = EmployeeProject::findOrFail($project_id);
        $id = $employeeProject->user_id;

        $data['employee'] = User::with('userdetails')->with('usertimesheet')->has('usertimesheet')->whereHas('usertimesheet', function ($query) {

            return $query->where('month', date('m', strtotime("-1 month")));
        })->where('id', $id)->first();

        if (!empty($data['employee'])) {

            $j = 0;
            $TOTAL_GP = 0;
            $no_8_days = 0;
            $NET_PAY = 0;
            $TOTAL_RP = 0;
            $DEDUCTIONS = 0;
            $EMSSS = 0;
            $TOTAL_ND = 0;
            $TOTAL_OT = 0;

            foreach ($data['employee']->usertimesheet as $row) {

                $j++;

                if ($j == 1)
                    $start_date = $row->date;

                $end_date = $row->date;

                $data['clientcd'] = $row->clientcd;

                $data['posicode'] = $row->posicode;

                $day8_rate = $employeeProject->payment;

                $no_8_days = $no_8_days + $row->day8;

                $RegP = $row->day8 * $day8_rate;

                $TOTAL_RP = $TOTAL_RP + $RegP;

                if ($row->day12 == 4)
                    $Pay12 = $row->day12_rate - $RegP;
                else
                    $Pay12 = $day8_rate * $row->day12;

                $UA = $row->undertime * ($day8_rate / 60);

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

                $OT_total = $ot1 + $ot2 + $ot3 + $ot4 + $ot5 + $ot6 + $ot7 + $ot8 + $ot9 + $ot10 + $ot11 + $ot12 + $ot13;

                $OT_premium = $day8_rate * 1.25;

                $OT = $OT_total * $OT_premium;

                $role = $row->posicode;

                $rate_data = Rate::where('position', $role)->first();

                $ND_rate = $rate_data->nd;

                $COLA_rate = $rate_data->cola;

                $COLA = $COLA_rate * $j;

                $ND = $ND_rate * $row->nd_days;

                $TOTAL_ND = $TOTAL_ND + $ND;

                $TOTAL_OT = $TOTAL_OT + $OT;

                $SI = $row->incentive;

                $GP = $RegP + $ND + $OT + $COLA + $SI - $UA;

                $role_data = Roles::where('name', $role)->first();
                $EMPH_per = $role_data->philhealth;

                if ($GP < 10000)
                    $EMPH = 500;
                else if ($GP > 10000.01 && $GP < 99999.99)
                    $EMPH = $GP * $EMPH_per;
                else
                    $EMPH = 5000;


                $EMHDMF_per = $role_data->hdmf;
                if ($GP < 1500)
                    $EMHDMF = $GP * $EMHDMF_per;
                else
                    $EMHDMF = 200;

                if ($GP <= 4250)
                    $EMSSS = 180;
                else if ($GP > 4250 && $GP < 4749.99)
                    $EMSSS = 202.50;
                else if ($GP > 4749.99 && $GP < 5249.99)
                    $EMSSS = 225.00;
                else if ($GP > 5249.99 && $GP < 5749.99)
                    $EMSSS = 247.50;
                else if ($GP > 5749.99 && $GP < 6249.99)
                    $EMSSS = 270.00;

                //$taxable_income = $RegP + $Pay12 + $ot1 + $ot2+$ot3+$ot4+$ot5+$SI+$ND-$EMHDMF-$EMPH-$EMSSS;

                $TOTAL_GP = $TOTAL_GP + $GP;

                $deductions = $EMPH + $EMHDMF + $EMSSS;

                $taxable_income = $TOTAL_GP - $deductions;

                if ($taxable_income <= 20833)
                    $tax = 0;
                else if ($taxable_income > 20833 && $GP < 33332)
                    $tax = 0;
                else if ($taxable_income > 33333 && $GP < 66666)
                    $tax = 1875;
                else if ($taxable_income > 66666 && $GP < 166666)
                    $tax = 8541.80;
            }

            if (isset($_GET['month']) && $_GET['month'] != "")
                $deduction = Deduction::where('user_id', $id)->whereMonth('created_at', $_GET['month'])->sum('ded_amount');
            else
                $deduction = Deduction::where('user_id', $id)->whereMonth('created_at', Carbon::now()->month - 1)->sum('ded_amount');

            $data['net_pay'] = $NET_PAY;
            $data['paid_days'] = $no_8_days;
            $data['gross_pay'] = $TOTAL_GP;
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
            $view = \View::make('pdf.payslip', compact('data'));
            $html = $view->render();

            $pdf = new TCPDF();
            $pdf::SetTitle('INVOICE');
            $pdf::AddPage();
            $pdf::writeHTML($html, true, false, true, false, '');
            $pdf::Output('hello_world.pdf');
        }
    }
}

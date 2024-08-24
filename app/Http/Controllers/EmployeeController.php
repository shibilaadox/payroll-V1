<?php

namespace App\Http\Controllers;

use App\Models\Roles;
use App\Models\User;
use App\Models\Department;
use App\Models\Designation;
use App\Models\Location;
use App\Models\Status;
use App\Models\Useraddress;
use App\Models\Userdetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Toaster;

class EmployeeController extends Controller
{

    public function index()
    {

        $data['users'] = User::with('userdetails')->where('user_type','Employee')->where('status',1)->get();

        return view('backend.employee.index', ['data' => $data]);

    }

    public function create()
    {
        $roles = Roles::all();
        $departments = Department::all();
        $locations = Location::all();
        $designations = Designation::all();
        return view('backend.employee.create', compact('roles','departments','locations','designations'));
    }

    public function store(Request $request)
    {

        if (User::where('email', $request->email)->first() == null) {
            $user =  new User;
            if($request->file('imgfile'))
            {

                $image = $request->file('imgfile');
                $img_name = url('')."/uploads/".date('mdYHis').$image->getClientOriginalName();
                $destinationPath = base_path().'/public/uploads';
                $image->move($destinationPath, $img_name);
            }

            else
            {
                $img_name = url('')."/images/Capture.png";
            }

            $user->employee_code = $request->employee_code;
            $user->name = $request->first_name." ".$request->last_name;
            $user->email = $request->email;
            $user->user_type = 'Employee';
            $user->phone = $request->phone;
            $user->job_role = $request->job_role;
            $user->gender = $request->gender;
            $user->dob = $request->dob;
            $user->firstname = $request->first_name;
            $user->lastname = $request->last_name;
            $user->status = $request->status;
            $user->profile_photo = $img_name;

            $user->save();
            $id = $user->id;




            $user_detail =  new Userdetail;
            $user_detail->user_id = $id;
            $user_detail->adhaar_no = $request->aadhaar_no;
            $user_detail->designation = $request->designation_name;
            $user_detail->department = $request->department_name;

            $user_detail->academic_qualification = $request->education_details;
            $user_detail->experience_certificate = $request->work_experience;
            $user_detail->contract_starting_date = $request->contract_starting_date;
            $user_detail->contract_ending_date = $request->contract_ending_date;
            $user_detail->reason_for_leaving = $request->reason_for_leaving;
            $user_detail->blood_group = $request->blood_group;
            $user_detail->marital_status = $request->marital_status;
            $user_detail->joining_date = $request->joining_date;
            $user_detail->pan_no = $request->pan_no;
            $user_detail->emergency_no = $request->emergency;
            $user_detail->basic_salary = $request->monthly_basic;
            $user_detail->annual_ctc_details = $request->annual_ctc;
            $user_detail->salary_pay_type = $request->pay_type;
            $user_detail->regular_rate_for = $request->regular_rate;
            $user_detail->house_rent_allowance = $request->monthly_house_rent;
            $user_detail->conveyance_allowance = $request->monthly_conveyance;
            $user_detail->fixed_allowance = $request->monthly_fixed;
            $user_detail->location = $request->location_name;

            $user_detail->save();


            $user_address =  new Useraddress;
            $user_address->user_id = $id;
            $user_address->residential_address = $request->present_address;
            $user_address->residential_city = $request->present_city;
            $user_address->residential_state = $request->present_state;
            $user_address->residential_country = $request->present_country;
            $user_address->residential_pincode = $request->present_pincode;
            $user_address->permanent_address = $request->permanent_address;
            $user_address->permanent_city = $request->permanent_city;
            $user_address->permanent_state = $request->permanent_state;
            $user_address->permanent_country = $request->permanent_country;
            $user_address->permanent_pincode = $request->permanent_pincode;

            $user_address->save();

            toast('New User Added Successfully', 'success');
            return redirect()->route('employee.index');
        } else {
            toast('Sorry Email is already used!', 'error');
            return back();
        }
    }

    public function show(User $user)
    {
        //
    }

    public function single($id)
{
    $employee = User::find($id); // Assuming you have an Employee model

    if (!$employee) {
        abort(404, 'Employee not found');
    }

    return view('backend.employee.single_employee', compact('employee'));
}


    public function edit(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $roles = Roles::all();
        $departments = Department::all();
        $locations = Location::all();
        $designations = Designation::all();
        return view('backend.employee.edit', compact('user', 'roles', 'departments','locations','designations'));
    }


    public function update_status()
    {
        $id = $_GET['id'];

        $user = User::findOrFail($id);

        $user->status= 0;

        if ($user->save()) {

            toast('User Info Updated Successfully', 'success');
            return redirect()->route('employee.index');
        } else {
            toast('Something went wrong', 'error');
            return redirect()->route('employee.index');
        }
    }


    public function update(Request $request, $id)
    {

        $user = User::findOrFail($id);
        $user->name = $request->first_name." ".$request->last_name;
        $user->email = $request->email;
        $user->department = $request->department_name;
        $user->location = $request->location_name;
        $user->designation = $request->designation_name;
        $user->job_role = $request->job_role;
        $user->status = $request->status;
        $user->joining_date = $request->joining_date;
        $user->dob = $request->dob;
        $user->gender = $request->gender;
        $user->marital_status = $request->marital_status;
        $user->blood_group = $request->blood_group;
        $user->adhaar_no = $request->aadhaar_no;
        $user->pan_no = $request->pan_no;
        $user->phone = $request->phone;
        if($request->file('imgfile'))
        {

                $image = $request->file('imgfile');
                $img_name = url('')."/uploads/".date('mdYHis').$image->getClientOriginalName();
                $destinationPath = base_path().'/public/uploads';
                $image->move($destinationPath, $img_name);
                $user->profile_photo = $img_name;
        }

        $user->residential_address = $request->present_address;
        $user->residential_city = $request->present_city;
        $user->residential_state = $request->present_state;
        $user->residential_country = $request->present_country;
        $user->residential_pincode = $request->present_pincode;
        $user->permanent_address = $request->permanent_address;
        $user->permanent_city = $request->permanent_city;
        $user->permanent_state = $request->permanent_state;
        $user->permanent_country = $request->permanent_country;
        $user->permanent_pincode = $request->permanent_pincode;
        $user->contract_starting_date = $request->contract_starting_date;
        $user->contract_ending_date = $request->contract_ending_date;
        $user->reason_for_leaving = $request->reason_for_leaving;
        $user->user_type = 'Employee';
        $user->save();

        if ($user->save()) {
            toast('User Info Updated Successfully', 'success');
            return redirect()->route('employee.index');
        } else {
            toast('Something went wrong', 'error');
            return redirect()->route('employee.index');
        }
    }

    public function destroy($id)
    {

        $user = User::find($id);
        $user->delete();
    }

    public function present_employees()
    {
        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
        $present_id = array();
        $i=0;
        foreach($total_present_emp as $row)
        {
            $present_id[$i] = $row->user_id;
            $i++;
        }

        $users = User::where('status',0)->with('userdetails')->whereIn('id',$present_id)->take(5)->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function absent_employees()
    {
        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
        $present_id = array();
        $i=0;
        foreach($total_present_emp as $row)
        {
            $present_id[$i] = $row->user_id;
            $i++;
        }

        $data['present_employees'] = User::whereIn('id',$present_id)->get();

        $total_emp = User::where('user_type','Employee')->get();
        $total_emp_id = array();
        $i=0;
        foreach($total_emp as $row)
        {
            $total_emp_id[$i] = $row->id;
            $i++;
        }

        $users = User::where('status',0)->whereIn('id',$total_emp_id)->whereNotIn('id',$present_id)->groupBy('id')->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function employees()
    {

        $users = User::where('status',0)->with('userdetails')->where('user_type','Employee')->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function get_employee()
    {
        $name = $_GET['name'];
        $data['users'] = User::with('userdetails')->where('name', 'like', '%'.$name.'%')->orWhere('firstname', 'like', '%'.$name.'%')->orWhere('lastname', 'like', '%'.$name.'%')->where('user_type','Employee')->where('status',1)->get();

        return view('backend.employee.search_result', ['data' => $data]);

    }

    public function get_employee_code()
    {
        $role = $_GET['role'];

        $emp_code = User::where('user_type','Employee')->where('job_role',$role)->orderBy('id','DESC')->first();

        if(!empty($emp_code))
        $employee_code = $emp_code->employee_code;

        else
        $employee_code = 000;

        $newcode = substr($employee_code, -3);

        $new_code = str_pad(++$newcode, 3, "0", STR_PAD_LEFT);

        if($role=="Employee")
        $new_employee_code = "ANA ".$new_code;

        else if($role=="Trainee")
        $new_employee_code = "ANA TR ".$new_code;

        else if($role=="New Venture")
        $new_employee_code = "ANA NV ".$new_code;

        return $new_employee_code;
    }

    public function showEmployee($id){
        $employee = User::findOrFail($id);
        $employee = User::with('userdetails.departments')->findOrFail($id);
        $employee = User::with('useraddresses')->findOrFail($id);
        $employee = User::with('projects')->findOrFail($id);

        return view('backend.employee.single_employee', compact('employee'));
    }

public function showProfile($id)
{
    $employee = User::findOrFail($id);
    return view('backend.employee.single_employee', compact('employee'));
}

public function showProjects($id)
{
    $employee = User::findOrFail($id);
    // Load projects or whatever logic you need here
    return view('backend.employee.single_employee', compact('employee'))->with('tab', 'projects');
}

public function showTimesheet($id)
{
    $employee = User::findOrFail($id);
    // Load timesheet data

    // fetch timesheet data for the selected employee
    $timesheet = DB::table('employee_projects')->where('user_id', $id)->get();

    return view('backend.employee.single_employee', compact('employee', 'timesheet'))->with('tab', 'timesheet');
}


}

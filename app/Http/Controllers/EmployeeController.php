<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Roles;
use App\Models\User;
use App\Models\Department;
use App\Models\Designation;
use App\Models\EmployeeProject;
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

        $data['users'] = User::with('userdetails')->where('user_type', 'Employee')->where('status', 1)->get();

        return view('backend.employee.index', ['data' => $data]);
    }

    public function create()
    {

        $roles = Roles::all();
        $departments = Department::all();
        $locations = Location::all();
        $clients = Client::all();
        $designations = Designation::all();
        $userDetails = DB::table('userdetails')->select('department')->first();

        return view('backend.employee.create', compact('roles', 'departments', 'locations', 'designations', 'userDetails','clients'));
    }

    public function show($id)
    {
        // Fetch the employee project by ID
        $employee = EmployeeProject::where('user_id', $id)->first();

        // Fetch the associated employee
        $employee = User::find($id);

        // Check if employee or employee project exists
        if (!$employee || !$employee) {
            abort(404); // Return a 404 page if no employee or project is found
        }

        // Pass both $employee and $employeeProject to the view
        return view('backend.employee.tabs.profile', compact('employee', 'employeeProject'));
    }


    public function store(Request $request)
    {

        /*$request->validate([
            'contract_start_date' => 'required|date',
            'contract_end_date' => 'required|date',
        ]);*/
        if($request->email)
        $email = $request->email;
        else
        $email = "";
        $userdetails = Userdetail::firstOrNew(['user_id' => auth()->id()]);

        $userdetails->contract_starting_date = $request->input('contract_start_date');
        $userdetails->contract_ending_date = $request->input('contract_end_date');
        $userdetails->save();


        if (User::where('email', $request->email)->first() == null) {
            $user =  new User;
            if ($request->file('imgfile')) {

                $image = $request->file('imgfile');
                $img_name = url('') . "/uploads/" . date('mdYHis') . $image->getClientOriginalName();
                $destinationPath = base_path() . '/public/uploads';
                $image->move($destinationPath, $img_name);
            } else {
                $img_name = url('') . "/images/Capture.png";
            }

            $user->employee_code = $request->employee_code;
            $user->name = $request->first_name . " " .$request->middle_name . " " . $request->last_name;
            $user->email = $email;
            $user->user_type = 'Employee';
            $user->phone = $request->phone;
            $user->job_role = $request->job_role;
            $user->gender = $request->gender;
            $user->dob = $request->dob;
            $user->firstname = $request->first_name;
            $user->middlename = $request->middle_name;
            $user->lastname = $request->last_name;
            $user->status = $request->status;
            $user->profile_photo = $img_name;
            $user->client = $request->client;

            $user->save();
            $id = $user->id;




            $user_detail =  new Userdetail;
            $user_detail->user_id = $id;
            $user_detail->adhaar_no = $request->aadhaar_no;
            $user_detail->designation = $request->designation_name;
            $user_detail->department = $request->department_name;
            $user_detail->location = $request->location_name;
            $user_detail->sss_number = $request->sss_no;
            $user_detail->license_number = $request->license_no;
            $user_detail->philHealth_number = $request->philhealth_no;
            $user_detail->license_exp_date = $request->license_expiration_date;
            $user_detail->hdmf_number = $request->hdmf;
            $user_detail->bank_and_account_number = $request->bank_and_account_no;
            $user_detail->tax_identification_number = $request->tax_identification_no;

            $user_detail->academic_qualification = $request->education_details;
            $user_detail->experience_certificate = $request->work_experience;
            $user_detail->contract_starting_date = $request->contract_start_date;
            $user_detail->contract_ending_date = $request->contract_end_date;
            $user_detail->reason_for_leaving = $request->reason_for_leaving;
            $user_detail->blood_group = $request->blood_group;
            $user_detail->marital_status = $request->marital_status;
            $user_detail->joining_date = $request->joining_date;
            $user_detail->pan_no = $request->pan_no;
            $user_detail->emergency_no = $request->emergency;
            $user_detail->basic_salary = $request->monthly_basic;
            $user_detail->annual_ctc_details = $request->annual_ctc;
            $user_detail->salary_pay_type = $request->pay_type;
            $user_detail->regular_rate = $request->regular_rate;
            $user_detail->supervisor_incentive = $request->supervisor_incentive;
            $user_detail->trans_allowance = $request->trans_allowance;
            $user_detail->COLA = $request->COLA;
            $user_detail->daily_meal_allowance = $request->daily_meal_allowance;
            $user_detail->house_rent_allowance = $request->monthly_house_rent;
            $user_detail->conveyance_allowance = $request->monthly_conveyance;
            $user_detail->fixed_allowance = $request->monthly_fixed;



            $user_detail->save();


            $user_address =  new Useraddress;
            $user_address->user_id = $id;
            $user_address->residential_address = $request->present_address;
            $user_address->residential_city = $request->present_city;
            $user_address->residential_state = $request->present_state;
            $user_address->residential_country = $request->present_country;
            $user_address->present_national_id = $request->present_national_id;
            $user_address->permanent_address = $request->permanent_address;
            $user_address->permanent_city = $request->permanent_city;
            $user_address->permanent_state = $request->permanent_state;
            $user_address->permanent_country = $request->permanent_country;
            $user_address->permanent_national_id = $request->permanent_national_id;

            $user_address->save();

            toast('New User Added Successfully', 'success');
            return redirect()->route('employee.index');
        } else {
            toast('Sorry Email is already used!', 'error');
            return back();
        }

        // return redirect()->route('employee.index');

    }



    public function single($id)
    {
        $employee = User::find($id);
        $employee_project = EmployeeProject::where('user_id', $id)
            ->where('month',date('F',strtotime('last month')))
            ->first();

        if(!empty($employee_project))
        $employee_project_id = $employee_project->id;

        else
        $employee_project_id = "";


        if (!$employee) {
            abort(404, 'Employee not found');
        }

        return view('backend.employee.single_employee', compact('employee','employee_project_id'));
    }


    public function edit(Request $request, $id)
    {
        $userdetails = Userdetail::where('user_id', $id)->first();
        $user = User::findOrFail($id);
        $roles = Roles::all();
        $departments = Department::all();
        $locations = Location::all();
        $designations = Designation::all();
        $clients = Client::all();
        $useraddresses = Useraddress::where('user_id', $id)->first();

        return view('backend.employee.edit', compact('user', 'roles', 'departments', 'locations', 'designations', 'userdetails', 'useraddresses','clients'));
    }


    public function update_status()
    {
        $id = $_GET['id'];

        $user = User::findOrFail($id);

        $user->status = 0;

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

        // Validate the incoming request data
        //$request->validate([
            //'department' => 'required', // Add other validation rules as needed
            // Include other fields here as needed
        //]);

        $user = User::find($id);
        $user->name = $request->first_name . " " .$request->middle_name . " " . $request->last_name;
        $user->firstname = $request->first_name; 
        $user->lastname = $request->last_name; 
        $user->middlename = $request->middle_name; 
        $user->email = $request->email; 
        $user->employee_code = $request->employee_code; 
        $user->client = $request->client; 
        $user->job_role = $request->job_role; 
        $user->save();

        $user_address = UserAddress::where('user_id', $user->id)->first();
        if ($user_address) {
            $user_address->residential_address = $request->present_address;
            $user_address->residential_city = $request->present_city;
            $user_address->residential_state = $request->present_state;
            $user_address->residential_country = $request->present_country;
            $user_address->present_national_id = $request->present_national_id;

            $user_address->permanent_address = $request->present_address;
            $user_address->permanent_city = $request->present_city;
            $user_address->permanent_state = $request->present_state;
            $user_address->permanent_country = $request->present_country;
            $user_address->permanent_national_id = $request->present_national_id;

            $user_address->save();
        } else {
            return redirect()->route('employee.index')->with('error', 'User address not found.');
        }


        // Fetch the user details record from the Userdetail model
        $userDetails = Userdetail::where('user_id', $id)->first();

        if ($userDetails) {
            // Update user details in the Userdetail model
            
            $userDetails->department = $request->department; // Correct field name
            $userDetails->designation = $request->designation_name;
            $userDetails->location = $request->location_name;
            $userDetails->joining_date = $request->joining_date;
            $userDetails->adhaar_no = $request->aadhaar_no;
            $userDetails->sss_number = $request->sss_no;
            $userDetails->license_number = $request->license_no;
            $userDetails->philHealth_number = $request->philhealth_no;
            $userDetails->license_exp_date = $request->license_expiration_date;
            $userDetails->hdmf_number = $request->hdmf;
            $userDetails->contract_starting_date = $request->contract_start_date;
            $userDetails->contract_ending_date = $request->contract_end_date;

            $userDetails->bank_and_account_number = $request->bank_and_account_no;
            $userDetails->tax_identification_number = $request->tax_identification_no;

            $userDetails->annual_ctc_details = $request->annual_ctc;
            $userDetails->salary_pay_type = $request->pay_type;
            $userDetails->regular_rate = $request->regular_rate;
            $userDetails->supervisor_incentive = $request->supervisor_incentive;
            $userDetails->trans_allowance = $request->trans_allowance;
            $userDetails->COLA = $request->COLA;
            $userDetails->daily_meal_allowance = $request->daily_meal_allowance;

            // Save the Userdetail model
            $userDetails->save();
        } else {
            // Handle case where Userdetail is not found for the given user
            return redirect()->route('employee.index')->with('error', 'User details not found.');
        }

        toast('User Info Updated Successfully', 'success');
        return redirect()->route('employee.index');

        $user = User::findOrFail($id);
        $user->name = $request->first_name. " " . $request->middle_name . " " . $request->last_name;
        $user->email = $request->email;
        $user->department = $request->department_name;
        $user->location = $request->location_name;
        $user->joining_date = $request->joining_date;
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
        $user->contract_starting_date = $request->contract_start_date;
        $user->contract_ending_date = $request->contract_end_date;
        $user->phone = $request->phone;

        $user->sss_number = $request->sss_no;
        $user->license_number = $request->license_no;
        $user->philHealth_number = $request->philhealth_no;
        $user->license_exp_date = $request->license_expiration_date;
        $user->hdmf_number = $request->hdmf;
        $user->bank_and_account_number = $request->bank_and_account_no;
        $user->tax_identification_number = $request->tax_identification_no;

        if ($request->file('imgfile')) {

            $image = $request->file('imgfile');
            $img_name = url('') . "/uploads/" . date('mdYHis') . $image->getClientOriginalName();
            $destinationPath = base_path() . '/public/uploads';
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

        /*$request->validate([
            'department' => 'required|exists:departments,id',
        ]);*/
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
        $i = 0;
        foreach ($total_present_emp as $row) {
            $present_id[$i] = $row->user_id;
            $i++;
        }

        $users = User::where('status', 0)->with('userdetails')->whereIn('id', $present_id)->take(5)->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function absent_employees()
    {
        $total_present_emp = Status::where('date', date('Y-m-d'))->get();
        $present_id = array();
        $i = 0;
        foreach ($total_present_emp as $row) {
            $present_id[$i] = $row->user_id;
            $i++;
        }

        $data['present_employees'] = User::whereIn('id', $present_id)->get();

        $total_emp = User::where('user_type', 'Employee')->get();
        $total_emp_id = array();
        $i = 0;
        foreach ($total_emp as $row) {
            $total_emp_id[$i] = $row->id;
            $i++;
        }

        $users = User::where('status', 0)->whereIn('id', $total_emp_id)->whereNotIn('id', $present_id)->groupBy('id')->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function employees()
    {

        $users = User::where('status', 0)->with('userdetails')->where('user_type', 'Employee')->get();

        return view('backend.employee.present_employees', compact('users'));
    }

    public function get_employee()
    {
        $name = $_GET['name'];
        $data['users'] = User::with('userdetails')->where('user_type', 'Employee')->where('status', 1)->where('name', 'like', '%' . $name . '%')->get();

        return view('backend.employee.search_result', ['data' => $data]);
    }

    public function get_employee_code()
    {
        $role = $_GET['role'];

        $emp_code = User::where('user_type', 'Employee')->where('job_role', $role)->orderBy('id', 'DESC')->first();

        if (!empty($emp_code))
            $employee_code = $emp_code->employee_code;

        else
            $employee_code = 000;

        $newcode = substr($employee_code, -3);

        $new_code = str_pad(++$newcode, 3, "0", STR_PAD_LEFT);

        if ($role == "Employee")
            $new_employee_code = "ANA " . $new_code;

        else if ($role == "Trainee")
            $new_employee_code = "ANA TR " . $new_code;

        else if ($role == "New Venture")
            $new_employee_code = "ANA NV " . $new_code;

        return $new_employee_code;
    }

    public function get_client_code()
    {
        $role = $_GET['role'];

        $clt_code = Client::where('user_type', 'client')->where('job_role', $role)->orderBy('id', 'DESC')->first();

        if (!empty($emp_code))
            $employee_code = $emp_code->employee_code;

        else
            $employee_code = 000;

        $newcode = substr($employee_code, -3);

        $new_code = str_pad(++$newcode, 3, "0", STR_PAD_LEFT);

        if ($role == "Employee")
            $new_employee_code = "ANA " . $new_code;

        else if ($role == "Trainee")
            $new_employee_code = "ANA TR " . $new_code;

        else if ($role == "New Venture")
            $new_employee_code = "ANA NV " . $new_code;

        return $new_employee_code;
    }

    public function get_branch_code()
    {
        $role = $_GET['role'];

        $emp_code = User::where('user_type', 'Employee')->where('job_role', $role)->orderBy('id', 'DESC')->first();

        if (!empty($emp_code))
            $employee_code = $emp_code->employee_code;

        else
            $employee_code = 000;

        $newcode = substr($employee_code, -3);

        $new_code = str_pad(++$newcode, 3, "0", STR_PAD_LEFT);

        if ($role == "Employee")
            $new_employee_code = "ANA " . $new_code;

        else if ($role == "Trainee")
            $new_employee_code = "ANA TR " . $new_code;

        else if ($role == "New Venture")
            $new_employee_code = "ANA NV " . $new_code;

        return $new_employee_code;
    }

    public function showEmployee($id)
    {
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

    public function invoice($id)
    {
        // Fetch invoice details for the employee
        // Assuming you have an Invoice model and relationship setup
        $invoice = User::where('employee_id', $id)->first();

        // Return view with invoice details
        return view('backend.employee.invoice', compact('invoice'));
    }

    public function getLocations($id)
    {
        $client_details = Client::where('id',$id)->first();
        $location_ids = $client_details->locations;
        $n=0;
        $locations = array();
        $location_list = explode(',', $location_ids);
        foreach($location_list as $row1){
         
             $locations[$n] = $row1;    
             $n++;
        }
        $location_data = Location::select('id', 'location_name')
            ->whereIn('id', $locations)
            ->get();

        return response()->json($location_data);
    }

}

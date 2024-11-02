<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Traits\HasPermissions;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasRoles, HasApiTokens, HasPermissions;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'employee_code',
        'name',
        'email',
        'password',
        'user_type',
        'phone',
        'job_role',
        'gender',
        'dob',
        'firstname',
        'latname',
        'profile_photo',
        'status',
        'aadhaar_no',
        'sss_no',
        'philhealth_no',
        'hdmf',
        'tax_identification_no',
        'pan_no',
        'license_no',
        'license_expiration_date',
        'bank_and_account_no',
        'annual_ctc',
        'pay_type',
        'regular_rate',
        'meal_allowance',
        'living_allowance',
        'transportation_allowance',
        'supervisor_incentive',
        'status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function timesheet()
    {
        return $this->belongsTo(\App\Models\Timesheet::class, "id", "user_id")->withDefault();
    }

    public function userdetails()
    {
        return $this->belongsTo(\App\Models\Userdetail::class, "id", "user_id")->with('departments')->with('locations')->with('designations');
        return $this->hasOne(Userdetail::class, 'user_id', 'id');

    }

    public function user_timesheet()
    {
        return $this->hasOne(\App\Models\EmployeeTimesheet::class, "user_id", "id");
    }

    public function user_timesheet_hourly()
    {
        return $this->hasMany(\App\Models\EmployeeTimesheetHourly::class, "user_id", "id");
    }

    public function useraddress()
    {
        return $this->belongsTo(\App\Models\User::class, "id", "user_id")->withDefault();
    }

    public function passport_expiry_notification()
    {
        $data = User::where('psprt_expiry_date', '<=', Carbon::now()->subDays(7)->toDateTimeString())->get();

        foreach ($data as $row) {
            $user_id = $row->id;
            $token_data = Firebase::where('user_id', $user_id)->first();
            $token = $token_data->token;
            $expiry_date = $row->psprt_expiry_date;
            $title = "Password Getting Expired";
            $body = "Your passport will get expired on " . $expiry_date;
            $this->sendPushNotification($token, $title, $body);
        }
    }

    public function sendPushNotification($token, $title, $body)
    {

        $url = "https://fcm.googleapis.com/fcm/send";
        $serverKey = 'AAAADI7ef3Q:APA91bGQDRgYI8b3VUHeDvqAE7kXK7Qyv7GokYiwVipmHFNMn9OQ7mlEg8fKisCun7Erbb7Pt5imJioZTM-qlMh5WS5nQREZ9eR4OTZQbIFT9UrKtKbSnC5-Xkccw4wi41Xewkanu7ZT';
        $notification = array('title' => $title, 'body' => $body, 'sound' => 'default', 'badge' => '1');
        $arrayToSend = array('to' => $token, 'notification' => $notification, 'priority' => 'high');
        $json = json_encode($arrayToSend);
        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key=' . $serverKey;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //Send the request
        $response = curl_exec($ch);
        //Close request
        curl_close($ch);
    }

    public function employeeProjects()
    {
        return $this->hasMany(EmployeeProject::class, 'user_id', 'id');
    }

    public function useraddresses()
    {
        return $this->hasOne(Useraddress::class, 'user_id');
    }

    public function projects()
    {
        return $this->hasMany(Project::class, 'id');  // Ensure 'user_id' is the correct foreign key
    }

}

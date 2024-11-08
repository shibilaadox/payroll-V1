<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $fillable = [
        'project', 'project_type' ,'project_name','client','project_amount','start_date','end_date','project_location','description','status','salary', 'roles'
    ];

    public function clients()
    {
        return $this->belongsTo(\App\Models\Client::class,'client','id')->withDefault();
    }

    public function employees()
    {
        // return $this->belongsToMany(EmployeeProject::class);
        return $this->belongsTo(\App\Models\User::class,'employee','id', 'employee_projects', 'project_id', 'user_id')->withDefault();
    }

    public function roles()
{
    return $this->belongsToMany(Roles::class);
}

}

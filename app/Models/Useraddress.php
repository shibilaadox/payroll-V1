<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Useraddress extends Model
{
    use HasFactory;
    protected $table = 'useraddresses';
    protected $fillable = ['user_id','permanent_address','permanent_city','permanent_state','permanent_country','permanent_pincode','residential_address','residential_city','residential_state','residential_country','residential_pincode'];

}

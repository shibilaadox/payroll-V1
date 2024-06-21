<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Paymentstatus extends Model
{
    use HasFactory;
    protected $table = 'payment_status';
    protected $fillable = ['user_id','status','month'];

    public function users()
    {
        return $this->belongsTo(\App\Models\User::class,'user_id','id');
    }

}

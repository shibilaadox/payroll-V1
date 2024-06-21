<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Leave extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'type','count','details','reason','status','reject_reason'
    ];

    public function user()
    {
        return $this->hasOne(\App\Models\User::class,"id","user_id")->withDefault();
    }
    
    public function userdetails()
    {
        return $this->belongsTo(\App\Models\User::class,'user_id','id');
    }

}

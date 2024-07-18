<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deduction extends Model
{
    use HasFactory;
    protected $fillable = [
        'code', 'ded_code', 'ded_no', 'ded_amount','user_id','month'
    ];

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class,'user_id','id');
    }

}

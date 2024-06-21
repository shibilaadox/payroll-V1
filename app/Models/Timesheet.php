<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'date','log','time','latitude','longitude'
    ];
    
    public function user()
    {
        return $this->hasOne(\App\Models\User::class,"id","user_id")->withDefault();
    }
}

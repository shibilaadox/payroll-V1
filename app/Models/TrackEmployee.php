<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TrackEmployee extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'date','location'
    ];

    public function user()
    {
        return $this->hasMany(\App\Models\User::class,"id","user_id");
    }
}

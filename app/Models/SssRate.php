<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SssRate extends Model
{
    use HasFactory;
    protected $table="sss_rates";
    protected $fillable = [
        'limit',
        'emplr',
        'emply',
        'ecc',
        'emprov',
        'erprov',
    ];

}

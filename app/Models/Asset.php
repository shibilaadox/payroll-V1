<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asset extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function machine_types()
    {
        return $this->belongsTo(MachineType::class,'machine_type','id')->withDefault();
    }
}

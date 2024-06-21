<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MachineType extends Model
{
    use HasFactory;
    protected $guarded = []; 

    public function all_assets()
    {
        return $this->hasMany(MachineType::class)->withDefault();
    }
}

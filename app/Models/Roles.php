<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Contracts\Permission;

class Roles extends Model
{
    use HasFactory;
    protected $fillable = [
        'name', 'guard_name','sss', 'philhealth', 'hdmf'
    ];

    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'role_permission');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use HasFactory;

    protected $fillable = [
        'heading', 'content' ,'type' , 'photo' ,'status'
    ];
    
    public function photos()
    {
        return $this->hasOne(\App\Models\Upload::class,'id','photo')->withDefault();
    }
}

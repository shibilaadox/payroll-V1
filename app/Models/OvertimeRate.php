<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OvertimeRate extends Model
{
    use HasFactory;
    protected $table="overtime_rates";
    protected $fillable = [
        'dec1',
        'rate1',
        'cola1',
        'transpo1',

        'dec2',
        'rate2',
        'cola2',
        'transpo2',

        'dec3',
        'rate3',
        'cola3',
        'transpo3',

        'dec4',
        'rate4',
        'cola4',
        'transpo4',

        'dec5',
        'rate5',
        'cola5',
        'transpo5',

        'dec6',
        'rate6',
        'cola6',
        'transpo6',

        'dec7',
        'rate7',
        'cola7',
        'transpo7',

        'dec8',
        'rate8',
        'cola8',
        'transpo8',

        'dec9',
        'rate9',
        'cola9',
        'transpo9',

        'dec10',
        'rate10',
        'cola10',
        'transpo10',

        'dec11',
        'rate11',
        'cola11',
        'transpo11',

        'dec12',
        'rate12',
        'cola12',
        'transpo12',

        'dec13',
        'rate13',
        'cola13',
        'transpo13'


    ];

}

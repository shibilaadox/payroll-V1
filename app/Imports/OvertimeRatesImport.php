<?php

namespace App\Imports;

use App\Models\OvertimeRate;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\User;

class OvertimeRatesImport implements ToModel, WithStartRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function startRow(): int
    {
        return 2;
    }

    public function model(array $row)
    {
       
        return new OvertimeRate([
            
            

                'dec1'=> $row[0],
        'rate1'=> $row[1],
        'cola1'=> $row[2],
        'transpo1'=> $row[3],

        'dec2'=> $row[4],
        'rate2'=> $row[5],
        'cola2'=> $row[6],
        'transpo2'=> $row[7],

        'dec3'=> $row[8],
        'rate3'=> $row[9],
        'cola3'=> $row[10],
        'transpo3'=> $row[11],

        'dec4'=> $row[12],
        'rate4'=> $row[13],
        'cola4'=> $row[14],
        'transpo4'=> $row[15],

        'dec5'=> $row[16],
        'rate5'=> $row[17],
        'cola5'=> $row[18],
        'transpo5'=> $row[19],

        'dec6'=> $row[20],
        'rate6'=> $row[21],
        'cola6'=> $row[22],
        'transpo6'=> $row[23],

        'dec7'=> $row[24],
        'rate7'=> $row[25],
        'cola7'=> $row[26],
        'transpo7'=> $row[27],

        'dec8'=> $row[28],
        'rate8'=> $row[29],
        'cola8'=> $row[30],
        'transpo8'=> $row[31],

        'dec9'=> $row[32],
        'rate9'=> $row[33],
        'cola9'=> $row[34],
        'transpo9'=> $row[35],

        'dec10'=> $row[36],
        'rate10'=> $row[37],
        'cola10'=> $row[38],
        'transpo10'=> $row[39],

        'dec11'=> $row[40],
        'rate11'=> $row[41],
        'cola11'=> $row[42],
        'transpo11'=> $row[43],

        'dec12'=> $row[44],
        'rate12'=> $row[45],
        'cola12'=> $row[46],
        'transpo12'=> $row[47],

        'dec13'=> $row[48],
        'rate13'=> $row[49],
        'cola13'=> $row[50],
        'transpo13' => $row[51],


        ]);
    }
}

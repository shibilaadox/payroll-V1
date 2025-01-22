<?php

namespace App\Imports;

use App\Models\SssRate;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\User;

class SssRatesImport implements ToModel, WithStartRow
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
       
        return new SssRate([
            
            

        'limit'=> $row[0],
        'emplr'=> $row[1],
        'emply'=> $row[2],
        'ecc'=> $row[3],
        'emprov'=> $row[3],
        'erprov'=> $row[3],



        ]);
    }
}

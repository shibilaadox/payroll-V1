<?php

namespace App\Imports;

use App\Models\Rate;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\User;

class RatesImport implements ToModel, WithStartRow
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
       
        return new Rate([
            
                'client_code' => $row[0],
                'branch' => $row[1],
                'position' => $row[2],
                'rate8' => $row[3],
                'rate12' => $row[4],
                'cola' => $row[5],
                'nd' => $row[6],
        ]);
    }
}

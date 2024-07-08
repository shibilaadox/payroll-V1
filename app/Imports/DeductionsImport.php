<?php

namespace App\Imports;

use App\Models\Deduction;
use Maatwebsite\Excel\Concerns\ToModel;

class DeductionsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Deduction([
            
                'code' => $row[0],
                'ded_code' => $row[1],
                'ded_no' => $row[2],
                'ded_amt' => $row[3],

        ]);
    }
}

<?php

namespace App\Imports;

use App\Models\Deduction;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\User;

class DeductionsImport implements ToModel, WithStartRow
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
        $code = $row[0];
        $data = User::where('employee_code',$code)->first();
        $id = $data->id;
        return new Deduction([
            
                'user_id' => $id,
                'ded_code' => $row[1],
                'ded_no' => $row[2],
                'ded_amount' => $row[3],
                'month' => date('F',strtotime('last month'))
        ]);
    }
}

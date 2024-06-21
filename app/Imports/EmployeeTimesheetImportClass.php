<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\EmployeeTimesheet;
use App\Models\User;

class EmployeeTimesheetImportClass implements ToModel, WithStartRow
{
    public function startRow(): int
    {
        return 2;
    }

    
    public function model(array $row)
    {
        // Define how to create a model from the Excel row data
        $name = $row[0];
        $data = User::where('name',$name)->first();
        $id = $data->id;
        EmployeeTimesheet::create([
            'user_id'=>$id,
            'days_worked' => $row[1],
            'month' => $row[2],
        ]);
    }
}

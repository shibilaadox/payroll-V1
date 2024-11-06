<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\UserTimesheet;
use App\Models\User;

class EmployeeTimesheetHourlyImportClass implements ToModel, WithStartRow
{
    public function startRow(): int
    {
        return 2;
    }

    
    public function model(array $row)
    {
        // Define how to create a model from the Excel row data
        
        $code = $row[4];
        $data = User::where('employee_code',$code)->first();
        $id = $data->id;

        if($code!=""){
        
        UserTimesheet::create([
            'user_id' => $id,
            'date' => $row[0], 
            'year' => $row[1], 
            'month' => $row[2], 
            'week_number' => $row[3], 
            'employee_code' => $row[4], 
            'pay_type' => $row[5],
            'company_code' => $row[6], 
            'client_id' => $row[7], 
            'location_id' => $row[8], 
            'posicode' => $row[9],  
            'ot1_hrs' => $row[10], 
            'ot2_hrs' => $row[11], 
            'ot3_hrs' => $row[12],  
            'ot4_hrs' => $row[13], 
            'ot5_hrs' => $row[14], 
            'ot6_hrs' => $row[15], 
            'ot7_hrs' => $row[16], 
            'ot8_hrs' => $row[17], 
            'ot9_hrs' => $row[18], 
            'ot10_hrs' => $row[19],
            'ot11_hrs' => $row[20], 
            'ot12_hrs' => $row[21], 
            'ot13_hrs' => $row[22], 
            'day8'=> $row[23],
            'day8_rate'=> $row[24],
            'day12'=> $row[25],
            'day12_rate'=> $row[26],
            'nd_days'=> $row[27],
            'undertime'=> $row[28],
            'incentive'=> $row[29],
           
        ]);
    }
    }
}

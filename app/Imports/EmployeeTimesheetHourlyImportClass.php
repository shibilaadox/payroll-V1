<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use App\Models\EmployeeTimesheetHourly;
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
        
        EmployeeTimesheetHourly::create([
            'user_id' => $id,
            'date' => $row[0], 
            'year' => $row[1], 
            'month' => $row[2], 
            'week' => $row[3], 
            'code' => $row[4], 
            'ptype' => $row[6],
            'compcd' => $row[7], 
            'clientcd' => $row[8], 
            'branch' => $row[9], 
            'posicode' => $row[10], 
            'cont_no' => $row[11], 
            'sub_no' => $row[12], 
            'ot1_hrs' => $row[13], 
            'ot1_amt' => $row[14], 
            'ot2_hrs' => $row[15], 
            'ot2_amt' => $row[16], 
            'ot3_hrs' => $row[17], 
            'ot3_amt' => $row[18], 
            'ot4_hrs' => $row[19], 
            'ot4_amt' => $row[20],
            'ot5_hrs' => $row[21], 
            'ot5_amt' => $row[22],
            'ot6_hrs' => $row[23], 
            'ot6_amt' => $row[24], 
            'ot7_hrs' => $row[25], 
            'ot7_amt' => $row[26], 
            'ot8_hrs' => $row[27], 
            'ot8_amt' => $row[28], 
            'ot9_hrs' => $row[29], 
            'ot9_amt' => $row[30], 
            'ot10_hrs' => $row[31],
            'ot10_amt' => $row[32], 
            'ot11_hrs' => $row[33], 
            'ot11_amt' => $row[34], 
            'ot12_hrs' => $row[35], 
            'ot12_amt' => $row[36], 
            'ot13_hrs' => $row[37], 
            'ot13_amt' => $row[38],
            'day8'=> $row[39],
            'day8_rate'=> $row[40],
            'day8_pay'=> $row[41],
            'day12'=> $row[42],
            'day12_rate'=> $row[43],
            'day12_pay'=> $row[44],
            'nd_days'=> $row[45],
            'nd_amt'=> $row[46],
            'undertime'=> $row[47],
            'under_amt'=> $row[48],
            'ecola'=> $row[49],
            'incentive'=> $row[50],
            'gross_pay'=> $row[51],


        ]);
    }
    }
}

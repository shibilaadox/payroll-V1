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
        
        EmployeeTimesheetHourly::create([

            'pdate' => $row[1], 
            'year' => $row[2], 
            'month' => $row[3], 
            'week' => $row[4], 
            'code' => $row[5], 
            'compcd' => $row[6], 
            'ptype' => $row[7],
             'clientcd' => $row[8], 
             'branch' => $row[9], 
             'reg_date' => $row[10], 
             'year_date' => $row[11], 
             'unmin' => $row[12], 
             'unamt' => $row[13],
              'abday' => $row[14], 
              'abamt' => $row[15],
               'vltak' => $row[16], 
               'vlamt' => $row[17], 
               'vlday' => $row[18],
                'sltak' => $row[19], 
                'slamt' => $row[20],
                 'slday' => $row[21], 
                 'incentive' => $row[22],
                  'reg_day' => $row[23],
                   'reg_pay' => $row[24], 
                   'nd_days' => $row[25], 
                   'gross_pay' => $row[26], 
                   'nd_amt' => $row[27], 
                   'ecola' => $row[28], 
                   'sea' => $row[29], 
                   'emss' => $row[30], 
                   'erss' => $row[31],
                    'ecc' => $row[32],
                     'emprov' => $row[33],
                      'erprov' => $row[34], 
                      'emmedi' => $row[35],
                       'ermedi' => $row[36], 
                       'empagi' => $row[37], 
                       'erpagi' => $row[38], 
                       'wtax' => $row[37],
                        'ss_hd_loan' => $row[40],
                         'co_loan' => $row[41],
                          'totloan' => $row[42],
                           'bond' => $row[43], 
                           'tded' => $row[44],
                            'net_pay' => $row[45], 
                            'r12_rate' => $row[46], 
                            'r12_day' => $row[47],
                             'r12_pay' => $row[48], 
                             'ot1_hrs' => $row[49], 
                             'ot1_amt' => $row[50], 
                             'ot2_hrs' => $row[51], 
                             'ot2_amt' => $row[52], 
                             'ot3_hrs' => $row[53], 
                             'ot3_amt' => $row[54], 
                             'ot4_hrs' => $row[55], 
                             'ot4_amt' => $row[56],
                             'ot5_hrs' => $row[57], 
                             'ot5_amt' => $row[58],
                              'ot6_hrs' => $row[59], 
                              'ot6_amt' => $row[60], 
                              'ot7_hrs' => $row[61], 
                              'ot7_amt' => $row[62], 
                              'ot8_hrs' => $row[63], 
                              'ot8_amt' => $row[64], 
                              'ot9_hrs' => $row[65], 
                              'ot9_amt' => $row[66], 
                              'ot10_hrs' => $row[67],
                               'ot10_amt' => $row[68], 
                               'ot11_hrs' => $row[69], 
                               'ot11_amt' => $row[70], 
                               'ot12_hrs' => $row[71], 
                               'ot12_amt' => $row[72], 
                               'ot13_hrs' => $row[73], 
                               'ot13_amt' => $row[74], 
                               'ottot' => $row[75], 
                               'adjamt' => $row[76],
                                'r12_net' => $row[77],
                                 'net_net' => $row[78], 
                                 'taxable' => $row[79], 
                                 'transpo' => $row[80], 
                                 'meal' => $row[81], 
                                 'oth_allow' => $row[82], 
                                 'cashadv' => $row[83], 
                                 'take_home' => $row[84], 
                                 'insurance' => $row[85], 
                                 'pay_13' => $row[86], 
                                 'vartran' => $row[87],
                                  'bnk_adv' => $row[88], 
                                  'sss_amt' => $row[89], 
                                  'max_client' => $row[90],
                                   'max_branch' => $row[91],
                                    'hdmf_sav' => $row[92], 
                                    'contr_amt' => $row[93],
                                     'ph_amt' => $row[94], 
                                     'uniform'=> $row[95], 
        ]);
    }
}

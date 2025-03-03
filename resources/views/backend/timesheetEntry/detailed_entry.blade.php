<?php use App\Models\Leave;use App\Models\Deduction;use App\Models\Paymentstatus;use App\Models\Rate;use App\Models\Roles;use App\Models\OvertimeRate;use App\Models\SssRate;?>
<div class="table-responsive">
                            <table class="table table-striped" id="role_datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Total Hrs</th>
                                        <th scope="col">Regular Pay</th>
                                        <th scope="col">Overtime</th>
                                        <th scope="col">Gross Pay</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $i = 1;
                                @endphp


                                <?php $i=1;foreach ($data['employee'] as $row1){ 


                                      foreach($row1->usertimesheet as $row){
                                        $j = 0 ;$TOTAL_overtime=0;$no_8_days=0;$no_12_days=0;$no_days=0;$TOTAL_UA=0;$TOTAL_OT=0;$TOTAL_GP = 0; $NET_PAY = 0;$TOTAL_RP = 0;$TOTAL_DEDUCTION=0;$TOTAL_EMHDMF=0;$TOTAL_EMPH=0;$TOTAL_EMSSS=0;$TOTAL_tax=0;
       

                                          $j++;

                                          $id = $row->user_id;

                                          $no_8_days = $no_8_days + $row->day8;
                                          $no_12_days = $no_12_days + $row->day12;
                                          $no_days = $no_8_days + $no_12_days;
                      
                                          $RegP = $row->day8*$row->day8_rate;
                              
                                          if($row->day12==4)
                                          $Pay12 = $row->day12_rate-$RegP;
                                          else
                                          $Pay12 = $row->day8_rate*$row->day12;

                                          $TOTAL_RP = $RegP+$Pay12;
                              
                                          $UA = $row->undertime * ($row->day8_rate/60);
                                          $TOTAL_UA = $UA;
                              
                                          $ot_rate = OvertimeRate::first();

                    $ot1 = $row->ot1_hrs*$ot_rate->rate1;
                    $ot2 = $row->o21_hrs*$ot_rate->rate2;
                    $ot3 = $row->ot3_hrs*$ot_rate->rate3;
                    $ot4 = $row->ot4_hrs*$ot_rate->rate4;
                    $ot5 = $row->ot5_hrs*$ot_rate->rate5;
                    $ot6 = $row->ot6_hrs*$ot_rate->rate6;
                    $ot7 = $row->ot7_hrs*$ot_rate->rate7;
                    $ot8 = $row->ot8_hrs*$ot_rate->rate8;
                    $ot9 = $row->ot9_hrs*$ot_rate->rate9;
                    $ot10 = $row->ot10_hrs*$ot_rate->rate10;
                    $ot11 = $row->ot11_hrs*$ot_rate->rate11;
                    $ot12 = $row->ot12_hrs*$ot_rate->rate12;
                    $ot13 = $row->ot13_hrs*$ot_rate->rate13;

                    $OT = $ot1+$ot2+$ot3+$ot4+$ot5+$ot6+$ot7+$ot8+$ot9+$ot10+$ot11+$ot12+$ot13;
                    $TOTAL_OT = $OT;
                    
                                          $role = $row->posicode;
                      
                                          $rate_data = Rate::first();
                      
                                          $ND_rate = $rate_data->nd;
                      
                                          $COLA_rate = $rate_data->cola;
                              
                                          $COLA = $COLA_rate * $j;
                              
                                          $ND = $ND_rate * $row->nd_days;
                              
                                          $SI = $row->incentive;

                                          $overtime = $ND+$COLA+$SI+$OT;
                    
                                          $TOTAL_overtime = $overtime ;
                              
                                          $GP = $TOTAL_RP + $ND + $OT+$COLA + $SI - $UA;
                      
                                          $TOTAL_GP = $GP;

                                        $taxable_income = $TOTAL_RP+$TOTAL_OT-($TOTAL_UA);

            if($taxable_income<10000)
            $EMPH = 0;
            else 
            $EMPH = (5 * $taxable_income)/100;

            $EMHDMF = 200;
            
            $sss_rates = SssRate::all();

            foreach($sss_rates as $row2)
            {
                if($taxable_income<=$row2->limit)
                {
                    $EMSSS = $row2->emply;
                    break;
                }
            }
            

            if($taxable_income<=20833)
            $tax = 0;
            else if($taxable_income>20833 && $GP<33332)
            $tax = 0 + (15* ($taxable_income - 20833)/100);
            else if($taxable_income>33333 && $GP<66666)
            $tax = 1875+ (20* ($taxable_income - 33333)/100);
            else if($taxable_income>66666 && $GP<166666)
            $tax = 8541.80+(25* ($taxable_income - 66667)/100);
            else if($taxable_income>166666 && $GP<666666)
            $tax = 33541.80+(30* ($taxable_income - 166667)/100);
            else if($taxable_income>666666)
            $tax = 183541.80+(35* ($taxable_income - 666667)/100);
            

            $deductions = $EMPH+$EMHDMF+$EMSSS;

            $DEDUCTION = Deduction::where('user_id',$id)->where('month',date('F',strtotime('last month')))->sum('ded_amount');
            $TOTAL_DEDUCTION = $TOTAL_DEDUCTION+$DEDUCTION;
            

                                      
                                      ?>
                                        <tr>
                                            <th scope="row">{{ $i }}</th>
                                            <td><?php echo $row->date?></td>
                                            <td><?php echo $no_days?></td>
                                            <td><?php echo $TOTAL_RP?></td>
                                            <td><?php echo $TOTAL_OT?></td>
                                            <td><?php echo $TOTAL_GP?></td>

                                    
                                        </tr>
                                    <?php } $i++; }?>
                                
                                </tbody>
                            </table>
                        </div>

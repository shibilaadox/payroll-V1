


    
    <div class="">

        <div class="text-center">
            <h1><?php echo $data['posicode']?></h1>
            <h4><?php echo $data['clientcd']?></h4>
        </div>

        <div class="mt-5">
            <p class="fw-bold">
                Period &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                <span>
                    <?php echo $data['start_date']?> to <?php echo $data['end_date']?>
                </span>
            </p>

            <p class="fw-bold">
                Pay Date &nbsp; :
                <span>
                <?php echo date('10-m-Y')?>
                </span>
            </p>
        </div>


        <table class="table text-center mt-5">
            <thead >
            --------------------------------------------------------------------------------------------------------------------------------------
            <br>
              <tr >
                <th scope="col">Item</th>
                <th scope="col">Amount</th>
                <th scope="col">Item</th>
                <th scope="col">Amount</th>
                <th scope="col">Deductions</th>
                <th scope="col">Amount</th>
              </tr>
              
              
            </thead>
            <tbody>
              
              <tr>
            -------------------------------------------------------------------------------------------------------------------------------------
              <br>
                <th>Basic</th>
                <td><?php echo number_format($data['TOTAL_RP'],2)?></td>
                <td></td>
                <td></td>
                <td>SSS Prem.</td>
                <td><?php echo number_format($data['EMSSS'],2)?>50</td>
              </tr>
              <tr>
                <th>Night Diff</th>
                <td><?php echo number_format($data['night_diff'],2)?></td>
                <td></td>
                <td></td>
                <td>Phill.Health</td>
                <td><?php echo number_format($data['EMPH'],2)?></td>
              </tr>
              
              <tr>
                <th>Overtime</th>
                <td><?php echo number_format($data['overtime'],2)?></td>
                <td></td>
                <td></td>
                <td>Pag-ibig Prem.</td>
                <td><?php echo number_format($data['EMHMDF'],2)?></td>
              </tr>
              
              -------------------------------------------------------------------------------------------------------------------------------------
<br>
              <tr>
                <th>Gross Income</th>
                <td><?php echo number_format($data['gross_pay'],2)?></td>
                <td></td>
                <td></td>
                <td>Total Deduction</td>
                <td><?php echo number_format($data['deduction_total'],2)?></td>
              </tr>
              <br>
              <tr>
                <th></th>
                <td></td>
                <td></td>
                <td></td>
                <td><b>Net Pay</b></td>
                <td><b><?php echo number_format($data['net_pay'],2)?></b></td>
              </tr>
            </tbody>
          </table>

    </div>
   


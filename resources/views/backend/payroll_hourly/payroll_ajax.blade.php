<div id="ember3202" class="liquid-container ember-view" style=""><div id="ember3205" class="liquid-child ember-view" style="top: 0px; left: 0px;">    <div id="ember3206" class="ember-view"><div class="split-up-view-header ind-split-up-view-header">
  

</div>
<div class="scroll-x scroll-y scrollbox split-view-content font-mm ind-split-view-content download-payslip-footer-margin">
    <h4>{{$data['employee']->name}}</h4>
    <h6>Emp Id : {{$data['employee']->employee_code}}</h6><br>
    <div class="media status-banner success-banner">
      <div class="media-left media-top">
        <svg viewBox="0 0 512 512" class="icon icon-md vertical-align-sub"><path d="M256 4C116.8 4 4 116.8 4 256s112.8 252 252 252 252-112.8 252-252S395.2 4 256 4zm156 188L240.7 363.3c-6 6-13.8 9-21.6 9-7.8 0-15.7-3-21.6-9l-81.1-81.1c-12-12-12-31.3 0-43.3 12-12 31.3-12 43.3 0l59.5 59.5 149.7-149.7c12-12 31.3-12 43.3 0C424 160.6 424 180 412 192z"></path></svg>
      </div>
      <?php if(empty($data['status'])){?>
      <div class="alert alert-danger" role="alert" style="width:100%;border-radius: 0px;">
        Not yet paid
      </div>
      <?php }  else if($data['status']->status==1){?>
      <div class="alert alert-success" role="alert" style="width:100%;border-radius: 0px;">
        Paid on <b>{{$data['status']->created_at->format('d/m/Y')}}</b> through <b>Check</b>
      </div>
      <?php } ?>
    </div>
 <div tabindex="-1" id="ember3209" class="col-xs-12 no-outline ember-view"><div id="ember3210" class="ember-view" style="overflow: hidden; width: 420px; height: 0px;"><div id="ember3211" class="ember-view" style="overflow: auto;">  <!---->

</div></div></div>
  <table class="table table-responsive split-up-table">
    <tbody>
   <tr>
        <td width="90%" class="ptop-medium">
          Payable Days
        </td>
        <td width="40%" class="ptop-medium">
            <div class="pull-right" data-test-selector="emp-working-days">
            {{$data['paid_days']}}
            </div>
        </td>
        <td width="4%" class="action-column ptop-medium">
       </td>
      </tr>
   </tbody>
  </table>

    <table class="table table-responsive split-up-table">
      <thead>
        <tr>
          <th width="56%" class="earnings font-ms" style="color:green">(+) Earnings</th>
          <th width="40%" class="text-right font-ms">Amount</th>
          <th width="4%" class="action-column"></th>
        </tr>
      </thead>
      <tbody>
            <tr data-test-selector="earning-row">
    <td>
        <div>
          Gross Pay
<!---->        </div>
    </td>
    <td class="text-right">
    <?php echo "₱".number_format($data['gross_pay'],2);?>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->
          
          
<!---->

<!---->
      </tbody>
    </table>
    
    <table class="table table-responsive split-up-table">
      <thead>
        <tr>
          <th width="56%" class="earnings font-ms" style="color:red;">(-) Deductions</th>
          <th width="40%" class="text-right font-ms">Amount</th>
          <th width="4%" class="action-column"></th>
        </tr>
      </thead>
      <tbody>

        
            <tr data-test-selector="earning-row">
    <td>
        <div>
        <b>Deduction</b>
<!---->        </div>
    </td>
    <td class="text-right">
    
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>

  <tr data-test-selector="earning-row">
    <td>
        <div>
          EMSSS
<!---->        </div>
    </td>
    <td class="text-right">
    <?php echo "₱".number_format($data['EMSSS'],2);?>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
            

            <tr data-test-selector="earning-row">
    <td>
        <div>
          EMPH
<!---->        </div>
    </td>
    <td class="text-right">
    <?php echo "₱".number_format($data['EMPH'],2);?>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->

<tr data-test-selector="earning-row">
    <td>
        <div>
          EMHMDF
<!---->        </div>
    </td>
    <td class="text-right">
    <?php echo "₱".number_format($data['EMHMDF'],2);?>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->

<tr data-test-selector="earning-row">
    <td>
        <div>
          <b>Total Deduction</b>
<!---->        </div>
    </td>
    <td class="text-right">
    <b><?php echo "₱".number_format($data['deduction_total'],2);?></b>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->

<tr data-test-selector="earning-row">
    <td>
        <div>
          <b>Tax</b>
<!---->        </div>
    </td>
    <td class="text-right">
    <b><?php echo "₱".number_format($data['tax'],2);?></b>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->

<tr data-test-selector="earning-row">
    <td>
        <div>
          <b>Other Deductions</b>
<!---->        </div>
    </td>
    <td class="text-right">
    <b><?php echo "₱".number_format($data['deduction'],2);?></b>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->


      
<tr data-test-selector="earning-row">
    <td>
        <div><b>
          NET PAY</b>
<!---->        </div>
    </td>
    <td class="text-right">
    <b><?php echo "₱".number_format($data['net_pay'],2);?></b>
<!---->          </td>
    <td class="vertical-align-middle action-column">
<!---->    </td>
  </tr>
<!---->
      </tbody>
    </table>
   
</div>
  
</div>
</div></div>
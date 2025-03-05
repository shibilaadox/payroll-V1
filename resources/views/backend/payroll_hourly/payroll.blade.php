
<?php $fDay = date('Y-m-01');
        $hDay = date('Y-m-d', (strtotime($fDay)+ (86400 * 15))-1);?>
@extends('layouts.master')

@section('main-content')
            <div class="breadcrumb">

                <h2>Pay Runs</h2>
                
            </div>
            
            <div class="separator-breadcrumb border-top"></div>
             
            <div class="breadcrumb">
            <div class="form-group col-md-4">
               
                                <label for="payroll_period_start" class="ul-form__label">Payroll Start Date:</label>
                                <input type="date" class="form-control filter_payroll" id="payroll_period_start"
                                    name="payroll_period_start" required value={{$fDay}}>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="payroll_period_end" class="ul-form__label">Payroll End Date:</label>
                                <input type="date" class="form-control filter_payroll" id="payroll_period_end"
                                    name="payroll_period_end" required value={{$hDay}}>
                            </div> 

                            <div class="form-group col-md-4">
                                <label for="client_id" class="ul-form__label">Client:</label>
                                <select class="form-control filter_payroll" id="client_id" name="client_id" required>
                                    <option value="" disabled selected>Select Client</option>
                                    @foreach ($data['clients'] as $client)
                                        <option value="{{ $client->id }}">{{ $client->name }}</option>
                                    @endforeach
                                </select>
                            </div>
            </div>
            <?php //if($data['employee']>0){?>
            <h4 class="card-title mb-3" style="text-align: end;"><button type="button"
                                class="btn btn-primary ripple m-1" id="view_details">
                                    View Details</a></button></h4>
            <?php //} ?>
            <div class="row mb-12">
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                            <span class="text-18" id="net_pay"><?php echo "₹".number_format($data['net_pay_total'],2);?></span>
                            <p class="text-small text-muted m-0">EMPLOYEES' NET PAY</p>  
                        </div>

                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                            <span class="text-18"><?php echo date('Y-m-10')?></span>
                            <p class="text-small text-muted m-0">PAYMENT DATE</p>  
                        </div>

                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                            <span class="text-18" id="no_employee">{{$data['employee']}}</span>
                            <p class="text-small text-muted m-0">NO. OF EMPLOYEES</p>  
                        </div>

                    </div>
                </div>
            </div>

@endsection

@section('page-js')
 
<script type="text/javascript">

    $(".app-footer").hide();

    $("#view_details").click(function(){

var payroll_period_start= $("#payroll_period_start").val();
var payroll_period_end =  $("#payroll_period_end").val();
var client= $("#client_id").val();

$.ajax({
        url: "",
        type: "GET",
        data: {payroll_period_start:payroll_period_start,payroll_period_end:payroll_period_end,client:client},
        dataType: 'text',
        success: function(response) {
           
            location.href= "payrolls_hourly/create?payroll_period_start="+payroll_period_start+"&payroll_period_end="+payroll_period_end+"&client="+client;
        },
        error: function(response) {
            
        }

    });

});

$(".filter_payroll").change(function(){

var payroll_period_start= $("#payroll_period_start").val();
var payroll_period_end =  $("#payroll_period_end").val();
var client= $("#client_id").val();


$.ajax({
        url: "{{ route('payroll_month') }}",
        type: "GET",
        data: {payroll_period_start:payroll_period_start,payroll_period_end:payroll_period_end,client:client},
        dataType: 'text',
        success: function(response) {
           
            var res = response.split("/");
            var pay =res[0];
            pay = parseFloat(pay).toFixed(2);
            $("#no_employee").html(res[1]);
            $("#net_pay").html("₹"+pay);
            

        },
        error: function(response) {
            
        }

    });

});

</script>

@endsection

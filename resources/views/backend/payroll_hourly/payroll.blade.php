@extends('layouts.master')

@section('main-content')
            <div class="breadcrumb">

                <h2>Pay Runs</h2>
                
            </div>
            
            <div class="separator-breadcrumb border-top"></div>
             
            <div class="breadcrumb">

                <h4>Process Pay Run for <b><?php $currentMonth = date('F');
                echo Date('F', strtotime($currentMonth . " last month")); echo " ".date('Y')?> </b> </h4>
                
            </div>
            
            <h4 class="card-title mb-3" style="text-align: end;"><button type="button"
                                class="btn btn-primary ripple m-1"><a style="color: white"
                                    href="{{ route('payrolls_hourly.create') }}">
                                    View Details</a></button></h4>
            <div class="row mb-12">
                <div class="col-md-4 mb-4">
                    <div class="card o-hidden">

                        <div class="card-body">
                            <span class="text-18"><?php echo "₹".number_format($data['gross_pay_total'],2);?></span>
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
                            <span class="text-18">{{$data['employee']}}</span>
                            <p class="text-small text-muted m-0">NO. OF EMPLOYEES</p>  
                        </div>

                    </div>
                </div>
            </div>

@endsection

@section('page-js')
 
<script type="text/javascript">

    $(".app-footer").hide();

</script>

@endsection

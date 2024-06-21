<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCPDF;
use App\Models\User;
use App\Models\Firebase;
use App\Models\EmployeeTimesheet;
use App\Models\Deduction;
use Carbon;

class PdfController extends Controller
{
    public function index() 
    {
        $id = 28;
    	$data['employee'] = User::with('userdetails')->with('user_timesheet')->has('user_timesheet')->whereHas('user_timesheet', function ($query) {
            
            return $query->where('month',date('F',strtotime('last month')));
            
        })->where('id',$id)->first();

        $paid_days = $data['employee']->user_timesheet->days_worked;
       
        $gross_pay_month = $data['employee']->userdetails->basic_salary+$data['employee']->userdetails->house_rent_allowance+$data['employee']->userdetails->conveyance_allowance+$data['employee']->userdetails->fixed_allowance;
        $gross_pay_day = $gross_pay_month/26;
        $gross_pay = $gross_pay_day*$paid_days;
        
        $deduction = Deduction::where('type','Deduction')->where('user_id',$id)->whereMonth('created_at',Carbon::now()->month-1)->sum('amount');
        $tax = Deduction::where('type','Tax')->where('user_id',$id)->whereMonth('created_at',Carbon::now()->month-1)->sum('amount');
        $data['net_pay'] = $gross_pay-($deduction+$tax);

        // create new PDF document
        $pdf = new GenerateInvoicePdf(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        // add a page
        $pdf->AddPage();

        $txt = <<<EOD
		<style>
			* { font-family: DejaVu Sans, sans-serif; font-size: xx-small;}
			table{width: 100%;table-layout: fixed; border-spacing: -1px; }
			td{vertical-align: middle;}
			.tb{border-top: 1px solid grey;}
			.tB{border-top: 2px solid grey;}
			.bb{border-bottom: 1px solid grey;}
			.bB{border-bottom: 2px solid grey;}
			.lb{border-left: 1px solid grey;}
			.lB{border-left: 2px solid grey;}
			.rb{border-right: 1px solid grey;}
			.rB{border-right: 2px solid grey;}
			.dc{background-color: darkgrey; color: white;}
			.hc{background-color: grey; color: white;}
			.tl{text-align: left;}
			.tc{text-align: center;}
			.tr{text-align: right;vertical-align: middle;}
			.i1{width: 4%}
			.i2{width: 38%}
			.i3{width: 5%}
			.i4{width: 12%}
			.i5{width: 12%}
			.i6{width: 8%}
			.i7{width: 9%}
			.i8{width: 12%}
			.i25{width: 25%}
		</style>
EOD;


    $txt .= <<<EOD
        <table style="font-size: 10px;margin-top:50px" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                            <th colspan="4">Work Details</th>
                                            </tr>
                                            <tr>
                                                <td class="tb lb">Name </td>
                                                <td class="tb lb">Paid Days</td>
                                                <td class="tb lb rb">Total Amount</td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="tb lb bb ">{$data['employee']->userdetails->first_name}</td>
                                                <td class="tb lb bb">{$paid_days}</td>
                                                <td class="tb lb bb rb">{$data['net_pay']}</td>
                                                
                                            </tr>
                                        </table>
        EOD;

        // print a block of text using Write()
        $pdf->writeHTMLCell(192, 0, 9, '', $txt, 0, 1, 0, true, '', true);

        //Close and output PDF document
        $pdf->Output('example_003.pdf', 'I')->stream();

         
    }
}

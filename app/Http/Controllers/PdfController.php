<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Elibyy\TCPDF\Facades\TCPDF;
use App\Models\User;
use App\Models\Firebase;
use App\Models\EmployeeTimesheet;
use App\Models\Deduction;
use Carbon;

class PdfController extends Controller
{
    public function index() 
    {
        
        $view = \View::make('pdf.payslip');
        $html = $view->render();
        
        $pdf = new TCPDF();
        $pdf::SetTitle('Hello World');
        $pdf::AddPage();
        $pdf::writeHTML($html, true, false, true, false, '');
        $pdf::Output('hello_world.pdf');
    }
}

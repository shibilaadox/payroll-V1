<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class PaySlipController extends Controller
{
public function show()
    {
        return view('backend.project.payslip');
    }

    public function showInvoice($employeeProjectId)
{
    // Logic to generate payslip
    return view('backend.project.payslip', compact('employeeProjectId'));
}

}

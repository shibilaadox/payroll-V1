<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Project;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function getPaymentDetails($roleId)
    {
        $role = Project::find($roleId);
        if ($role) {
            return response()->json(['payment' => $role->payment]);
        }
        return response()->json(['payment' => '--']);
    }
}

<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Client;

class ClientController extends BaseController
{
    public function getClients()
    {
        $data = Client::orderBy('id','DESC')->get();
        return $this->sendResponse($data,"Success");
    }
}

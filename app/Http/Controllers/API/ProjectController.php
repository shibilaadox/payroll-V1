<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use App\Models\Project;
use Illuminate\Support\Carbon;


class ProjectController extends BaseController
{
   public function getProjects()
    {
        $user_id = auth('sanctum')->user()->id;
        $data = Project::with('clients')->with('employees')->orderBy('id','DESC')->get();
        return $this->sendResponse($data,"Success");
    }
}
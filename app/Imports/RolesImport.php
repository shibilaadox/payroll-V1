<?php

namespace App\Imports;

use App\Models\Roles;
use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;

class RolesImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

    public function model(array $row)
    {
        return new Roles([
            'name' => $row[0],
            'emph' => $row[1],
            'emhdmf' => $row[2],
            'emsss' => $row[3]
        ]);
    }
}

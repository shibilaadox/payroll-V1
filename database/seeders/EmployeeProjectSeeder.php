<?php

namespace Database\Seeders;

use App\Models\EmployeeProject;
use Illuminate\Database\Seeder;

class EmployeeProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        EmployeeProject::create([
            'user_id' => 1,
            'project_id' => 26,
            'payment' => 5000,
            'month' => 'July',
            'mode' => 'Online'
        ]);
    }
}

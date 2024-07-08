<?php

namespace Database\Seeders;

use App\Models\Deduction;
use Illuminate\Database\Seeder;

class DeductionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Deduction::create([
            'code' => 'AGB001',
            'ded_code' => 'SSCAL',
            'ded_no' => '003982',
            'ded_amt' => 842.09,
        ]);
    }
}

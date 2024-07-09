<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class DropDeductionsTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'drop:deductions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Drop the deductions table if it exists';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        DB::statement('DROP TABLE IF EXISTS deductions');
        $this->info('Deductions table dropped successfully.');
        return 0;
    }
}

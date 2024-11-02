<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToClientTimesheetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('client_timesheets', function (Blueprint $table) {
            if (!Schema::hasColumn('client_timesheets', 'payroll_period')) {
                $table->string('payroll_period');
            }
            if (!Schema::hasColumn('client_timesheets', 'payroll_date')) {
                $table->date('payroll_date');
            }
            if (!Schema::hasColumn('client_timesheets', 'week_number')) {
                $table->string('week_number', 10);
            }
            if (!Schema::hasColumn('client_timesheets', 'client_id')) {
                $table->foreignId('client_id')->constrained('clients');
            }
            if (!Schema::hasColumn('client_timesheets', 'branch_id')) {
                $table->foreignId('branch_id')->constrained('branches');
            }
            if (!Schema::hasColumn('client_timesheets', 'pay_type')) {
                $table->string('pay_type', 50);
            }
            if (!Schema::hasColumn('client_timesheets', 'month')) {
                $table->string('month', 2);
            }
            if (!Schema::hasColumn('client_timesheets', 'year')) {
                $table->string('year', 4);
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('client_timesheets', function (Blueprint $table) {
            $table->dropColumn([
                'payroll_period',
                'payroll_date',
                'week_number',
                'client_id',
                'branch_id',
                'pay_type',
                'month',
                'year',
            ]);
        });
    }
}

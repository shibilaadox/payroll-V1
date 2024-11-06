<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPayrollPeriodToUserTimesheetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_timesheets', function (Blueprint $table) {
            $table->date('payroll_period_start')->nullable();
        $table->date('payroll_period_end')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('user_timesheets', function (Blueprint $table) {
            $table->dropColumn(['payroll_period_start', 'payroll_period_end']);
        });
    }
}

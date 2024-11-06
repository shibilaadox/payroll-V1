<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToUserTimesheetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_timesheets', function (Blueprint $table) {
            if (!Schema::hasColumn('user_timesheets', 'payroll_period')) {
                $table->string('payroll_period');
            }
            if (!Schema::hasColumn('user_timesheets', 'payroll_date')) {
                $table->date('payroll_date');
            }
            if (!Schema::hasColumn('user_timesheets', 'week_number')) {
                $table->string('week_number', 10);
            }
            if (!Schema::hasColumn('user_timesheets', 'client_id')) {
                $table->foreignId('id')->constrained('clients');
            }
            if (!Schema::hasColumn('user_timesheets', 'location_id')) {
                $table->foreignId('location_id')->constrained('locations');
            }
            if (!Schema::hasColumn('user_timesheets', 'pay_type')) {
                $table->string('pay_type', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'month')) {
                $table->string('month', 2);
            }
            if (!Schema::hasColumn('user_timesheets', 'year')) {
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
        Schema::table('user_timesheets', function (Blueprint $table) {
            $table->dropColumn([
                'payroll_period',
                'payroll_date',
                'week_number',
                'client_id',
                'location_id',
                'pay_type',
                'month',
                'year',
            ]);
        });
    }
}

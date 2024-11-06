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
            if (!Schema::hasColumn('user_timesheets', 'user_id')) {
                $table->integer('user_id');
            }
            if (!Schema::hasColumn('user_timesheets', 'employee_code')) {
                $table->string('employee_code', 10);
            }
            if (!Schema::hasColumn('user_timesheets', 'payroll_period_start')) {
                $table->date('payroll_period_start');
            }
            if (!Schema::hasColumn('user_timesheets', 'payroll_period_end')) {
                $table->date('payroll_period_end');
            }
            if (!Schema::hasColumn('user_timesheets', 'payroll_date')) {
                $table->date('payroll_date');
            }
            if (!Schema::hasColumn('user_timesheets', 'week_number')) {
                $table->string('week_number', 10);
            }
            if (!Schema::hasColumn('user_timesheets', 'client_id')) {
                $table->integer('client_id');
            }
            if (!Schema::hasColumn('user_timesheets', 'location_id')) {
                $table->integer('location_id');
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
            if (!Schema::hasColumn('user_timesheets', 'date')) {
                $table->date('date');
            }
            if (!Schema::hasColumn('user_timesheets', 'company_code')) {
                $table->string('company_code', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'posicode')) {
                $table->string('posicode', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot1_hrs')) {
                $table->string('ot1_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot2_hrs')) {
                $table->string('ot2_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot3_hrs')) {
                $table->string('ot3_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot4_hrs')) {
                $table->string('ot4_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot5_hrs')) {
                $table->string('ot5_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot6_hrs')) {
                $table->string('ot6_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot7_hrs')) {
                $table->string('ot7_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot8_hrs')) {
                $table->string('ot8_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot9_hrs')) {
                $table->string('ot9_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot10_hrs')) {
                $table->string('ot10_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot11_hrs')) {
                $table->string('ot11_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot12_hrs')) {
                $table->string('ot12_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'ot13_hrs')) {
                $table->string('ot13_hrs', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'day8')) {
                $table->string('day8', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'day8')) {
                $table->string('day8_rate', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'day12')) {
                $table->string('day12', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'day12_rate')) {
                $table->string('day12_rate', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'nd_days')) {
                $table->string('nd_days', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'undertime')) {
                $table->string('undertime', 50);
            }
            if (!Schema::hasColumn('user_timesheets', 'incentive')) {
                $table->string('incentive', 50);
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
                'date',
        'company_code',
        'posicode',
        'ot1_hrs',
        'ot2_hrs', 
        'ot3_hrs', 
        'ot4_hrs',
        'ot5_hrs', 
        'ot6_hrs', 
        'ot7_hrs',
        'ot8_hrs', 
        'ot9_hrs', 
        'ot10_hrs', 
        'ot11_hrs', 
        'ot12_hrs', 
        'ot13_hrs',
        'day8',
        'day8_rate',
        'day12',
        'day12_rate',
        'nd_days',
        'undertime',
        'incentive'
                
            ]);
        });
    }
}

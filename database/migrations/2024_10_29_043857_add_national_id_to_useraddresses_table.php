<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNationalIdToUseraddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('useraddresses', function (Blueprint $table) {
            $table->string('present_national_id')->nullable()->after('permanent_country');
            $table->string('permanent_national_id')->nullable()->after('residential_country');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('useraddresses', function (Blueprint $table) {
            $table->dropColumn('present_national_id');
        $table->dropColumn('permanent_national_id');
        });
    }
}

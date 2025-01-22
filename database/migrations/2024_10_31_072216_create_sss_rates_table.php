<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSssRatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sss_rates', function (Blueprint $table) {
            $table->id();
            $table->string('limit');
            $table->string('emplr');
            $table->string('emply');
            $table->string('ecc');
            $table->string('emprov');
            $table->string('erprov');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('overtime_rates');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropDeductionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('deductions');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::create('deductions', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('ded_code');
            $table->string('ded_no');
            $table->decimal('ded_amt', 10, 2);
            $table->timestamps();
        });
    }
}

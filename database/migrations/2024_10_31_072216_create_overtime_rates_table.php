<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOvertimeRatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('overtime_rates', function (Blueprint $table) {
            $table->id();
            $table->string('dec1');
            $table->string('rate1');
            $table->string('cola1');
            $table->string('transpo1');

            $table->string('dec2');
            $table->string('rate2');
            $table->string('cola2');
            $table->string('transpo2');

            $table->string('dec3');
            $table->string('rate3');
            $table->string('cola3');
            $table->string('transpo3');

            $table->string('dec4');
            $table->string('rate4');
            $table->string('cola4');
            $table->string('transpo4');

            $table->string('dec5');
            $table->string('rate5');
            $table->string('cola5');
            $table->string('transpo5');

            $table->string('dec6');
            $table->string('rate6');
            $table->string('cola6');
            $table->string('transpo6');

            $table->string('dec7');
            $table->string('rate7');
            $table->string('cola7');
            $table->string('transpo7');

            $table->string('dec8');
            $table->string('rate8');
            $table->string('cola8');
            $table->string('transpo8');

            $table->string('dec9');
            $table->string('rate9');
            $table->string('cola9');
            $table->string('transpo9');

            $table->string('dec10');
            $table->string('rate10');
            $table->string('cola10');
            $table->string('transpo10');

            $table->string('dec11');
            $table->string('rate11');
            $table->string('cola11');
            $table->string('transpo11');

            $table->string('dec12');
            $table->string('rate12');
            $table->string('cola12');
            $table->string('transpo12');

            $table->string('dec13');
            $table->string('rate13');
            $table->string('cola13');
            $table->string('transpo13');

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

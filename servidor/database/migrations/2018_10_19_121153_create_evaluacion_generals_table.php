<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEvaluacionGeneralsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evaluaciones_generales', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('empresa_id')->unsigned();
            $table->foreign('empresa_id')
                    ->references('empresa_id')
                    ->on('empresas')
                    ->onDelete('cascade');
            $table->string('uno');
            $table->string('dos');
            $table->string('tres');
            $table->string('cuatro');
            $table->string('cinco');
            $table->string('seis');
            $table->string('siete');
            $table->string('ocho');
            $table->string('nueve');
            $table->softDeletes();
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
        Schema::dropIfExists('evaluaciones_generales');
    }
}

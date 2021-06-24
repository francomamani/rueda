<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEvaluacionReunionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evaluacion_reuniones', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('reunion_id')->unsigned();
            $table->foreign('reunion_id')
                ->references('reunion_id')
                ->on('reuniones')
                ->onDelete('cascade');
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
        Schema::dropIfExists('evaluacion_reuniones');
    }
}

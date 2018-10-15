<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHorarioOcupadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('horarios_ocupados', function (Blueprint $table) {
            $table->increments('horario_ocupado_id');
            $table->integer('empresa_id')->unsigned();
            $table->foreign('empresa_id')
                ->references('empresa_id')
                ->on('empresas')
                ->onDelete('cascade');
            $table->integer('horario_id')->unsigned();
            $table->foreign('horario_id')
                ->references('horario_id')
                ->on('horarios')
                ->onDelete('cascade');
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
        Schema::dropIfExists('horarios_ocupados');
    }
}

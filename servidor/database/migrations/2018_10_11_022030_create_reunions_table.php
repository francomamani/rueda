<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReunionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reuniones', function (Blueprint $table) {
            $table->increments('reunion_id');
            $table->integer('mesa_id')->unsigned();
            $table->foreign('mesa_id')
                    ->references('mesa_id')
                    ->on('mesas')
                    ->onDelete('cascade');
            $table->integer('empresa_solicitante_id')->unsigned();
            $table->integer('empresa_demandada_id')->unsigned();
            $table->boolean('empresa_solicitante_asistio')->default(false);
            $table->boolean('empresa_demandada_asistio')->default(false);
            $table->enum('resultado', ['satisfactoria', 'ausencia', 'agendado'])->default('agendado');
            $table->dateTime('desde');
            $table->dateTime('hasta');
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
        Schema::dropIfExists('reuniones');
    }
}

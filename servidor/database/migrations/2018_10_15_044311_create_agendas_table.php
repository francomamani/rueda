<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAgendasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agendas', function (Blueprint $table) {
            $table->increments('agenda_id');
            $table->integer('empresa_solicitante_id')->unsigned();
            $table->integer('empresa_demandada_id')->unsigned();
            $table->integer('horario_id')->unsigned();
            $table->enum('estado', ['aceptado', 'rechazado', 'pendiente']);
            $table->enum('tipo_asignacion', ['pre_agendado', 'administracion', 'cita_de_contingencia']);
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
        Schema::dropIfExists('agendas');
    }
}

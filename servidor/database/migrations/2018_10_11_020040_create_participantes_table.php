<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateParticipantesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participantes', function (Blueprint $table) {
            $table->increments('participante_id');
            $table->integer('empresa_id')->unsigned();
            $table->foreign('empresa_id')
                ->references('empresa_id')
                ->on('empresas')
                ->onDelete('cascade');
            $table->string('nombres');
            $table->string('apellidos');
            $table->string('carnet');
            $table->string('celular');
            $table->string('cargo');
            $table->boolean('es_usuario')->default(false);
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
        Schema::dropIfExists('participantes');
    }
}

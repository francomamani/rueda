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
            $table->integer('horario_id')->unsigned();
            $table->foreign('horario_id')
                ->references('horario_id')
                ->on('horarios')
                ->onDelete('cascade');
            $table->integer('empresa1_id')->unsigned();
            $table->integer('empresa2_id')->unsigned();
            $table->boolean('empresa1_asistio')->default(false);
            $table->boolean('empresa2_asistio')->default(false);
            $table->enum('resultado', ['satisfactoria', 'ausencia']);
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

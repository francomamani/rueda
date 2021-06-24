<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOfertaDemandasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('oferta_demandas', function (Blueprint $table) {
            $table->increments('oferta_demanda_id');
            $table->integer('empresa_id')->unsigned();
            $table->foreign('empresa_id')
                    ->references('empresa_id')
                    ->on('empresas')
                    ->onDelete('cascade');
            $table->text('descripcion');
            $table->string('producto_servicio');
            $table->enum('tipo', ['oferta', 'demanda']);
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
        Schema::dropIfExists('oferta_demandas');
    }
}

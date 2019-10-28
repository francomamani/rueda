<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmpresasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->increments('empresa_id');
            $table->integer('rubro_id')->unsigned();
            $table->foreign('rubro_id')
                  ->references('rubro_id')
                  ->on('rubros')
                  ->onDelete('cascade');
            $table->integer('usuario_id')->unsigned();
            $table->foreign('usuario_id')
                  ->references('usuario_id')
                  ->on('usuarios')
                  ->onDelete('cascade');
            $table->string('nombre');
            $table->string('logo')->nullable();
            $table->string('direccion');
            $table->string('telefono');
            $table->string('ciudad_localidad');
            $table->string('nit');
            $table->string('pagina_web')->nullable();
            $table->string('representante_legal');
            $table->boolean('habilitado')->default(false);
            $table->integer('max_participantes')->unsigned()->default(2);
            $table->text('oferta');
            $table->text('demanda');
            $table->boolean('especial')->default(false);
            $table->string('voucher')->nullable();
            $table->string('con_material')->default('no');
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
        Schema::dropIfExists('empresas');
    }
}

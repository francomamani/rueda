<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OfertaDemanda extends Model
{
    use SoftDeletes;
    protected $table = 'oferta_demandas';
    protected $primaryKey = 'oferta_demanda_id';
    protected $fillable = [
        'empresa_id',
        'descripcion',
        'producto_servicio',
        'tipo',
    ];
    protected $dates = ['deleted_at'];
}

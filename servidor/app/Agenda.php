<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Agenda extends Model
{
    use SoftDeletes;
    protected $table = 'agendas';
    protected $primaryKey = 'agenda_id';
    protected $fillable = [
        'empresa_solicitante_id',
        'empresa_demandada_id',
        'mesa_id',
        'horario_id',
        'estado',
        'tipo_asignacion',
    ];
    protected $dates = ['deleted_at'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reunion extends Model
{
    use SoftDeletes;
    protected $table = 'reuniones';
    protected $primaryKey = 'reunion_id';
    protected $fillable = [
        'empresa_solicitante_id',
        'empresa_demandada_id',
        'mesa_id',
        'horario_id',
        'resultado',
        'empresa_solicitante_asistio',
        'empresa_demandada_asistio',
    ];
    protected $dates = ['deleted_at'];

    public function horario() {
        return $this->belongsTo(Horario::class, 'horario_id');
    }

    public function mesa() {
        return $this->belongsTo(Mesa::class, 'mesa_id');
    }

}

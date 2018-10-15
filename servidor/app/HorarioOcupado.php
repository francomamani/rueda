<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HorarioOcupado extends Model
{
    protected $table = 'horarios';
    protected $primaryKey = 'horario_id';
    protected $fillable = [
        'empresa_id',
        'horario_id',
    ];
    protected $dates = ['deleted_at'];

    public function empresa() {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function horario() {
        return $this->belongsTo(Horario::class, 'horario_id');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Participante extends Model
{
    protected $table = 'participantes';
    protected $primaryKey = 'participante_id';
    protected $fillable = [
        'nombres',
        'apellidos',
        'carnet',
        'celular',
        'cargo',
    ];

    public function empresa() {
        return $this->belongsTo(Empresa::class, 'empresa_id')
    }

}

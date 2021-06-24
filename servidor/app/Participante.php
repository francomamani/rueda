<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Participante extends Model
{
    use SoftDeletes;
    protected $table = 'participantes';
    protected $primaryKey = 'participante_id';
    protected $fillable = [
        'empresa_id',
        'nombres',
        'apellidos',
        'carnet',
        'celular',
        'cargo',
        'es_usuario',
    ];
    protected $dates = ['deleted_at'];

    public function empresa() {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    protected $table = 'empresas';
    protected $primaryKey = 'empresa_id';
    protected $fillable = [
        'rubro_id',
        'usuario_id',
        'nombre',
        'logo',
        'direccion',
        'ciudad_localidad',
        'nit',
        'representante_legal',
        'habilitado',
        'max_participantes',
        'oferta',
        'demanda',
        'especial',
    ];
    protected $dates = ['dates'];

    public function usuario() {
        return $this->belongsTo(Usuario::class, 'usuario_id');
    }

    public function rubro() {
        return $this->belongsTo(Rubro::class, 'rubro_id');
    }

    public function participantes() {
        return $this->hasMany(Participante::class, 'participante_id');
    }
}

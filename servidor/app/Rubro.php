<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Rubro extends Model
{
    use SoftDeletes;
    protected $table = 'rubros';
    protected $primaryKey = 'rubro_id';
    protected $fillable = [
        'nombre',
        'descripcion'
    ];

    public function empresas() {
        return $this->hasMany(Empresa::class, 'rubro_id');
    }
}

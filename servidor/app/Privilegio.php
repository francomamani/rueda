<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Privilegio extends Model
{
    use SoftDeletes;
    protected $table = 'privilegios';
    protected $primaryKey = 'privilegio_id';
    protected $fillable = [
        'tipo_usuario_id',
        'ruta',
        'activo',
    ];
}

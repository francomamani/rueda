<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TipoUsuario extends Model
{
    use SoftDeletes;
    protected $table = 'tipo_usuarios';
    protected $primaryKey = "tipo_usuario_id";
    protected $fillable = [
        'nombre',
        'descripcion'
    ];
    protected $dates = ['deleted_at'];

}

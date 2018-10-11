<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table = 'usuarios';
    protected $primaryKey = 'tipo_usuario_id';
    protected $fillable = [
        'nombres',
        'apellidos',
        'email',
        'tipo_usuario',
        'password',
    ];
    protected $dates = ['deleted_at'];
    public function empresa() {
        return $this->hasOne(Empresa::class, 'usuario_id');
    }
}

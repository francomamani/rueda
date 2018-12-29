<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Usuario extends  Authenticatable
{
    use Notifiable;
    use SoftDeletes;
    protected $table = 'usuarios';
    protected $primaryKey = 'usuario_id';
    protected $fillable = [
        'nombres',
        'apellidos',
        'email',
        'cuenta',
        'telefono_celular',
        'whatsapp',
        'tipo_usuario',
        'password',
    ];
    protected $hidden = ['password'];
    protected $dates = ['deleted_at'];
    public function empresa() {
        return $this->hasOne(Empresa::class, 'usuario_id');
    }
    public static function boot()
    {
        parent::boot();
        static::deleting(function($padre) {
            $padre->empresa()->delete();
        });
    }

}

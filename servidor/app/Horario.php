<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Horario extends Model
{
    use SoftDeletes;
    protected $table = 'horarios';
    protected $primaryKey = 'horario_id';
    protected $fillable = [
        'inicio',
        'fin'
    ];
    protected $dates = ['deleted_at'];

    public function reuniones() {
        return $this->hasMany(Reunion::class, 'horario_id');
    }

}

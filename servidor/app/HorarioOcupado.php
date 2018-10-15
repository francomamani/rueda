<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HorarioOcupado extends Model
{
    use SoftDeletes;
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

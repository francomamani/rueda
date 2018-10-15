<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reunion extends Model
{
    use SoftDeletes;
    protected $table = 'reuniones';
    protected $primaryKey = 'reunion_id';
    protected $fillable = [
        'empresa1_id',
        'empresa2_id',
        'mesa_id',
        'horario_id',
        'resultado',
        'empresa1_asistio',
        'empresa2_asistio',
    ];
    protected $dates = ['deleted_at'];

    public function horario() {
        return $this->belongsTo(Horario::class, 'horario_id');
    }

    public function mesa() {
        return $this->belongsTo(Mesa::class, 'mesa_id');
    }

}

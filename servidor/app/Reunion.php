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
        'expositor1_id',
        'expositor2_id',
        'mesa_id',
        'horario_id',
        'resultado',
        'expositor1_asistio',
        'expositor2_asistio',
    ];

    public function horario() {
        return $this->belongsTo(Horario::class, 'horario_id');
    }

    public function mesa() {
        return $this->belongsTo(Mesa::class, 'mesa_id');
    }

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EvaluacionReunion extends Model
{
    use SoftDeletes;
    protected $table = 'evaluacion_reuniones';
    protected $fillable  = [
        'empresa_id',
        'reunion_id',
        'uno',
        'dos',
        'tres',
        'cuatro',
        'cinco',
        'seis',
        'siete',
    ];
    protected $dates = ['deleted_at'];
    public function empresa() {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
    public function reunion() {
        return $this->belongsTo(Reunion::class, 'reunion_id');
    }
}

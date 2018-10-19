<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EvaluacionGeneral extends Model
{
    use SoftDeletes;
    protected $table = "evaluaciones_generales";
    protected $fillable = [
        "empresa_id",
        "uno",
        "dos",
        "tres",
        "cuatro",
        "cinco",
        "seis",
        "siete",
        "ocho",
        "nueve",
    ];
    protected $dates = ["deleted_at"];
    public function empresa() {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
}

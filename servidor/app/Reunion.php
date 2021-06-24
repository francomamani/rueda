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
        'empresa_solicitante_id',
        'empresa_demandada_id',
        'mesa_id',
        'resultado',
        'empresa_solicitante_asistio',
        'empresa_demandada_asistio',
        'desde',
        'hasta',
    ];
    protected $dates = ['deleted_at'];

    protected $appends = ['empresa_solicitante', 'empresa_demandada'];

    public function getEmpresaSolicitanteAttribute()
    {
        return Empresa::find($this->empresa_solicitante_id);
    }

    public function getEmpresaDemandadaAttribute()
    {
        return Empresa::find($this->empresa_demandada_id);
    }

    public function mesa()
    {
        return $this->belongsTo(Mesa::class, 'mesa_id');
    }

    public function evaluacionReuniones()
    {
        return $this->hasMany(EvaluacionReunion::class, 'reunion_id');
    }

    public static function boot()
    {
        parent::boot();
        static::deleting(function ($padre) {
            $padre->evaluacionReuniones()->delete();
        });
    }

}

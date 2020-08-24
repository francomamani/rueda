<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Empresa extends Model
{
    use SoftDeletes;

    protected $table = 'empresas';
    protected $primaryKey = 'empresa_id';
    protected $fillable = [
        'rubro_id',
        'usuario_id',
        'nombre',
        'logo',
        'direccion',
        'telefono',
        'pagina_web',
        'ciudad_localidad',
        'nit',
        'representante_legal',
        'habilitado',
        'max_participantes',
        'oferta',
        'demanda',
        'especial',
        'voucher',
        'con_material',
    ];
    protected $dates = ['deleted_at'];
    protected $appends = ['rubro'];

    public function getRubroAttribute()
    {
        return Rubro::find($this->rubro_id);
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'usuario_id');
    }

    public function rubro()
    {
        return $this->belongsTo(Rubro::class, 'rubro_id');
    }

    public function participantes()
    {
        return $this->hasMany(Participante::class, 'empresa_id');
    }

    public function horariosOcupados()
    {
        return $this->hasMany(HorarioOcupado::class, 'empresa_id');
    }

    public function evaluacionGeneral()
    {
        return $this->hasOne(EvaluacionGeneral::class, 'empresa_id');
    }

    public function evaluacionReuniones()
    {
        return $this->hasMany(EvaluacionGeneral::class, 'empresa_id');
    }

    public static function boot()
    {
        parent::boot();
        static::deleting(function ($padre) {
            $padre->participantes()->delete();
            $padre->horariosOcupados()->delete();
            $padre->evaluacionGeneral()->delete();
            $padre->evaluacionGeneral()->delete();
            $padre->evaluacionReuniones()->delete();
        });
    }
}

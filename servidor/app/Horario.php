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

    public function horariosOcupados() {
        return $this->hasMany(HorarioOcupado::class, 'horario_id');
    }

    public static function boot()
    {
        parent::boot();
        static::deleting(function($padre) {
            $padre->horariosOcupados()->delete();
        });
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pais extends Model
{
    use SoftDeletes;

    protected $table = 'paises';
    protected $primaryKey = 'pais_id';
    protected $fillable = [
        'nombre',
        'codigo_marcado',
        'codigo'
    ];
    protected $dates = ['deleted_at'];
}

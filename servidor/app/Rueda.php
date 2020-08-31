<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Rueda extends Model
{
    use SoftDeletes;

    protected $table = 'rueda';
    protected $primaryKey = 'rueda_id';
    protected $fillable = [
        'habilitado'
    ];
    protected $dates = ['deleted_at'];
}

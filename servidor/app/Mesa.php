<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Mesa extends Model
{
    use SoftDeletes;
    protected $table = 'mesas';
    protected $primaryKey = 'mesa_id';
    protected $fillable = [
        'numero'
    ];
    protected $dates = ['deleted_at'];

    public function reuniones() {
        return $this->hasMany(Reunion::class, 'mesa_id');
    }
}

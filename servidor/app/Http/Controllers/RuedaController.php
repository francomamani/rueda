<?php

namespace App\Http\Controllers;

use App\Rueda;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class RuedaController extends Controller
{
    public function habilitar()
    {
        $rueda = Rueda::first();
        $rueda->update(['habilitado' => true]);
        return response()->json($rueda, 200);
    }

    public function deshabilitar()
    {
        $rueda = Rueda::first();
        $rueda->update(['habilitado' => false]);
        return response()->json($rueda, 200);
    }

    public function mostrar()
    {
        return response()->json(Rueda::first(), 200);
    }
}

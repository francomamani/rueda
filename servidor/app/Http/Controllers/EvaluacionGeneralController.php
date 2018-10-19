<?php

namespace App\Http\Controllers;

use App\EvaluacionGeneral;
use Illuminate\Http\Request;

class EvaluacionGeneralController extends Controller
{
    public function registrado($empresa_id) {
        $registros = EvaluacionGeneral::where('empresa_id', $empresa_id)->count();
        $registrado = false;
        if ($registros > 0 ){
            $registrado = true;
        }
        return response()->json([
            'registrado' => $registrado
        ], 200);
    }
    public function store() {
        $mensaje = '';
        $evaluacion = null;
        $empresas = EvaluacionGeneral::where('empresa_id', request()->input('empresa_id'))->count();
        if ($empresas === 0) {
            $evaluacion = EvaluacionGeneral::create(request()->all());
            $mensaje = "Encuesta general registrada";
        } else {
            $mensaje = "La empresa ya lleno la encuesta general";
        }
        return response()->json([
            'data' => $evaluacion,
            'mensaje' => $mensaje
        ], 201);
    }
}

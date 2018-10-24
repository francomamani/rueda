<?php

namespace App\Http\Controllers;

use App\EvaluacionGeneral;
use App\EvaluacionReunion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
            $mensaje = "La empresa ya lleno la evaluacion general";
        }
        return response()->json([
            'data' => $evaluacion,
            'mensaje' => $mensaje
        ], 201);
    }
    /*
     * La atencion brindada por los organizadores
     * */
    public function reporteGeneral($parametro) {
        $campos = $parametro . ', count(*) as total';
        $evaluaciones = EvaluacionGeneral::selectRaw($campos)
                        ->groupBy($parametro)->get()->toArray();
        $responses = [];
        foreach ($evaluaciones as $pregunta) {
            array_push($responses, [
                $pregunta[$parametro],
                $pregunta['total']
            ]);
        }
        return response()->json($responses, 200);
    }
    public function comentarios () {
        $comentarios = EvaluacionGeneral::join('empresas', 'empresas.empresa_id', '=', 'evaluaciones_generales.empresa_id')
                            ->selectRaw('empresas.nombre, empresas.empresa_id, nueve as comentario')
                            ->orderBy('empresas.nombre', 'asc')
                            ->get();
        return response()->json($comentarios, 200);
    }
}

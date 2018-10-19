<?php

namespace App\Http\Controllers;

use App\EvaluacionReunion;
use Illuminate\Http\Request;

class EvaluacionReunionController extends Controller
{
    public function store() {
        return response()->json(EvaluacionReunion::create(request()->all()), 201);
    }

    public function registrado($reunion_id, $empresa_id) {
        $registrado = false;
        $evaluaciones = EvaluacionReunion::where('reunion_id', $reunion_id)
                            ->where('empresa_id', $empresa_id)
                            ->count();
        if ($evaluaciones > 0) {
            $registrado = true;
        }
        return response()->json([
            'registrado' => $registrado
        ], 200);
    }

    public function reporteReunion($parametro) {
        $campos = $parametro . ', count(*) as total';
        $evaluaciones = EvaluacionReunion::selectRaw($campos)
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
}

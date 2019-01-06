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

    public function excelGeneral() {
        $excel = [];
        $evaluaciones = EvaluacionGeneral::join('empresas',
                                                'empresas.empresa_id', '=',
                                                'evaluaciones_generales.empresa_id')
                                            ->orderBy('empresas.nombre')
                                            ->get();
        foreach ($evaluaciones as $evaluacion) {
            array_push($excel, [
                'Empresa' => $evaluacion->nombre,
                '1.- La atención brindada por los organizadores' => $evaluacion->uno,
                '2.- El servicio de acreditación' => $evaluacion->dos,
                '3.- La organización de las reuniones' => $evaluacion->tres,
                '4.- La calidad de la información recibida antes del evento' => $evaluacion->cuatro,
                '5.- La calidad de la informción recibida durante el evento' => $evaluacion->cinco,
                '6.- Su empresa es' => $evaluacion->seis,
                '7.- ¿A través de que medio de comunicación tomó conocimiento de la realización del evento?' => $evaluacion->siete,
                '8.- ¿Participaría nuevamente en un evento de este tipo?' => $evaluacion->ocho,
                '9.- Comentario de la empresa'=> $evaluacion->nueve,
            ]);
        }
        return response()->json($excel,200);
    }
}

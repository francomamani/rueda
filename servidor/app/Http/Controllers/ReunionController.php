<?php

namespace App\Http\Controllers;

use App\Mesa;
use App\Reunion;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ReunionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return response()->json(Reunion::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        return response()->json(Reunion::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param Reunion $tipoUsuario
     * @return Response
     */
    public function show($id)
    {
        return response()->json(Reunion::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Reunion $tipoUsuario
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $reunion = Reunion::find($id);
        $reunion->update($request->all());
        return response()->json($reunion, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Reunion $tipoUsuario
     * @return Response
     */
    public function destroy($id)
    {
        $reunion = Reunion::find($id);
        $reunion->delete();
        return response()->json([
            'mensaje' => 'Reunion R' . $reunion->horario_id . '-' . $reunion->reunion_id . ' eliminada exitosamente'
        ], 200);
    }

    /*
     * listado de empresas agendadas por mesa dado una fecha
     * input: fecha
     * output: Reunion[]
     * */
    public function agendasMesa()
    {
        $fecha = \request('fecha');
        $mesas = Mesa::orderBy('numero', 'asc')->get();
        $responses = [];
        foreach ($mesas as $mesa) {
            $reuniones = Reunion::whereDate('desde', $fecha)
                ->where('mesa_id', (int)$mesa['mesa_id'])
                ->orderBy('desde', 'asc')->get()->toArray();
            array_push($responses, [
                'numero' => $mesa['numero'],
                'url' => $mesa['url'],
                'fecha' => $fecha,
                'reuniones' => $reuniones
            ]);
        }
        return response()->json($responses, 200);
    }
}

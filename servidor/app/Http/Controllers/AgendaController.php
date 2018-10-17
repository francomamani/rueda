<?php

namespace App\Http\Controllers;

use App\Agenda;
use App\Mesa;
use Illuminate\Http\Request;

class AgendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Agenda::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(Agenda::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Agenda  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Agenda::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Agenda  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $agenda = Agenda::find($id);
        $agenda->update($request->all());
        return response()->json($agenda, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Agenda  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $agenda = Agenda::find($id);
        $agenda->delete();
        return response()->json([
            'mensaje' => 'Agenda con id' . $agenda->agenda_id. ' eliminada exitosamente'
        ], 200);
    }

    public function solicitudesSalientes($empresa_id) {
        $solicitudes = Agenda::join('empresas', 'empresas.empresa_id', '=', 'agendas.empresa_demandada_id')
                                ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
                                ->join('horarios', 'horarios.horario_id', '=', 'agendas.horario_id')
                                ->where('empresa_solicitante_id', $empresa_id)
                                ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion')
                                ->orderBy('empresas.nombre', 'asc')
                                ->get();
        return response()->json($solicitudes, 200);
    }

    public function solicitudesEntrantes($empresa_id) {
        $solicitudes = Agenda::join('empresas', 'empresas.empresa_id', '=', 'agendas.empresa_solicitante_id')
            ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
            ->join('horarios', 'horarios.horario_id', '=', 'agendas.horario_id')
            ->where('empresa_demandada_id', $empresa_id)
            ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion')
            ->orderBy('empresas.nombre', 'asc')
            ->get();
        return response()->json($solicitudes, 200);

    }

    public function mesasDisponibles($horario_id) {
        $agendas = Agenda::where('horario_id', $horario_id)->get();
        $mesas_ocupadas_id = [];
        foreach ($agendas as $agenda) {
            array_push($mesas_ocupadas_id, $agenda->mesa_id);
        }
        $mesas_libres = Mesa::all()->except($mesas_ocupadas_id);
        return response()->json($mesas_libres, 200);
    }
}

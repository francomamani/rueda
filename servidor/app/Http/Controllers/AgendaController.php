<?php

namespace App\Http\Controllers;

use App\Agenda;
use App\Empresa;
use App\Horario;
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
        $agendas = Agenda::get();
        $data = [];
        foreach ($agendas as $agenda) {
            array_push($data, [
                'empresa_solicitante' => Empresa::find($agenda->empresa_solicitante_id),
                'empresa_demandada' => Empresa::find($agenda->empresa_demandada_id),
                'mesa' => Mesa::find($agenda->mesa_id)->numero,
                'inicio' => Horario::find($agenda->horario_id)->inicio,
                'fin' => Horario::find($agenda->horario_id)->fin,
                'estado' => $agenda->estado,
                'tipo_asignacion' => $agenda->tipo_asignacion,
            ]);
        }
        return response()->json($data, 200);
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
                                ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion, agendas.agenda_id')
                                ->orderBy('empresas.nombre', 'asc')
                                ->get();
        return response()->json($solicitudes, 200);
    }

    public function solicitudesEntrantes($empresa_id) {
        $solicitudes = Agenda::join('empresas', 'empresas.empresa_id', '=', 'agendas.empresa_solicitante_id')
            ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
            ->join('horarios', 'horarios.horario_id', '=', 'agendas.horario_id')
            ->where('empresa_demandada_id', $empresa_id)
            ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion, agendas.agenda_id')
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

    public function cambiarEstado() {
        $agenda_id = request()->input('agenda_id');
        $estado = request()->input('estado');
        $agenda = Agenda::find($agenda_id);
        $agenda->estado = $estado;
        $agenda->save();
        return response()->json($agenda, 200);
    }
}

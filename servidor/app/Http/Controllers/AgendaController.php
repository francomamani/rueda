<?php

namespace App\Http\Controllers;

use App\Agenda;
use App\Empresa;
use App\Horario;
use App\Mesa;
use App\Reunion;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AgendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $agendas = Agenda::get();
        $data = [];
        foreach ($agendas as $agenda) {
            if ($agenda->mesa_id !== 0 && $agenda->horario_id !== 0) {
                array_push($data, [
                    'empresa_solicitante' => Empresa::find($agenda->empresa_solicitante_id),
                    'empresa_demandada' => Empresa::find($agenda->empresa_demandada_id),
                    'mesa' => Mesa::find($agenda->mesa_id)->numero,
                    'inicio' => Horario::find($agenda->horario_id)->inicio,
                    'fin' => Horario::find($agenda->horario_id)->fin,
                    'url' => Mesa::find($agenda->mesa_id)->url,
                    'estado' => $agenda->estado,
                    'tipo_asignacion' => $agenda->tipo_asignacion,
                    'agenda_id' => $agenda->agenda_id,
                ]);
            }
        }
        return response()->json($data, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $agendadas = Agenda::where('empresa_solicitante_id', $request->empresa_solicitante_id)
            ->where('empresa_demandada_id', $request->empresa_demandada_id)
            ->where('estado', 'pendiente')
            ->count();
        $response = null;
        if ($agendadas > 0) {
            $response = [
                'message' => 'La reunión con la empresa ya fue agendada con anterioridad',
                'title' => 'Error'
            ];
        } else {
            Agenda::create($request->all());
            $response = [
                'message' => 'La reunión fue agendada exitosamente',
                'title' => 'Éxito'
            ];

        }
        return response()->json($response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param Agenda $tipoUsuario
     * @return Response
     */
    public function show($id)
    {
        return response()->json(Agenda::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Agenda $tipoUsuario
     * @return Response
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
     * @param Agenda $tipoUsuario
     * @return Response
     */
    public function destroy($id)
    {
        $agenda = Agenda::find($id);
        $agenda->delete();
        return response()->json([
            'mensaje' => 'Agenda con id' . $agenda->agenda_id . ' eliminada exitosamente'
        ], 200);
    }

    public function solicitudesSalientes($empresa_id)
    {
        $solicitudes = Agenda::join('empresas', 'empresas.empresa_id', '=', 'agendas.empresa_demandada_id')
            ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
            ->join('horarios', 'horarios.horario_id', '=', 'agendas.horario_id')
            ->join('mesas', 'mesas.mesa_id', '=', 'agendas.mesa_id')
            ->where('empresa_solicitante_id', $empresa_id)
            ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion, agendas.agenda_id, mesas.numero as mesa')
            ->orderBy('empresas.nombre', 'asc')
            ->get();
        return response()->json($solicitudes, 200);
    }

    public function solicitudesEntrantes($empresa_id)
    {
        $solicitudes = Agenda::join('empresas', 'empresas.empresa_id', '=', 'agendas.empresa_solicitante_id')
            ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
            ->join('horarios', 'horarios.horario_id', '=', 'agendas.horario_id')
            ->join('mesas', 'mesas.mesa_id', '=', 'agendas.mesa_id')
            ->where('empresa_demandada_id', $empresa_id)
            ->selectRaw('empresas.*, horarios.*, rubros.nombre as rubro, agendas.estado, agendas.tipo_asignacion, agendas.agenda_id, mesas.numero as mesa')
            ->orderBy('empresas.nombre', 'asc')
            ->get();
        return response()->json($solicitudes, 200);

    }

    public function mesasDisponibles($horario_id)
    {
        $agendas = Agenda::where('horario_id', $horario_id)->get();
        $mesas_ocupadas_id = [];
        foreach ($agendas as $agenda) {
            array_push($mesas_ocupadas_id, $agenda->mesa_id);
        }
        $mesas_libres = Mesa::all()->except($mesas_ocupadas_id);
        return response()->json($mesas_libres, 200);
    }

    public function cambiarEstado()
    {
        $agenda_id = request()->input('agenda_id');
        $estado = request()->input('estado');
        $agenda = Agenda::find($agenda_id);
        $agenda->estado = $estado;
        $agenda->save();
        if ($estado === 'aceptado') {
            Reunion::create([
                'empresa_solicitante_id' => $agenda->empresa_solicitante_id,
                'empresa_demandada_id' => $agenda->empresa_demandada_id,
                'mesa_id' => $agenda->mesa_id,
                'horario_id' => $agenda->horario_id,
            ]);
        }
        return response()->json($agenda, 200);
    }

    public function cancelarCita($agenda_id)
    {
        Agenda::destroy($agenda_id);
        return response()->json(['mensaje' => 'Cita eliminada con id: ' . $agenda_id], 200);
    }
}

<?php

namespace App\Http\Controllers;

use App\Empresa;
use App\Horario;
use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class EmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $empresas = Empresa::join('usuarios', 'usuarios.usuario_id', 'empresas.empresa_id')
                            ->join('rubros', 'rubros.rubro_id', 'empresas.rubro_id')
                            ->orderBy('empresas.nombre', 'asc')
                            ->selectRaw('empresas.*, usuarios.*, rubros.nombre as rubro')
                            ->paginate(10);
        return response()->json($empresas, 200);
    }

    public function listar() {
        return response()->json(Empresa::orderBy('nombre')->get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $usuario = [
            'nombres' => $request->input('nombres'),
            'apellidos' => $request->input('apellidos'),
            'email' => $request->input('email'),
            'tipo_usuario' => 'administrador',
            'password' => Hash::make($request->input('nit')),
        ];

        $empresa = [
            'rubro_id' => $request->input('rubro_id'),
            'usuario_id' => Usuario::create($usuario)->usuario_id,
            'nombre' => $request->input('nombre'),
            'logo' => null,
            'direccion' => $request->input('direccion'),
            'telefono' => $request->input('telefono'),
            'pagina_web' => $request->input('pagina_web'),
            'ciudad_localidad' => $request->input('ciudad_localidad'),
            'nit' => $request->input('nit'),
            'representante_legal' => $request->input('representante_legal'),
            'habilitado' => $request->input('habilitado'),
            'max_participantes' => $request->input('max_participantes'),
            'oferta' => $request->input('oferta'),
            'demanda' => $request->input('demanda'),
            'especial' => $request->input('especial'),
        ];
        $empresaModel = Empresa::create($empresa);
        return response()->json($empresaModel, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Empresa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Empresa::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Empresa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $empresa = Empresa::find($id);
        $empresa->update($request->all());
        return response()->json($empresa, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Empresa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $empresa = Empresa::find($id);
        $empresa->delete();
        return response()->json([
            'mensaje' => 'Empresa: ' . $empresa->nombre . ' eliminado exitosamente'
        ], 200);
    }

    public function participantes($empresa_id){
        $participantes = Empresa::find($empresa_id)->participantes()->get();
        return response()->json($participantes, 200);
    }

    public function horariosDisponibles($empresa_solicitante_id, $empresa_demandada_id) {
        $solicitante_horarios_ocupados = Empresa::find($empresa_solicitante_id)->horariosOcupados()->get();
        $demandada_horarios_ocupados = Empresa::find($empresa_demandada_id)->horariosOcupados()->get();
        $horarios_ocupados = [];
        foreach ($solicitante_horarios_ocupados as $horario_ocupado) {
            array_push($horarios_ocupados, $horario_ocupado->horario_id);
        }
        foreach ($demandada_horarios_ocupados as $horario_ocupado) {
            array_push($horarios_ocupados, $horario_ocupado->horario_id);
        }
        $horarios_disponibles = Horario::all()->except($horarios_ocupados);
        return response()->json($horarios_disponibles, 200);
    }

    public function horariosOcupados($empresa_id) {
        $horarios_ocupados = Empresa::find($empresa_id)->horariosOcupados()->get();
        return response()->json($horarios_ocupados, 200);
    }
}

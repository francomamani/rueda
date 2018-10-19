<?php

namespace App\Http\Controllers;

use App\Empresa;
use App\Horario;
use App\Mesa;
use App\Participante;
use App\Reunion;
use App\Rubro;
use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use phpDocumentor\Reflection\DocBlock\Tags\Return_;

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
            'tipo_usuario' => 'empresa',
            'password' => Hash::make($request->input('nit')),
        ];

        if ($request->hasFile('logo')){
            $path_logo = $request->file('logo')->store('logos');
            $empresa = [
                'rubro_id' => $request->input('rubro_id'),
                'usuario_id' => Usuario::create($usuario)->usuario_id,
                'nombre' => $request->input('nombre'),
                'logo' => $path_logo,
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
        } else {
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
        }
        $empresaModel = Empresa::create($empresa);
        $participante1 = [
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => $request->input('p1_nombres'),
            'apellidos' => $request->input('p1_apellidos'),
            'carnet' => $request->input('p1_carnet'),
            'celular' => $request->input('p1_celular'),
            'cargo' => $request->input('p1_cargo'),
        ];
        Participante::create($participante1);
        $p2_nombres =$request->input('p2_nombres');
        if (strlen($p2_nombres) > 0) {
            $participante2 = [
                'empresa_id' => $empresaModel->empresa_id,
                'nombres' => $request->input('p2_nombres'),
                'apellidos' => $request->input('p2_apellidos'),
                'carnet' => $request->input('p2_carnet'),
                'celular' => $request->input('p2_celular'),
                'cargo' => $request->input('p2_cargo'),
            ];
            Participante::create($participante2);
        }
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
        $horarios_ocupados = Empresa::find($empresa_id)->horariosOcupados()->with(['horario', 'empresa'])->get();
        return response()->json($horarios_ocupados, 200);
    }
    public function misReuniones($empresa_id) {
        $reuniones = Reunion::where('empresa_solicitante_id', $empresa_id)
                            ->orWhere('empresa_demandada_id', $empresa_id)
                            ->get();
        $data = [];
        foreach ($reuniones as $reunion) {
            $reunionItem = [
                'empresa_solicitante' => Empresa::with('rubro')->find($reunion->empresa_solicitante_id),
                'empresa_demandada' => Empresa::with('rubro')->find($reunion->empresa_demandada_id),
                'mesa' => Mesa::find($reunion->mesa_id)->numero,
                'inicio' => Horario::find($reunion->horario_id)->inicio,
                'fin' => Horario::find($reunion->horario_id)->fin,
                'resultado' => $reunion->resultado,
                'fecha_hora_registro_reunion' => $reunion->created_at,
                'reunion_id' => $reunion->reunion_id,
            ];
            array_push($data, $reunionItem);
        }
        return response()->json($data, 200);
    }

    public function buscar() {
        $rubro_id = request()->input('rubro_id');
        $search = request()->input('search');
        $empresas = null;
        if ((int)$rubro_id === 0) {
            $empresas = Empresa::with('rubro')
                ->where('nombre', 'like', '%'.$search.'%')
                ->orWhere('direccion', 'like', '%'.$search.'%')
                ->orWhere('telefono', 'like', '%'.$search.'%')
                ->orWhere('pagina_web', 'like', '%'.$search.'%')
                ->orWhere('ciudad_localidad', 'like', '%'.$search.'%')
                ->orWhere('nit', 'like', '%'.$search.'%')
                ->orWhere('representante_legal', 'like', '%'.$search.'%')
                ->orWhere('oferta', 'like', '%'.$search.'%')
                ->orWhere('demanda', 'like', '%'.$search.'%')
                ->get();
        } else {
            $empresas = Empresa::with('rubro')->where('rubro_id', (int)$rubro_id)
                ->where(function ($query) use ($search) {
                    $query->orWhere('nombre', 'like', '%'.$search.'%')
                        ->orWhere('direccion', 'like', '%'.$search.'%')
                        ->orWhere('telefono', 'like', '%'.$search.'%')
                        ->orWhere('pagina_web', 'like', '%'.$search.'%')
                        ->orWhere('ciudad_localidad', 'like', '%'.$search.'%')
                        ->orWhere('nit', 'like', '%'.$search.'%')
                        ->orWhere('representante_legal', 'like', '%'.$search.'%')
                        ->orWhere('oferta', 'like', '%'.$search.'%')
                        ->orWhere('demanda', 'like', '%'.$search.'%');
                })
                ->get();
        }
        return response()->json($empresas, 200);
    }

    public function logo($empresa_id) {
        $logo_url = Empresa::find($empresa_id)->logo;
        if(strlen($logo_url) > 0) {
            return response()->file(storage_path('app/' . $logo_url));
        } else {
            return response()->file(storage_path('app/logos/empresa.png'));
        }
    }
}

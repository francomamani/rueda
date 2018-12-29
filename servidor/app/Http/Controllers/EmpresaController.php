<?php

namespace App\Http\Controllers;

use App\Agenda;
use App\Empresa;
use App\Horario;
use App\Mesa;
use App\Participante;
use App\Reunion;
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
                            ->whereNull('empresas.deleted_at')
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
            'cuenta' => $request->input('cuenta'),
            'telefono_celular' => $request->input('telefono_celular'),
            'whatsapp' => $request->input('whatsapp'),
            'tipo_usuario' => 'empresa',
            'password' => Hash::make($request->input('password')),
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
        $usuario = Usuario::join('empresas', 'empresas.usuario_id', '=','usuarios.usuario_id')
            ->join('rubros', 'rubros.rubro_id', '=','empresas.rubro_id')
            ->with('empresa.participantes')
            ->where('usuarios.usuario_id', $empresa->usuario_id)
            ->selectRaw('usuarios.*, empresas.*, rubros.nombre as rubro')
            ->first();
        return response()->json($usuario, 200);
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
        Usuario::destroy($empresa->usuario_id);
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
        $solicitante_horarios_agendados = $this->misHorariosAgendados($empresa_solicitante_id);
        $demandada_horarios_agendados = $this->misHorariosAgendados($empresa_demandada_id);

        $horarios_ocupados = [];
        foreach ($solicitante_horarios_ocupados as $horario_ocupado) {
            array_push($horarios_ocupados, $horario_ocupado->horario_id);
        }
        foreach ($demandada_horarios_ocupados as $horario_ocupado) {
            array_push($horarios_ocupados, $horario_ocupado->horario_id);
        }
        foreach ($demandada_horarios_ocupados as $horario_ocupado) {
            array_push($horarios_ocupados, $horario_ocupado->horario_id);
        }

        foreach ($solicitante_horarios_agendados as $horario_agendado) {
            array_push($horarios_ocupados, $horario_agendado->horario_id);
        }
        foreach ($demandada_horarios_agendados as $horario_agendado) {
            array_push($horarios_ocupados, $horario_agendado->horario_id);
        }

        $horarios_disponibles = Horario::all()->except($horarios_ocupados);
        return response()->json($horarios_disponibles, 200);
    }

    public function horariosOcupados($empresa_id) {
        $horarios_boolean = [];
/*        $horarios_ocupados = Empresa::find($empresa_id)->horariosOcupados()->with(['horario', 'empresa'])->get();*/
        $horarios_ocupados = Empresa::find($empresa_id)->horariosOcupados()->get();
/*        $horarios_ocupados = HorarioOcupado::get();*/
        $horarios= Horario::get();
        $found = false;
        foreach ($horarios as $horario) {
            foreach ($horarios_ocupados as $horario_ocupado) {
                if ($horario->horario_id === $horario_ocupado->horario_id) {
                    array_push($horarios_boolean, [
                        'horario_id' => $horario->horario_id,
                        'ocupado' => true,
                        'inicio' => $horario->inicio,
                        'fin' => $horario->fin,
                    ]);
                    $found = true;
                }
            }
            if ($found === false) {
                array_push($horarios_boolean, [
                    'horario_id' => $horario->horario_id,
                    'ocupado' => false,
                    'inicio' => $horario->inicio,
                    'fin' => $horario->fin,
                ]);
            } else {
                $found = false;
            }
        }
        return response()->json($horarios_boolean, 200);
/*        return response()->json($horarios_ocupados, 200);*/
    }

    private function misHorariosAgendados($empresa_id) {
        $horarios = Agenda::where('empresa_solicitante_id', $empresa_id)
                        ->orWhere('empresa_demandada_id', $empresa_id)
                        ->where('estado', '!=', 'rechazado')
                        ->get();
        return $horarios;
    }

    public function misReuniones($empresa_id) {
        $reuniones = Reunion::where('empresa_solicitante_id', $empresa_id)
                            ->orWhere('empresa_demandada_id', $empresa_id)
                            ->orderBy('reuniones.desde')
                            ->selectRaw('reuniones.*')
                            ->get();
        $data = [];
        foreach ($reuniones as $reunion) {
            $reunionItem = [
                'empresa_solicitante' => Empresa::with('rubro')->find($reunion->empresa_solicitante_id),
                'empresa_demandada' => Empresa::with('rubro')->find($reunion->empresa_demandada_id),
                'mesa' => Mesa::find($reunion->mesa_id)->numero,
                'resultado' => $reunion->resultado,
                'fecha_hora_registro_reunion' => $reunion->created_at,
                'desde' => $reunion->desde,
                'hasta' => $reunion->hasta,
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

    public function cambiarLogo($empresa_id) {
        $empresa = Empresa::find($empresa_id);
        if(request()->hasFile('logo')) {
            $path_logo = request()->file('logo')->store('logos');
            $empresa->logo = $path_logo;
            $empresa->save();
        }
        $usuario = Usuario::join('empresas', 'empresas.usuario_id', '=','usuarios.usuario_id')
            ->join('rubros', 'rubros.rubro_id', '=','empresas.rubro_id')
            ->with('empresa.participantes')
            ->where('usuarios.usuario_id', $empresa->usuario_id)
            ->selectRaw('usuarios.*, empresas.*, rubros.nombre as rubro')
            ->first();

        return response()->json($usuario, 200);
    }
    public function mostrarLogo($logo_path) {
        return response()->file(storage_path('app/logos/' . $logo_path));
    }
    /*
     * agendar reunion entre empresas
     * */
    public function agendar() {
        $empresa_solicitante_id = request()->input('empresa_solicitante_id');
        $empresa_demandada_id = request()->input('empresa_demandada_id');
        $mesas = Mesa::get();
        $cantidad_mesas = Mesa::count();
        $aleatorio = rand(1, $cantidad_mesas);
        $count = 1;
        $aleatorio_dates = rand(0, 4);
        $dates = [
            ['2018-12-11 08:30:00', '2018-12-11 08:50:00'],
            ['2018-12-11 09:00:00', '2018-12-11 09:20:00'],
            ['2018-12-11 09:30:00', '2018-12-11 09:50:00'],
            ['2018-12-11 10:00:00', '2018-12-11 10:20:00'],
            ['2018-12-11 10:30:00', '2018-12-11 10:50:00'],
        ];
        foreach ($mesas as $mesa) {
            if ($count === $aleatorio) {
                $mesa_id = $mesa->mesa_id;
            }
            $count++;
        }
        $data = [
            'empresa_solicitante_id' => $empresa_solicitante_id,
            'empresa_demandada_id' => $empresa_demandada_id,
            'mesa_id' => $mesa_id,
            'resultado' => 'cronogramado',
            'empresa_solicitante_asistio' => false,
            'empresa_demandada_asistio' => false,
            'desde' => $dates[$aleatorio_dates][0],
            'hasta' => $dates[$aleatorio_dates][1],
        ];
        $reunion = Reunion::create($data);
        return response()->json($reunion, 200);
    }
}

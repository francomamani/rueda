<?php

namespace App\Http\Controllers;

use App\Agenda;
use App\Empresa;
use App\Horario;
use App\HorarioOcupado;
use App\Mesa;
use App\Participante;
use App\Reunion;
use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use PhpParser\Node\Stmt\Return_;

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
                            ->where('empresas.habilitado', true)
                            ->orderBy('empresas.nombre', 'asc')
                            ->selectRaw('empresas.*, usuarios.*, rubros.nombre as rubro')
                            ->paginate(10);
        return response()->json($empresas, 200);
    }

    public function miListaHabilitados($empresa_id) {
        $empresas_agendadas = [];
        $r_solicitante = Reunion::where('empresa_solicitante_id', $empresa_id)->get();
        $r_demandada = Reunion::where('empresa_demandada_id', $empresa_id)->get();
        foreach ($r_solicitante as $record) {
            array_push($empresas_agendadas, $record->empresa_demandada_id);
        }
        foreach ($r_demandada as $record) {
            array_push($empresas_agendadas, $record->empresa_solicitante_id);
        }
        array_push($empresas_agendadas, $empresa_id);
        $empresas = Empresa::all()->except($empresas_agendadas);
        $habilitados = [];
        foreach ($empresas as $empresa) {
            if ($empresa->habilitado == true) {
                array_push($habilitados, $empresa);
            }
        }
        return response()->json($habilitados, 200);
    }
    public function listarHabilitados() {
        return response()->json(Empresa::where('habilitado', true)->orderBy('nombre')->get(), 200);
    }

    public function listar() {
        $empresas = Empresa::join('rubros', 'rubros.rubro_id', '=', 'empresas.rubro_id')
                            ->with('usuario')
                            ->orderBy('empresas.nombre')
                            ->selectRaw('rubros.nombre as rubro, empresas.*')
                            ->get();
        return response()->json($empresas, 200);
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
            if ($request->hasFile('voucher')) {
                $path_voucher = $request->file('voucher')->store('vouchers');
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
                    'voucher' => $path_voucher,
                ];
            } else {
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
                    'voucher' => null,
                ];
            }
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
                'voucher' => null,
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
        $empresa = Empresa::join('rubros', 'rubros.rubro_id', '=', 'empresas.rubro_id')
                            ->selectRaw('rubros.nombre as rubro, empresas.*')
                            ->find($id);
        return response()->json($empresa, 200);

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
        $horarios= Horario::orderBy('inicio')->get();
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
                'reunion_id' => $reunion->reunion_id,
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
    * agregar la restriccion de subhorarios disponibles para
    * una nueva agenda
    * reuniones_agendadas < num_subhorarios_posibles(solicitante y demandada)
    */
    private function meEsPosibleAgendar($empresa_id) {
        /*
         * Cantidad máxima de subhorarios
         * */
        $cantidad_subhorarios = 0;
        $ocupados_id = [];
        $horarios_ocupados = HorarioOcupado::where('empresa_id', $empresa_id)->get();
        foreach ($horarios_ocupados as $registro) {
            if (!$this->existe($registro->horario_id, $ocupados_id)) {
                array_push($ocupados_id, $registro->horario_id);
            }
        }
        $horarios_libres = Horario::all()->except($ocupados_id);
        foreach ($horarios_libres as $horario_libre) {
            $subhorarios = $this->generarSubhorarios($horario_libre->inicio, $horario_libre->fin);
            $cantidad_subhorarios += sizeof($subhorarios);;
        }
        /*
         * Reuniones ya agendadas con la empresa
         * c_r_s Cantidad de reuniones como solicitante
         * c_r_d Cantidad de reuniones como empresa demandada
         * */
        $c_r_s = Reunion::where('empresa_solicitante_id', $empresa_id)->count();
        $c_r_d = Reunion::where('empresa_demandada_id', $empresa_id)->count();

        $reuniones_agendadas = $c_r_s + $c_r_d;
        return $reuniones_agendadas < $cantidad_subhorarios;
    }
    /*
     * Es posible agendar la reunion en el horario
     * para las dos empresas de acuerdo al numero
     * de reuniones ya agendadas y permitidas
     * */
    private function esPosibleAgendar($empresa_solicitante_id, $empresa_demandada_id) {
        /*
         * res0 => es posible
         * res1 => tu empresa ya tiene el maximo de reuniones posibles
         * res2 => la empresa con quien quiere agendar ya tiene a tope sus
         * reuniones agendadas
         *
         * agregar la restriccion de subhorarios disponibles para
         * una nueva agenda
         * reuniones_agendadas < num_subhorarios_posibles(solicitante y demandada)
         * */
        $messages = [];
        $status_solicitante = null;
        $status_demandada = null;
        $reuniones_por_empresa = $this->reunionesPorEmpresa();


        $es_ed = Reunion::where('empresa_solicitante_id', $empresa_solicitante_id)
            ->where('empresa_demandada_id', $empresa_demandada_id)
            ->count();

        $ed_es = Reunion::where('empresa_solicitante_id', $empresa_demandada_id)
            ->where('empresa_demandada_id', $empresa_solicitante_id)
            ->count();

        $reuniones_solicitante = Reunion::where('empresa_solicitante_id', $empresa_solicitante_id)
                ->orWhere('empresa_demandada_id', $empresa_solicitante_id)
                ->count();
        $reuniones_demandada = Reunion::where('empresa_solicitante_id', $empresa_demandada_id)
                ->orWhere('empresa_demandada_id', $empresa_demandada_id)
                ->count();
        $solicitante = $this->meEsPosibleAgendar($empresa_solicitante_id);
        $demandada = $this->meEsPosibleAgendar($empresa_demandada_id);
        $es_posible = $solicitante && $demandada;
        if ($es_posible) {
            if($es_ed + $ed_es === 0) {
                if ($reuniones_solicitante < $reuniones_por_empresa) {
                    $status_solicitante = true;
                } else {
                    array_push($messages, 'Tu empresa ya tiene el maximo de reuniones posibles');
                }
                if ($reuniones_demandada < $reuniones_por_empresa) {
                    $status_demandada = true;
                } else {
                    array_push($messages, 'La empresa con quien quiere agendar ya tiene a tope sus reuniones agendadas');
                }
                $status = $status_solicitante && $status_demandada;
                $response = [
                    'status' => $status,
                    'message' => $messages,
                ];
            } else {
                $response = [
                    'status' => false,
                    'message' => [
                        'Ya se agendó una reunión con anterioridad con esta empresa'
                    ]
                ];
            }
        } else {
            if ($solicitante == false && $demandada == false) {
                $response = [
                    'status' => false,
                    'message' => [
                        'Todos los horarios disponibles en su empresa y en la demandada estan ocupadas'
                    ]
                ];
            } else {
                if($solicitante == false) {
                    $response = [
                        'status' => false,
                        'message' => [
                            'Todos sus horarios estan ocupados. Si quiere agregar a "' .
                            Empresa::find($empresa_demandada_id)->nombre
                            .'" cancele una de sus reuniones previamente agendadas'
                        ]
                    ];
                }
                if($demandada == false) {
                    $response = [
                        'status' => false,
                        'message' => [
                            'Todos los horarios de la empresa "' .
                            Empresa::find($empresa_demandada_id)->nombre
                            .'" estan ocupadas, elija a otra empresa por favor'
                        ]
                    ];
                }
            }
        }
        return $response;
    }
    private function reunionesPorEmpresa() {
        /*horarios*/
        $horarios = Horario::get();
        $total_mesas = Mesa::count();
        $total_empresas = Empresa::count();
        $total_horarios = 0;
        foreach ($horarios as $horario) {
            $fin = $horario->fin;
            $inicio = $horario->inicio;
            $time = strtotime($fin) - strtotime($inicio);
            $cantidad_horarios = round($time/1800);
            $total_horarios += $cantidad_horarios;
        }
        return $total_horarios * $total_mesas / $total_empresas;
    }

    /*
     * Un item existe en el array
     * */
    private function existe($item, $array) {
        $res = false;
        foreach ($array as $record) {
            if ($item == $record) {
                $res = true;
            }
        }
        return $res;
    }
    /*
     * horarios libres entre la empresa solicitante y la empresa
     * demanda
     * */
    /*
        $dates = [
            ['2018-12-11 08:30:00', '2018-12-11 08:50:00'],
            ['2018-12-11 09:00:00', '2018-12-11 09:20:00'],
            ['2018-12-11 09:30:00', '2018-12-11 09:50:00'],
            ['2018-12-11 10:00:00', '2018-12-11 10:20:00'],
            ['2018-12-11 10:30:00', '2018-12-11 10:50:00'],
        ];
    */

    private function generarSubhorarios($desde, $hasta) {
        $subhorarios = [];
        $start = strtotime($desde);
        $end = strtotime($hasta);
        $difference = $end - $start;
        $schedule = round($difference/1800);
        for($i = 0 ; $i < $schedule; $i++) {
            $time1 = $end - 600;
            $time2 = $end - 1800;
            array_push($subhorarios, [
                date('Y-m-d H:i:s', $time2), date('Y-m-d H:i:s', $time1)
            ]);
            $end = $end - 1800;
        }
        return $subhorarios;
    }
    private function horariosLibres($ocupadosSolicitante, $ocupadosDemandada) {
        /*
         * horario_id[]
         * */
        $ocupados_id = [];
        foreach ($ocupadosSolicitante as $registro) {
            if (!$this->existe($registro->horario_id, $ocupados_id)) {
                array_push($ocupados_id, $registro->horario_id);
            }
        }
        foreach ($ocupadosDemandada as $registro) {
            if (!$this->existe($registro->horario_id, $ocupados_id)) {
                array_push($ocupados_id, $registro->horario_id);
            }
        }
/*        $horarios = Horario::orderBy('inicio', 'asc')->get();*/
        $horarios_libres = Horario::all()->except($ocupados_id);
        $libres = [];
        /*
         * crear subhorarios
         *
         * */
/*        foreach ($horarios as $horario) {
            if (!$this->existe($horario->horario_id, $ocupados_id)) {
                $subhorarios = $this->generarSubhorarios($horario->inicio, $horario->fin);
                foreach ($subhorarios as $subhorario) {
                    array_push($libres, $subhorario);
                }
            }
        }*/
        foreach ($horarios_libres as $horario_libre) {
            $subhorarios = $this->generarSubhorarios($horario_libre->inicio, $horario_libre->fin);
            foreach ($subhorarios as $subhorario) {
                array_push($libres, $subhorario);
            }
        }
        return $libres;
    }
    /*
     * agendar reunion entre empresas
     * y revisa que la reunion ya exista en la bdd
     * */
    private function generarAleatorios($dates, $empresa_solicitante_id, $empresa_demandada_id) {
        $mesas = Mesa::get();
        $cantidad_mesas = Mesa::count();
        do {
            $aleatorio_mesas = rand(1, $cantidad_mesas);
            $aleatorio_dates = rand(0, sizeof($dates) - 1);
            $count = 1;
            foreach ($mesas as $mesa) {
                if ($count === $aleatorio_mesas) {
                    $mesa_id = $mesa->mesa_id;
                }
                $count++;
            }
            /*
             * si algun de las empresas esta ocupada en ese horario
             * */
            $es_s = Reunion::where('desde', $dates[$aleatorio_dates][0])
                             ->where('hasta', $dates[$aleatorio_dates][1])
                             ->where('empresa_solicitante_id', $empresa_solicitante_id)
                             ->count();

            $es_d = Reunion::where('desde', $dates[$aleatorio_dates][0])
                             ->where('hasta', $dates[$aleatorio_dates][1])
                             ->where('empresa_demandada_id', $empresa_solicitante_id)
                             ->count();

            $ed_s = Reunion::where('desde', $dates[$aleatorio_dates][0])
                             ->where('hasta', $dates[$aleatorio_dates][1])
                             ->where('empresa_solicitante_id', $empresa_demandada_id)
                             ->count();

            $ed_d = Reunion::where('desde', $dates[$aleatorio_dates][0])
                             ->where('hasta', $dates[$aleatorio_dates][1])
                             ->where('empresa_demandada_id', $empresa_demandada_id)
                             ->count();

/*            $es_ed = Reunion::where('empresa_solicitante_id', $empresa_solicitante_id)
                            ->where('empresa_demandada_id', $empresa_demandada_id)
                            ->count();

            $ed_es = Reunion::where('empresa_solicitante_id', $empresa_demandada_id)
                            ->where('empresa_demandada_id', $empresa_solicitante_id)
                            ->count();*/
            /*
             * si la mesa ya fue asignada a otra reunion
             * */
            $reuniones = Reunion::where('mesa_id', $mesa_id)
                                ->where('desde', $dates[$aleatorio_dates][0])
                                ->where('hasta', $dates[$aleatorio_dates][1])
                                ->count();

        } while(($es_s + $es_d + $ed_s + $ed_d + $reuniones) > 0);
        return [
            'mesa_id' => $mesa_id,
            'desde' => $dates[$aleatorio_dates][0],
            'hasta' => $dates[$aleatorio_dates][1],
        ];
    }
    public function agendar() {
        $empresa_solicitante_id = request()->input('empresa_solicitante_id');
        $empresa_demandada_id = request()->input('empresa_demandada_id');
        $ocupadosSolicitante = HorarioOcupado::where('empresa_id', $empresa_solicitante_id)->get();
        $ocupadosDemanda = HorarioOcupado::where('empresa_id', $empresa_demandada_id)->get();
        $dates = $this->horariosLibres($ocupadosSolicitante, $ocupadosDemanda);

        $response = $this->esPosibleAgendar($empresa_solicitante_id, $empresa_demandada_id);
        if ($response['status']) {
            $aleatorio = $this->generarAleatorios($dates, $empresa_solicitante_id, $empresa_demandada_id);
            $data = [
                'empresa_solicitante_id' => $empresa_solicitante_id,
                'empresa_demandada_id' => $empresa_demandada_id,
                'mesa_id' => $aleatorio['mesa_id'],
                'resultado' => 'agendado',
                'empresa_solicitante_asistio' => false,
                'empresa_demandada_asistio' => false,
                'desde' => $aleatorio['desde'],
                'hasta' => $aleatorio['hasta'],
            ];
            $reunion = Reunion::create($data);
            return response()->json([
                'status' => true,
                'message' => [
                    'La reunión con "' . Empresa::find($empresa_demandada_id)->nombre .
                    '" se agendó con éxito, revise su agenda para comprobar'
                ],
                'reunion' => $reunion
            ], 200);
        } else {
            return response()->json($response, 200);
        }
    }

    public function habilitar($empresa_id) {
        $empresa = Empresa::find($empresa_id);
        $empresa->habilitado = true;
        $empresa->save();
        return response()->json($empresa, 200);
    }

    public function voucher($empresa_id) {
        $empresa = Empresa::find($empresa_id);
        return response()->file(storage_path('app/' . $empresa->voucher));
    }

    public function subirComprobante($empresa_id) {
        $response = [
            'status' => false
        ];
        if(request()->hasFile('comprobante')) {
            $path_voucher = request()->file('comprobante')->store('vouchers');
            $empresa = Empresa::find($empresa_id);
            $empresa->voucher = $path_voucher;
            $empresa->save();
            $response['status'] = true;
        }
        return response()->json($response, 200);
    }

    public function agendas() {
        $empresas = Empresa::join('rubros', 'rubros.rubro_id', '=', 'empresas.rubro_id')
                            ->where('habilitado', true)
                            ->orderBy('nombre')
                            ->selectRaw('empresas.empresa_id, empresas.nombre, rubros.nombre as rubro, rubros.rubro_id')
                            ->get();
        $agendas = [];
        foreach ($empresas as $empresa) {
            $data = Reunion::join('mesas', 'mesas.mesa_id', '=', 'reuniones.mesa_id')
                    ->join('empresas', 'empresas.empresa_id', '=', 'reuniones.empresa_demandada_id')
                    ->join('rubros', 'rubros.rubro_id', '=', 'empresas.rubro_id')
                    ->where('reuniones.empresa_solicitante_id', $empresa->empresa_id)
                    ->orWhere('reuniones.empresa_demandada_id', $empresa->empresa_id)
                    ->selectRaw('empresas.nombre as empresa, 
                                mesas.numero as mesa, 
                                reuniones.empresa_solicitante_id, 
                                reuniones.empresa_demandada_id, 
                                reuniones.desde, 
                                reuniones.hasta,
                                rubros.nombre as rubro')
                    ->orderBy('reuniones.desde')
                    ->get();
            $reuniones = [];
            foreach ($data as $record) {
                array_push($reuniones, [
                   'empresa' => strtoupper($record->empresa),
                   'mesa' => strtoupper($record->mesa),
                   'desde' => $record->desde,
                   'hasta' => $record->hasta,
                   'rubro' => strtoupper($record->rubro),
                   'empresa_solicitante' => strtoupper(Empresa::find($record->empresa_solicitante_id)->nombre),
                   'empresa_demandada' => strtoupper(Empresa::find($record->empresa_demandada_id)->nombre),
                ]);
            }
            array_push($agendas, [
                'empresa' => $empresa,
                'reuniones' => $reuniones
            ]);
        }
        return response()->json([
            'empresas' => sizeof($empresas),
            'agendas' => $agendas
        ], 200);
    }
}

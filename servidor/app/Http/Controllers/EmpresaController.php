<?php

namespace App\Http\Controllers;

use App\Empresa;
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
                    ->orderBy('empresas.nombre', 'asc')
                    ->get();
        return response()->json($empresas, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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

        $usuario = Usuario::create($usuario);
        $empresa = [
            'rubro_id' => $request->input('rubro_id'),
            'usuario_id' => $usuario->usuario_id,
            'nombre' => $request->input('nombre'),
            'logo' => null,
            'direccion' => $request->input('direccion'),
            'ciudad_localidad' => $request->input('ciudad_localidad'),
            'nit' => $request->input('nit'),
            'representante_legal' => $request->input('representante_legal'),
            'habilitado' => $request->input('habilitado'),
            'max_participantes' => $request->input('max_participantes'),
            'oferta' => $request->input('oferta'),
            'demanda' => $request->input('demanda'),
            'especial' => $request->input('especial'),
        ];

        Empresa::create($empresa);

        return response()->json(Empresa::create($request->all()), 201);
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
     * Show the form for editing the specified resource.
     *
     * @param  \App\Empresa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function edit(Empresa $tipoUsuario)
    {
        //
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
}

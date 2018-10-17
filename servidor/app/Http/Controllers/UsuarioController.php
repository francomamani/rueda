<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Http\Request;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Usuario::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(Usuario::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Usuario  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Usuario::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuario  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $usuario = Usuario::find($id);
        $usuario->nombres = $request->input('nombres');
        $usuario->apellidos = $request->input('apellidos');
        $usuario->email = $request->input('email');
        $usuario->save();

        $response = null;
        if($usuario->tipo_usuario === 'administrador') {
            $response = $usuario;
        } else {
            $response = Usuario::join('empresas', 'empresas.usuario_id', '=','usuarios.usuario_id')
                ->join('rubros', 'rubros.rubro_id', '=','empresas.rubro_id')
                ->with('empresa.participantes')
                ->where('usuarios.email', $usuario->email)
                ->selectRaw('usuarios.*, empresas.*, rubros.nombre as rubro')
                ->first();
        }

        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Usuario  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $usuario = Usuario::find($id);
        $usuario->delete();
        return response()->json([
            'mensaje' => 'Usuario: ' . $usuario->nombre . ' eliminado exitosamente'
        ], 200);
    }
}

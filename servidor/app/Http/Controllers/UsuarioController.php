<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Usuario::with('empresa')->orderBy('cuenta')->get(), 200);
    }

    public function administradores() {
        $usuarios = Usuario::where('tipo_usuario', 'administrador')->orderBy('cuenta')->get();
        return response()->json($usuarios);
    }
    public function searchAdministradores() {
        $value = \request()->input('value');
        $usuarios = Usuario::where('tipo_usuario', 'administrador')
                            ->where(function ($query) use ($value){
                                $query->orWhere('nombres', 'like', "%{$value}%");
                                $query->orWhere('apellidos', 'like', "%{$value}%");
                                $query->orWhere('cuenta', 'like', "%{$value}%");
                                $query->orWhere('telefono_celular', 'like', "%{$value}%");
                            })
                            ->orderBy('cuenta')->get();
        return response()->json($usuarios, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $usuario = new Usuario();
        $usuario->nombres = $request->input('nombres');
        $usuario->apellidos = $request->input('apellidos');
        $usuario->cuenta = $request->input('cuenta');
        $usuario->email = $request->input('email');
        $usuario->tipo_usuario = 'administrador';
        $usuario->cuenta = $request->input('cuenta');
        $usuario->telefono_celular = $request->input('telefono_celular');
        $usuario->whatsapp = $request->input('whatsapp');
        $usuario->password = Hash::make($request->input('password'));
        $usuario->save();
        return response()->json($usuario, 201);
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
        $usuario->telefono_celular = $request->input('telefono_celular');
        $usuario->whatsapp = $request->input('whatsapp');
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

    public function logo() {
        return response()->file(storage_path('app/logos/usuario.png'));
    }
    public function loadLogo($tipo) {
        $file = null;
        switch ($tipo) {
            case 'expoteco' :
                $file = storage_path('app/logos/expoteco.png');
                break;
            case 'campo_ferial' :
                $file = storage_path('app/logos/campo_ferial.png');
                break;
        }
        return response()->file($file);
    }

    public function resetPassword($usuario_id) {
        $usuario = Usuario::find($usuario_id);
        $usuario->password = Hash::make($usuario->cuenta);
        $usuario->save();
        return response()->json($usuario, 200);
    }
}

<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Validator;
class AuthController extends Controller
{
    public function login() {
        $credentials = request()->only('cuenta', 'password');
        $rules = [
            'cuenta' => 'required',
            'password' => 'required|min:3',
        ];
        $validator = Validator::make($credentials, $rules);
        if ($validator->fails()) {
            return response()->json([
                'autenticado' => false,
                'mensaje' => $validator->messages()
            ], 500);
        }
        try {
            \Config::set('auth.providers.users.model', \App\Usuario::class);
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json([
                    'autenticado' => false,
                    'mensaje' => 'Las credenciales son incorrectas'
                ], 401);
            }
        } catch (JWTException $e) {
            return response()->json([
                'autenticado' => false,
                'mensaje' => 'Error durante la autenticacion, por favor intente nuevamente'],
                500);
        }
        $usuario = null;
        $usuarioModel = Usuario::where('cuenta', request()->input('cuenta'))->first();
        if($usuarioModel->tipo_usuario === 'administrador') {
            $usuario = $usuarioModel;
        } else {
            $usuario = Usuario::with('empresa.participantes')
                    ->join('empresas', 'empresas.usuario_id', '=','usuarios.usuario_id')
                    ->join('rubros', 'rubros.rubro_id', '=','empresas.rubro_id')
                    ->where('usuarios.cuenta', request()->input('cuenta'))
                    ->selectRaw('usuarios.*, empresas.*, rubros.nombre as rubro')
                    ->first();
        }
        return response()->json([
            'autenticado' => true,
            'token' => $token,
            'usuario' => $usuario,
            'mensaje' => 'Usuario autenticado exitosamente'
        ], 200);
    }

    public function cambiarPassword($usuario_id) {
        $current_password = request()->input('current_password');
        $new_password = request()->input('new_password');
        $repeat_new_password = request()->input('repeat_new_password');

        $usuario = Usuario::find($usuario_id);
        $mensaje = "";
        if (Hash::check($current_password, $usuario->password)) {
            if ($new_password === $repeat_new_password) {
                $usuario->password = Hash::make($new_password);
                $usuario->save();
                $mensaje  = "Contraseña actualizada exitosamente";
            } else {
                $mensaje  = "Las nuevas contraseñas no coinciden";
            }
        } else {
            $mensaje = "Por favor ingresa nuevamente su contraseña actual";
        }

        return response()->json(['mensaje' => $mensaje], 200);
    }
}

<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Validator;
class AuthController extends Controller
{
    public function login() {
        $credentials = request()->only('email', 'password');
        $rules = [
            'email' => 'required|email',
            'password' => 'required|min:8',
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
        $usuario = Usuario::where('email', request()->input('email'))->first();
        return response()->json([
            'autenticado' => true,
            'token' => $token,
            'usuario' => $usuario,
            'mensaje' => 'Usuario autenticado exitosamente'
        ], 200);

    }
}
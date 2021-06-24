<?php

namespace App\Http\Controllers;

use App\Empresa;
use App\Participante;
use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ParticipanteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Participante::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(Participante::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Participante  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Participante::find($id));

    }

    private function createCuenta($nombres, $carnet) {
        $cuenta = strtolower($nombres);
        return explode(" ", $cuenta)[0] . $carnet;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Participante  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $participante = Participante::find($id);
        $data = $request->all();
        if ($participante['es_usuario'] === 1) {
            $empresa = Empresa::find($participante['empresa_id']);
            $usuario = Usuario::find($empresa['usuario_id']);
            $usuario->nombres = $data['nombres'];
            $usuario->apellidos = $data['apellidos'];
            $usuario->cuenta = $this->createCuenta($data['nombres'], $data['carnet']);
            $usuario->password = Hash::make($data['carnet']);
            $usuario->telefono_celular = $data['celular'];
            $usuario->whatsapp = $data['celular'];
            $usuario->save();
        }
        $participante->update($request->all());
        return response()->json($participante, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Participante  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $participante = Participante::find($id);
        $participante->delete();
        return response()->json([
            'mensaje' => 'Participante: ' . $participante->nombres . ' '. $participante->apellidos . ' eliminado exitosamente'
        ], 200);
    }
}

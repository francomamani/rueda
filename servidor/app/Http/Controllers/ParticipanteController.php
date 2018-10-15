<?php

namespace App\Http\Controllers;

use App\Participante;
use Illuminate\Http\Request;

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

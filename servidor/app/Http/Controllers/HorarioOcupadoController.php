<?php

namespace App\Http\Controllers;

use App\HorarioOcupado;
use Illuminate\Http\Request;

class HorarioOcupadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(HorarioOcupado::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(HorarioOcupado::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\HorarioOcupado  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(HorarioOcupado::find($id));

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\HorarioOcupado  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $horarios_ocupados = HorarioOcupado::find($id);
        $horarios_ocupados->update($request->all());
        return response()->json($horarios_ocupados, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\HorarioOcupado  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $horarios_ocupados = HorarioOcupado::find($id);
        $horarios_ocupados->delete();
        return response()->json([
            'mensaje' => 'Horario ocupado con id: ' . $horarios_ocupados->horario_id. ' liberado exitosamente'
        ], 200);
    }
}

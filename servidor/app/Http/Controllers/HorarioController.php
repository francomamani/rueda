<?php

namespace App\Http\Controllers;

use App\Horario;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class HorarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return response()->json(Horario::orderBy('inicio')->get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        return response()->json(Horario::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param Horario $tipoUsuario
     * @return Response
     */
    public function show($id)
    {
        return response()->json(Horario::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Horario $tipoUsuario
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $horario = Horario::find($id);
        $horario->update($request->all());
        return response()->json($horario, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Horario $tipoUsuario
     * @return Response
     */
    public function destroy($id)
    {
        $horario = Horario::find($id);
        $horario->delete();
        return response()->json([
            'mensaje' => 'Horario del: ' . $horario->inicio . ' hasta ' . $horario->fin . ' eliminado exitosamente'
        ], 200);
    }

}

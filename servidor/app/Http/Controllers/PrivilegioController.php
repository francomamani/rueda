<?php

namespace App\Http\Controllers;

use App\Privilegio;
use Illuminate\Http\Request;

class PrivilegioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Privilegio::get(), 200);
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
        return response()->json(Privilegio::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Privilegio  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Privilegio::find($id));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Privilegio  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function edit(Privilegio $tipoUsuario)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Privilegio  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $privilegio = Privilegio::find($id);
        $privilegio->update($request->all());
        return response()->json($privilegio, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Privilegio  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $privilegio = Privilegio::find($id);
        $privilegio->delete();
        return response()->json([
            'mensaje' => 'Privilegio: ' . $privilegio->ruta . ' eliminado exitosamente'
        ], 200);
    }

}
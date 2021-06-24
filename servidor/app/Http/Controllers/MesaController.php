<?php

namespace App\Http\Controllers;

use App\Mesa;
use Illuminate\Http\Request;

class MesaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Mesa::get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return response()->json(Mesa::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Mesa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Mesa::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Mesa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $mesa = Mesa::find($id);
        $mesa->update($request->all());
        return response()->json($mesa, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Mesa  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $mesa = Mesa::find($id);
        $mesa->delete();
        return response()->json([
            'mensaje' => 'Mesa: ' . $mesa->numero . ' eliminado exitosamente'
        ], 200);
    }

}

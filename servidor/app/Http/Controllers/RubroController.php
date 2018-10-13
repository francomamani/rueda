<?php

namespace App\Http\Controllers;

use App\Rubro;
use Illuminate\Http\Request;

class RubroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Rubro::orderBy('nombre', 'asc')->get(), 200);
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
        return response()->json(Rubro::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Rubro  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Rubro::find($id));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Rubro  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function edit(Rubro $tipoUsuario)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Rubro  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rubro = Rubro::find($id);
        $rubro->update($request->all());
        return response()->json($rubro, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Rubro  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $rubro = Rubro::find($id);
        $rubro->delete();
        return response()->json([
            'mensaje' => 'Rubro: ' . $rubro->nombre . ' eliminado exitosamente'
        ], 200);
    }
}

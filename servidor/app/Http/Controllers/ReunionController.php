<?php

namespace App\Http\Controllers;

use App\Reunion;
use Illuminate\Http\Request;

class ReunionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Reunion::get(), 200);
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
        return response()->json(Reunion::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Reunion  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Reunion::find($id));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Reunion  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function edit(Reunion $tipoUsuario)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Reunion  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $reunion = Reunion::find($id);
        $reunion->update($request->all());
        return response()->json($reunion, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Reunion  $tipoUsuario
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $reunion = Reunion::find($id);
        $reunion->delete();
        return response()->json([
            'mensaje' => 'Reunion R' . $reunion->horario_id .'-'. $reunion->reunion_id. ' eliminada exitosamente'
        ], 200);
    }

}

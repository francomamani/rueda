<?php

namespace App\Http\Controllers;

use App\Rubro;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class RubroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return response()->json(Rubro::orderBy('nombre', 'asc')->get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        return response()->json(Rubro::create($request->all()), 201);
    }

    /**
     * Display the specified resource.
     *
     * @param Rubro $tipoUsuario
     * @return Response
     */
    public function show($id)
    {
        return response()->json(Rubro::find($id));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Rubro $tipoUsuario
     * @return Response
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
     * @param Rubro $tipoUsuario
     * @return Response
     */
    public function destroy($id)
    {
        $rubro = Rubro::find($id);
        $rubro->delete();
        return response()->json([
            'mensaje' => 'Rubro: ' . $rubro->nombre . ' eliminado exitosamente'
        ], 200);
    }

    public function upload()
    {
        $rubros = \request()->all();
        foreach ($rubros as $rubro) {
            Rubro::create($rubro);
        }
        return response()->json([
            'exito' => 'upload rubros updated!'
        ]);
    }
}

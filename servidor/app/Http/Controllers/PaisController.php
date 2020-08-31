<?php

namespace App\Http\Controllers;

use App\Pais;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PaisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return response()->json(Pais::orderBy('nombre', 'asc')->get(), 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $paises = $request->all();
        foreach ($paises as $pais) {
            Pais::create([
                'nombre' => $pais['nombre'],
                'codigo_marcado' => $pais['codigo_marcado'],
                'codigo' => $pais['codigo']
            ]);
        }
        return response()->json('Paises cargados', 200);
    }

    /**
     * Display the specified resource.
     *
     * @param Pais $pais
     * @return Response
     */
    public function show(Pais $pais)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Pais $pais
     * @return Response
     */
    public function edit(Pais $pais)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Pais $pais
     * @return Response
     */
    public function update(Request $request, Pais $pais)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Pais $pais
     * @return Response
     */
    public function destroy(Pais $pais)
    {
        //
    }
}

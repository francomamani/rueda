<?php

namespace App\Http\Controllers;

use App\OfertaDemanda;
use Illuminate\Http\Request;

class OfertaDemandaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(OfertaDemanda::get(), 200);
    }


    public function ofertas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'oferta')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
    }
    public function demandas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'demanda')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
    }
    public function productoOfertas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'oferta')
                                ->where('producto_servicio', '=', 'producto')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
    }
    public function servicioOfertas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'oferta')
                                ->where('producto_servicio', '=', 'servicio')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
    }
    public function productoDemandas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'demanda')
                                ->where('producto_servicio', '=', 'producto')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
    }
    public function servicioDemandas() {
        $ofertas = OfertaDemanda::where('tipo', '=', 'demanda')
                                ->where('producto_servicio', '=', 'servicio')
                                ->orderBy('oferta_demanda_id', 'desc')->get();
        return response()->json($ofertas, 200);
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
        $oferta_demanda = OfertaDemanda::create($request->all());
        return response()->json($oferta_demanda, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\OfertaDemanda  $ofertaDemanda
     * @return \Illuminate\Http\Response
     */
    public function show(OfertaDemanda $ofertaDemanda)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\OfertaDemanda  $ofertaDemanda
     * @return \Illuminate\Http\Response
     */
    public function edit(OfertaDemanda $ofertaDemanda)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\OfertaDemanda  $ofertaDemanda
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, OfertaDemanda $ofertaDemanda)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\OfertaDemanda  $ofertaDemanda
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $oferta_demanda = OfertaDemanda::find($id);
        $oferta_demanda->delete();
        return  response()->json($oferta_demanda, 200);
    }
}

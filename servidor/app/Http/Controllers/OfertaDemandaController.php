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
    public function destroy(OfertaDemanda $ofertaDemanda)
    {
        //
    }
}
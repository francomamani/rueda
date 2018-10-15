<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::post('login', 'AuthController@login');
Route::get('empresas-listar', 'EmpresaController@listar');
Route::resource('usuarios', 'UsuarioController');
Route::resource('empresas', 'EmpresaController');
Route::resource('participantes', 'ParticipanteController');
Route::resource('rubros', 'RubroController');
Route::resource('horarios', 'HorarioController');
Route::resource('horarios_ocupados', 'HorarioOcupadoController');
Route::resource('mesas', 'MesaController');
Route::resource('reuniones', 'ReunionController');
Route::resource('agendas', 'AgendaController');
Route::get('empresa/{empresa_id}/participantes', 'EmpresaController@participantes');


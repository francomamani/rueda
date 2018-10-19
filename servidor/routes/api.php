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
Route::resource('horarios-ocupados', 'HorarioOcupadoController');
Route::resource('mesas', 'MesaController');
Route::resource('reuniones', 'ReunionController');
Route::resource('agendas', 'AgendaController');
Route::get('empresa/{empresa_id}/participantes', 'EmpresaController@participantes');
Route::get('horarios-disponibles/{empresa_solicitante_id}/{empresa_demandada_id}', 'EmpresaController@horariosDisponibles');
Route::get('mis-horarios-ocupados/{empresa_id}', 'EmpresaController@horariosOcupados');
Route::get('mis-reuniones/{empresa_id}', 'EmpresaController@misReuniones');
Route::post('buscar-empresas', 'EmpresaController@buscar');
Route::get('solicitudes-salientes/{empresa_id}', 'AgendaController@solicitudesSalientes');
Route::get('solicitudes-entrantes/{empresa_id}', 'AgendaController@solicitudesEntrantes');
Route::get('mesas-disponibles/{horario_id}', 'AgendaController@mesasDisponibles');
Route::post('cambiar-estado', 'AgendaController@cambiarEstado');
Route::get('empresa-logo/{empresa_id}', 'EmpresaController@logo');
Route::get('usuario-logo', 'UsuarioController@logo');
Route::get('load-logo/{tipo}', 'UsuarioController@loadLogo');








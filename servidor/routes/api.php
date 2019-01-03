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
Route::get('empresas-listar-habilitados', 'EmpresaController@listarHabilitados');
Route::resource('usuarios', 'UsuarioController');
Route::resource('empresas', 'EmpresaController');
Route::resource('participantes', 'ParticipanteController');
Route::resource('rubros', 'RubroController');
Route::resource('horarios', 'HorarioController');
Route::resource('horarios-ocupados', 'HorarioOcupadoController');
Route::resource('mesas', 'MesaController');
Route::resource('reuniones', 'ReunionController');
Route::resource('agendas', 'AgendaController');
Route::resource('evaluaciones-generales', 'EvaluacionGeneralController');
Route::resource('evaluacion-reuniones', 'EvaluacionReunionController');
Route::get('evaluacion-registrada/{empresa_id}', 'EvaluacionGeneralController@registrado');
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

Route::get('evaluacion-reunion-registrada/{reunion_id}/{empresa_id}/', 'EvaluacionReunionController@registrado');
Route::get('reporte-general/{parametro}', 'EvaluacionGeneralController@reporteGeneral');
Route::get('reporte-reunion/{parametro}', 'EvaluacionReunionController@reporteReunion');

Route::post('cambiar-logo/{empresa_id}', 'EmpresaController@cambiarLogo');
Route::get('mostrar-logo/{logo_path}', 'EmpresaController@mostrarLogo');

Route::post('cancelar-cita/{agenda_id}', 'AgendaController@cancelarCita');

Route::post('cambiar-password/{usuario_id}', 'AuthController@cambiarPassword');
Route::get('reset-password/{usuario_id}', 'UsuarioController@resetPassword');
Route::get('comentarios-generales', 'EvaluacionGeneralController@comentarios');
Route::get('comentarios-reuniones', 'EvaluacionReunionController@comentarios');

Route::get('generar-backup', 'BackupController@generarBackup');


Route::post('update-horario-ocupado', 'HorarioOcupadoController@updateHorarioOcupado');
Route::post('agendar', 'EmpresaController@agendar');


Route::get('habilitar/{empresa_id}', 'EmpresaController@habilitar');
Route::get('voucher/{empresa_id}', 'EmpresaController@voucher');
Route::post('subir-comprobante/{empresa_id}', 'EmpresaController@subirComprobante');

Route::get('mi-lista-habilitados/{empresa_id}', 'EmpresaController@miListaHabilitados');
Route::get('agendas', 'EmpresaController@agendas');

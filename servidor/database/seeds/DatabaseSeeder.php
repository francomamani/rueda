<?php

use App\Empresa;
use App\Mesa;
use App\Participante;
use App\Rubro;
use App\Usuario;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();
        /*inicio de rubros*/

        $rubros = [
            [
                "nombre" => "AGRÍCOLA"
            ],
            [
                "nombre" => "ALIMENTOS Y BEBIDAS"
            ],
            [
                "nombre" => "ALMACENAMIENTO Y DISTRIBUCIÓN"
            ],
            [
                "nombre" => "ARTES ESCENICAS"
            ],
            [
                "nombre" => "ARTES LITERARIAS"
            ],
            [
                "nombre" => "ARTES MUSICALES"
            ],
            [
                "nombre" => "ARTES PLASTICAS"
            ],
            [
                "nombre" => "ARTESANIAS"
            ],
            [
                "nombre" => "ARTÍCULOS DE LIMPIEZA Y DESINFECCION"
            ],
            [
                "nombre" => "ARTÍCULOS"
            ],
            [
                "nombre" => "BANCOS Y FINANCIERAS"
            ],
            [
                "nombre" => "CÁMARAS Y ORGANIZACIONES EMPRESARIALES"
            ],
            [
                "nombre" => "COMPAÑÍA DE TRADING"
            ],
            [
                "nombre" => "COSMÉTICOS"
            ],
            [
                "nombre" => "CUERO CALZADO Y MANUFACTURAS DE CUERO"
            ],
            [
                "nombre" => "ELECTRODOMÉSTICOS Y LÍNEA BLANCA"
            ],
            [
                "nombre" => "ENVASES"
            ],
            [
                "nombre" => "EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA"
            ],
            [
                "nombre" => "EQUIPOS E IMPLEMENTOS HIDRAULICOS"
            ],
            [
                "nombre" => "EQUIPOS ELÉCTRICOS"
            ],
            [
                "nombre" => "FARMACIA"
            ],
            [
                "nombre" => "FERRETERÍA Y HERRAMIENTAS"
            ],
            [
                "nombre" => "FLETES Y TRANSPORTE"
            ],
            [
                "nombre" => "GOBIERNO Y SUS ORGANISMOS"
            ],
            [
                "nombre" => "HIDROCARBUROS"
            ],
            [
                "nombre" => "INDUSTRIA DE ENERGIAS LIMPIAS"
            ],
            [
                "nombre" => "INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL"
            ],
            [
                "nombre" => "INDUSTRIA ENERGETICA"
            ],
            [
                "nombre" => "INDUSTRIA METALURGICA"
            ],
            [
                "nombre" => "INDUSTRIA PAPELERA Y GRÁFICA"
            ],
            [
                "nombre" => "INDUSTRIA TEXTIL"
            ],
            [
                "nombre" => "JOYERÍA. BISUTERÍA Y ORFEBRERÍA"
            ],
            [
                "nombre" => "JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO"
            ],
            [
                "nombre" => "MERCADOTECNIA"
            ],
            [
                "nombre" => "METALMECÁNICA Y ELECTROMECÁNICA"
            ],
            [
                "nombre" => "MINERIA ENERGETICA"
            ],
            [
                "nombre" => "MINERIA METALURGICA"
            ],
            [
                "nombre" => "MINERIA NO METALURGICA"
            ],
            [
                "nombre" => "ORGANISMOS INTERNACIONALES"
            ],
            [
                "nombre" => "ORGANIZACIONES DE ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE"
            ],
            [
                "nombre" => "OTROS"
            ],
            [
                "nombre" => "OTROS SERVICIOS"
            ],
            [
                "nombre" => "PLÁSTICOS O AFINES"
            ],
            [
                "nombre" => "PRODUCCION AUDIOVISUAL"
            ],
            [
                "nombre" => "PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN"
            ],
            [
                "nombre" => "QUÍMICOS Y REACTIVOS"
            ],
            [
                "nombre" => "SEGUROS"
            ],
            [
                "nombre" => "SERVICIOS ADUANEROS"
            ],
            [
                "nombre" => "SERVICIOS DE CONSULTORIA AMBIENTAL"
            ],
            [
                "nombre" => "SERVICIOS DE CONSULTORIA EN SEGURIDAD INDUSTRIAL"
            ],
            [
                "nombre" => "SERVICIOS DE COSTRUCCIÓN E INGENIERÍA"
            ],
            [
                "nombre" => "SERVICIOS EMPRESARIALES"
            ],
            [
                "nombre" => "SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN"
            ],
            [
                "nombre" => "SERVICIOS PARA LA AGROINDUSTRIA"
            ],
            [
                "nombre" => "SERVICIOS Y ORGANIZACION DE EVENTOS"
            ],
            [
                "nombre" => "TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA"
            ],
            [
                "nombre" => "TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN"
            ],
            [
                "nombre" => "TURISMO"
            ],
            [
                "nombre" => "VEHÍCULOS AUTOMOTORES"
            ]
        ];
        foreach ($rubros as $rubro) {
            Rubro::create($rubro);
        }

        /*fin de rubros*/
        for ($i = 0; $i < 5; $i++) {
            Mesa::create([
                "numero" => $i + 1
            ]);
        }
        $usuarioAdmin = [
            'nombres' => 'Ebeliz',
            'apellidos' => 'Fuentes Claros',
            'email' => 'ebelizfuentes@gmail.com',
            'cuenta' => 'admin123456789',
            'telefono_celular' => '71100743',
            'whatsapp' => '71100743',
            'password' => Hash::make('123456789')
        ];
        Usuario::create($usuarioAdmin);


        $usuario = [
            'nombres' => 'Ebeliz',
            'apellidos' => 'Fuentes Claros',
            'email' => 'ebelizfuentes@gmail.com',
            'tipo_usuario' => 'empresa',
            'cuenta' => 'ebelizfuentes',
            'telefono_celular' => '71100743',
            'whatsapp' => '71100743',
            'password' => Hash::make('71100743')
        ];

        $empresa = [
            'rubro_id' => 3,
            'usuario_id' => Usuario::create($usuario)->usuario_id,
            'nombre' => 'Campo Ferial 3 de Julio',
            'logo' => null,
            'direccion' => 'AV. CIRCUNVALACIÓN Y PROLONGACIÓN ESPAÑA',
            'telefono' => '5266111',
            'pagina_web' => 'campoferial3dejulio.com',
            'ciudad_localidad' => 'Oruro',
            'nit' => '281488020',
            'representante_legal' => 'ROCIO VILLCA QUISPE',
            'habilitado' => true,
            'max_participantes' => 2,
            'oferta' => 'Otros',
            'demanda' => 'Empresas',
            'especial' => true,
        ];
        $empresaModel = Empresa::create($empresa);
        Participante::create([
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => 'Andrea Luisa',
            'apellidos' => 'Silvestre Lobo',
            'carnet' => '7287697',
            'celular' => '61836193',
            'cargo' => 'SISTEMAS',
        ]);
        /*        Participante::create([
                    'empresa_id' => $empresaModel->empresa_id,
                    'nombres' => 'Pamela',
                    'apellidos' => 'León Mamani',
                    'carnet' => '123456789',
                    'celular' => '74464355',
                    'cargo' => 'Administrativo',
                ]);*/
    }
}

<?php

use App\Empresa;
use App\Participante;
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
            "nombre" => 'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA',
        ],
        [
            "nombre" => 'ALIMENTOS Y BEBIDAS',
        ],
        [
            "nombre" => 'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',
        ],
        [
            "nombre" => 'PLÁSTICOS O AFINES',
        ],
        [
            "nombre" => 'ENVASES, EMBALAJES Y AFINES',
        ],
        [
            "nombre" => 'QUÍMICOS',
        ],
        [
            "nombre" => 'FARMACIA, MEDICAMENTOS',
        ],
        [
            "nombre" => 'EQUIPOS ELÉCTRICOS',
        ],
        [
            "nombre" => 'MINERÍA',
        ],
        [
            "nombre" => 'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',
        ],
        [
            "nombre" => 'INDUSTRIA TEXTIL, CONFECCIONES Y MODA',
        ],
        [
            "nombre" => 'CUERO CALZADO Y MANUFACTURAS DE CUERO',
        ],
        [
            "nombre" => 'INDUSTRIA PAPELERA Y GRÁFICA',
        ],
        [
            "nombre" => 'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES',
        ],
        [
            "nombre" => 'EQUIPOS E IMPLEMENTOS HIDRAHULICOS',
        ],
        [
            "nombre" => 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',
        ],
        [
            "nombre" => 'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',
        ],
        [
            "nombre" => 'ARTESANIAS',
        ],
        [
            "nombre" => 'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',
        ],
        [
            "nombre" => 'COSMÉTICOS, BELLEZA Y SALUD',
        ],
        [
            "nombre" => 'METALMECÁNICA Y ELECTROMECÁNICA',
        ],
        [
            "nombre" => 'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES',
        ],
        [
            "nombre" => 'PETROLEO, GAS Y PETROQUÍMICA',
        ],
        [
            "nombre" => 'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD',
        ],
        [
            "nombre" => 'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR',
        ],
        [
            "nombre" => 'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',
        ],
        [
            "nombre" => 'FERRETERÍA Y HERRAMIENTAS',
        ],
        [
            "nombre" => 'ENERGÍA',
        ],
        [
            "nombre" => 'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',
        ],
        [
            "nombre" => 'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',
        ],
        [
            "nombre" => 'OTROS',
        ],
        [
            "nombre" => 'COMPAÑÍA DE TRADING',
        ],
        [
            "nombre" => 'BANCOS Y FINANCIERAS',
        ],
        [
            "nombre" => 'FLETES Y TRANSPORTE',
        ],
        [
            "nombre" => 'SERVICIOS ADUANEROS',
        ],
        [
            "nombre" => 'ALMACENAMIENTO Y DISTRIBUCIÓN',
        ],
        [
            "nombre" => 'SEGUROS',
        ],
        [
            "nombre" => 'TURISMO',
        ],
        [
            "nombre" => 'SERVICIOS EMPRESARIALES',
        ],
        [
            "nombre" => 'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',
        ],
        [
            "nombre" => 'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',
        ],
        [
            "nombre" => 'SERVICIOS PARA LA AGROINDUSTRIA',
        ],
        [
            "nombre" => 'OTROS SERVICIOS',
        ],
        [
            "nombre" => 'GOBIERNO Y SUS ORGANISMOS',
        ],
        [
            "nombre" => 'ORGANISMOS INTERNACIONALES',
        ],
        [
            "nombre" => 'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',
        ],
      ];

        foreach ($rubros as $rubro) {
            \App\Rubro::create($rubro);
        }
        /*fin de rubros*/
        for ($i = 0; $i < 5; $i++){
            \App\Mesa::create([
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

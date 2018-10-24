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
        for ($i = 0; $i < 20; $i++){
            \App\Mesa::create([
                "numero" => $i + 1
            ]);
        }
        $usuarioAdmin = [
            'nombres' => 'Franco Jesus',
            'apellidos' => 'Mamani Pozo',
            'email' => 'admin@admin.com',
            'tipo_usuario' => 'administrador',
            'password' => Hash::make('123456789')
        ];
        Usuario::create($usuarioAdmin);


        $usuario = [
            'nombres' => 'Andrea Megan',
            'apellidos' => 'Lafuente Rocha',
            'email' => 'empresa@empresa.com',
            'tipo_usuario' => 'empresa',
            'password' => Hash::make('123456789')
        ];

        $empresa = [
            'rubro_id' => 3,
            'usuario_id' => Usuario::create($usuario)->usuario_id,
            'nombre' => 'Campo Ferial 3 de Julio',
            'logo' => null,
            'direccion' => 'Calle Hugo Bohero #650',
            'telefono' => '(591) 761 37653',
            'pagina_web' => 'www.francomamani.com',
            'ciudad_localidad' => 'Oruro',
            'nit' => '7275047016',
            'representante_legal' => 'Franco Jesus Mamani Pozo',
            'habilitado' => true,
            'max_participantes' => 2,
            'oferta' => 'Servicios Software',
            'demanda' => 'Requerimientos empresariales',
            'especial' => true,
        ];
        $empresaModel = Empresa::create($empresa);
        Participante::create([
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => 'Marcelo',
            'apellidos' => 'Zenteno Rafael',
            'carnet' => '123456789',
            'celular' => '69586290',
            'cargo' => 'Admnistrador Gerente',
        ]);
        Participante::create([
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => 'Pamela',
            'apellidos' => 'León Mamani',
            'carnet' => '123456789',
            'celular' => '74464355',
            'cargo' => 'Administrativo',
        ]);
    }
}

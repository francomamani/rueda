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
        for ($i = 0; $i < 15; $i++) {
            \App\Rubro::create([
                'nombre' => $faker->word,
                'descripcion' => $faker->sentence
            ]);
        }
        for ($i = 0; $i < 20; $i++) {
            \App\Mesa::create([
                'numero' => $i + 1
            ]);
        }
        $usuarioAdmin = [
            'nombres' => 'Melvin',
            'apellidos' => 'Callisaya',
            'email' => 'admin@admin.com',
            'tipo_usuario' => 'administrador',
            'password' => Hash::make('123456789')
        ];
        Usuario::create($usuarioAdmin);

        $usuario = [
            'nombres' => 'Franco',
            'apellidos' => 'Mamani',
            'email' => 'empresa@empresa.com',
            'tipo_usuario' => 'empresa',
            'password' => Hash::make('123456789')
        ];

        $empresa = [
            'rubro_id' => 3,
            'usuario_id' => Usuario::create($usuario)->usuario_id,
            'nombre' => 'Coda',
            'logo' => null,
            'direccion' => 'calle Hugo Bohero #650',
            'telefono' => '52-87551',
            'pagina_web' => 'www.codasrl.com',
            'ciudad_localidad' => 'Oruro',
            'nit' => '7275047016',
            'representante_legal' => 'El Representante Legal',
            'habilitado' => true,
            'max_participantes' => 2,
            'oferta' => 'Servicios Software',
            'demanda' => 'Requerimientos empresariales',
            'especial' => true,
        ];
        $empresaModel = Empresa::create($empresa);
        Participante::create([
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => 'Megan',
            'apellidos' => 'Lafuente Rocha',
            'carnet' => '72754552',
            'celular' => '72963512',
            'cargo' => 'Gerente',
        ]);
        Participante::create([
            'empresa_id' => $empresaModel->empresa_id,
            'nombres' => 'Maria Cristina',
            'apellidos' => 'Pozo Andia',
            'carnet' => '7275623',
            'celular' => '72465245',
            'cargo' => 'Administrativo',
        ]);
    }
}

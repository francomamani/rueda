<?php

use Illuminate\Database\Seeder;

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
    }
}

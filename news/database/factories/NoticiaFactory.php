<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Categoria;
use App\Models\Autor;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Noticia>
 */
class NoticiaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $caminho = storage_path('app/public/imagens');
        return [
          'data' => fake()->date(),
          'titulo' => fake()->sentence(),
          'texto' => fake()->text(),
          'categoria_id' =>
            Categoria::orderByRaw('RANDOM()')
              ->take(1)
              ->first()
              ->id,
          'autor_id' =>
          Autor::orderByRaw('RANDOM()')
            ->take(1)
            ->first()
            ->id,
          'figura' => fake()->image($caminho, 640, 480, null, false, true),
        ];
    }
}

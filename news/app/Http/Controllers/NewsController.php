<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categoria;
use App\Models\Noticia;

class NewsController extends Controller
{
    function index() {
      $categorias = Categoria::all();
      $ultimasNoticias =
        Noticia::orderByRaw('data desc')->limit(5)->get();
      return view('news', compact('categorias', 'ultimasNoticias'));
    }

    function noticia($id) {
      $noticia = Noticia::find($id);
      $categorias = Categoria::all();
      return view('noticia', compact('noticia', 'categorias'));
    }
}

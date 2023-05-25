<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Noticia;
use App\Models\Categoria;
use App\Models\Autor;
use App\Http\Requests\NoticiaRequest;
use Illuminate\Support\Facades\Storage;

class NoticiaController extends Controller
{
    function listar() {
      $noticias = Noticia::orderByRaw('data desc')->paginate(3);
      return view('listagemNoticia', compact('noticias'));
    }

    function novo() {
      $noticia = new Noticia();
      $noticia->id = 0;
      $noticia->data = now();
      $categorias = Categoria::orderBy('descricao')->get();
      $autores = Autor::orderBy('nome')->get();
      return view("frmNoticia", compact('noticia', 'categorias', 'autores'));
    }

    function salvar(NoticiaRequest $request) {
      if ($request->input('id') == 0) {
        $noticia = new Noticia();
      } else {
        $noticia = Noticia::find($request->input('id'));
      }
      if ($request->hasFile('arquivo')) {
        $arquivo = $request->file('arquivo');
        $arquivoSalvo = $arquivo->store('public/imagens');
        $arquivoSalvo = explode("/", $arquivoSalvo);
        $tamanho = count($arquivoSalvo);
        if ($noticia->figura != "") {
          Storage::delete("public/imagens/$noticia->figura");
        }
        $noticia->figura = $arquivoSalvo[$tamanho-1];
      }

      $noticia->data = $request->input('data');
      $noticia->titulo = $request->input('titulo');
      $noticia->texto = $request->input('texto');
      $noticia->categoria_id = $request->input('categoria_id');
      $noticia->autor_id = $request->input('autor_id');
      $noticia->save();
      return redirect('noticia/listar');
    }

    function salvarOld(Request $request) {
      $validated = $request->validate([
              'titulo' => 'required',
              'texto' => 'required',
              'data' => 'required',
              'categoria_id' => 'required|exists:categoria,id',
              'autor_id' => 'required|exists:autor,id',
          ]);

      if ($request->input('id') == 0) {
        $noticia = new Noticia();
      } else {
        $noticia = Noticia::find($request->input('id'));
      }
      $noticia->data = $request->input('data');
      $noticia->titulo = $request->input('titulo');
      $noticia->texto = $request->input('texto');
      $noticia->categoria_id = $request->input('categoria_id');
      $noticia->autor_id = $request->input('autor_id');
      $noticia->save();
      return redirect('noticia/listar');
    }

    function editar($id) {
      $noticia = Noticia::find($id);
      $categorias = Categoria::orderBy('descricao')->get();
      $autores = Autor::orderBy('nome')->get();
      return view("frmNoticia", compact('noticia', 'categorias', 'autores'));

    }

    function excluir($id) {
      $noticia = Noticia::find($id);
      $noticia->delete();
      return redirect('noticia/listar');
    }
}

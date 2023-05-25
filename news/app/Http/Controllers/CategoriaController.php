<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Categoria;
use Illuminate\Support\Facades\Storage;

class CategoriaController extends Controller
{
    function listar() {
      $categorias = Categoria::orderBy('descricao')->get();
      return view('listagemCategoria',
        compact('categorias') );
    }

    function novo() {
      $categoria = new Categoria();
      $categoria->id = 0;
      return view('frmCategoria',
        compact('categoria'));
    }

    function salvar(Request $request) {
      if ($request->input('id') == 0) {
        $categoria = new Categoria();
      } else {
        $categoria = Categoria::find($request->input('id'));
      }

      if ($request->hasFile('arquivo')) {
        $arquivo = $request->file('arquivo');
        $arquivoSalvo = $arquivo->store('public/imagens');
        $arquivoSalvo = explode("/", $arquivoSalvo);
        $tamanho = count($arquivoSalvo);
        if ($categoria->figura != "") {
          Storage::delete("public/imagens/$categoria->figura");
        }
        $categoria->figura = $arquivoSalvo[$tamanho-1];
      }

      $categoria->descricao =
        $request->input('descricao');
      $categoria->save();
      return redirect('categoria/listar');
    }

    function editar($id) {
      $categoria = Categoria::find($id);
      return view('frmCategoria',
        compact('categoria'));
    }

    function excluir($id) {
      $categoria = Categoria::find($id);
      $categoria->delete();
      return redirect('categoria/listar');
    }
}

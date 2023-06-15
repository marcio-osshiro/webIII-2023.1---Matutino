<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Autor;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Mail;
use App\Mail\MensagemAutor;

class AutorController extends Controller
{
    //
    function listar() {
      $autores = Autor::orderBy('nome')->get();
      return view('listagemAutores',
        compact('autores') );
    }

    function novo() {
      $autor = new Autor();
      $autor->id = 0;
      return view('frmAutor',
        compact('autor'));
    }

    function salvar(Request $request) {
      if ($request->input('id') == 0) {
        $autor = new Autor();
      } else {
        $autor = Autor::find($request->input('id'));
      }

      if ($request->hasFile('arquivo')) {
        $arquivo = $request->file('arquivo');
        $arquivoSalvo = $arquivo->store('public/imagens');
        $arquivoSalvo = explode("/", $arquivoSalvo);
        $tamanho = count($arquivoSalvo);
        if ($autor->figura != "") {
          Storage::delete("public/imagens/$autor->figura");
        }
        $autor->figura = $arquivoSalvo[$tamanho-1];
      }


      $autor->nome =
        $request->input('nome');
      $autor->cpf =
          $request->input('cpf');
      $autor->save();
      return redirect('autor/listar');
    }

    function editar($id) {
      $autor = Autor::find($id);
      return view('frmAutor',
        compact('autor'));
    }

    function excluir($id) {
      $autor = Autor::find($id);
      $autor->delete();
      return redirect('autor/listar');
    }

    function mensagem($id) {
      $autor = Autor::find($id);
      return view('frmMensagem', compact('autor'));
    }

    function enviarMensagem(Request $request) {
      $autor = Autor::find($request->input('id'));
      $mensagem = $request->input('mensagem');
      Mail::to($autor->email)->send(new MensagemAutor($autor, $mensagem));
      return redirect('autor/listar');
    }
}

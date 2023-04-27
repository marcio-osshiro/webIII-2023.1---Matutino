@extends('template')

@section('conteudo')
  <h1>Listagem de Notícias</h1>
  <a class="btn btn-primary" href="novo">Novo</a>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Figura</th>
        <th>Título</th>
        <th>Data</th>
        <th>Categoria</th>
        <th>Autor</th>
        <th>Editar</th>
        <th>Excluir</th>
      </tr>
    </thead>
    <tbody>
      @foreach($noticias as $noticia)
        <tr>
          <td>{{$noticia->id}}</td>
          <td>
            @if($noticia->figura != "")
              <img style="width:50px;height:50px;object-fit:cover" src="/storage/imagens/{{$noticia->figura}}">
            @endif
          </td>
          <td>{{$noticia->titulo}}</td>
          <td>{{$noticia->data->format('d/m/Y')}}</td>
          <td>{{$noticia->categoria->descricao}}</td>
          <td>{{$noticia->autor->nome}}</td>
          <td><a class='btn btn-primary' href='editar/{{$noticia->id}}'>+</a>  </td>
          <td><a class='btn btn-danger' href='excluir/{{$noticia->id}}'>-</a>  </td>
        </tr>
      @endforeach
    </tbody>
  </table>
@endsection

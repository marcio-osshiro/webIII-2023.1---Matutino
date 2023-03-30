@extends('template')

@section('conteudo')
  <h1>Listagem de Categorias</h1>
  <a class="btn btn-primary" href="novo">Novo</a>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Editar</th>
        <th>Excluir</th>
      </tr>
    </thead>
    <tbody>
      @foreach($categorias as $categoria)
        <tr>
          <td>{{$categoria->id}}</td>
          <td>{{$categoria->descricao}}</td>
          <td><a class='btn btn-primary' href='editar/{{$categoria->id}}'>+</a>  </td>
          <td><a class='btn btn-danger' href='excluir/{{$categoria->id}}'>-</a>  </td>
        </tr>
      @endforeach
    </tbody>
  </table>
@endsection

@extends('template')

@section('conteudo')
  <h1>Listagem de Autores</h1>
  <a class="btn btn-primary" href="novo">Novo</a>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>CPF</th>
        <th>Editar</th>
        <th>Excluir</th>
      </tr>
    </thead>
    <tbody>
      @foreach($autores as $autor)
        <tr>
          <td>{{$autor->id}}</td>
          <td>{{$autor->nome}}</td>
          <td>{{$autor->cpf}}</td>
          <td><a class='btn btn-primary' href='editar/{{$autor->id}}'>+</a>  </td>
          <td><a class='btn btn-danger' href='excluir/{{$autor->id}}'>-</a>  </td>
        </tr>
      @endforeach
    </tbody>
  </table>
@endsection

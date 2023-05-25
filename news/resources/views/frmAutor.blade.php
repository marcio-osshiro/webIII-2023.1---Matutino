@extends('template')

@section('conteudo')
  <h1>Cadastro de Autor</h1>
  @if($autor->figura != "")
    <img style="width:150px;height:150px;object-fit:cover;border-radius:20px;border:1px solid gray;padding: 0.25rem" src="/storage/imagens/{{$autor->figura}}">
  @endif



  <form action="{{url('autor/salvar')}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
      <label for="id" class="form-label">ID</label>
      <input readonly class="form-control" readonly type="text" name="id" value="{{$autor->id}}">
    </div>
    <div class="mb-3">
      <label for="nome" class="form-label">Nome</label>
      <input class="form-control" type="text" name="nome" value="{{$autor->nome}}">
    </div>
    <div class="mb-3">
      <label for="cpf" class="form-label">CPF</label>
      <input class="form-control" type="text" name="cpf" value="{{$autor->cpf}}">
    </div>
    <div class="mb-3">
      <label for="arquivo" class="form-label">Figura</label>
      <input class="form-control" type="file" name="arquivo" accept="image/*">
    </div>


    <button class="btn btn-primary" type="submit" name="button">Salvar</button>
  </form>
@endsection

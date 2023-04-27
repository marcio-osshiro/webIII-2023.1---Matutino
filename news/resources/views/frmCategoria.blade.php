@extends('template')

@section('conteudo')
  <h1>Cadastro de Categoria</h1>
  @if($categoria->figura != "")
    <img style="width:150px;height:150px;object-fit:cover;border-radius:20px;border:1px solid gray;padding: 0.25rem" src="/storage/imagens/{{$categoria->figura}}">
  @endif

  <form action="{{url('categoria/salvar')}}" method="post"  enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
      <label for="id" class="form-label">ID</label>
      <input readonly class="form-control" readonly type="text" name="id" value="{{$categoria->id}}">
    </div>
    <div class="mb-3">
      <label for="descricao" class="form-label">Descrição</label>
      <input class="form-control" type="text" name="descricao" value="{{$categoria->descricao}}">
    </div>
    <div class="mb-3">
      <label for="arquivo" class="form-label">Figura</label>
      <input class="form-control" type="file" name="arquivo" accept="image/*">
    </div>


    <button class="btn btn-primary" type="submit" name="button">Salvar</button>
  </form>
@endsection

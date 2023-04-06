@extends('template')

@section('conteudo')
  @if ($errors->any())
    <div class="alert alert-danger">
      <ul>
        @foreach($errors->all() as $error)
          <li>{{$error}}</li>
        @endforeach
      </ul>
    </div>
  @endif

  <h1>Cadastro de Notícia</h1>
  <form action="{{url('noticia/salvar')}}" method="post">
    @csrf
    <div class="mb-3">
      <label for="id" class="form-label">ID</label>
      <input readonly class="form-control" readonly type="text" name="id" value="{{$noticia->id}}">
    </div>
    <div class="mb-3">
      <label for="titulo" class="form-label">Título</label>
      <input class="form-control @error('titulo') is-invalid @enderror" type="text" name="titulo" value="{{old('titulo', $noticia->titulo) }}">
      @error('titulo')
          <div class="alert alert-danger">{{ $message }}</div>
      @enderror
    </div>
    <div class="mb-3">
      <label for="texto" class="form-label">Texto</label>
      <textarea class="form-control @error('texto') is-invalid @enderror" name="texto" id="texto" rows="6">{{old('texto', $noticia->texto)}}</textarea>
        @error('texto')
            <div class="alert alert-danger">{{ $message }}</div>
        @enderror
    </div>
    <div class="mb-3">
      <label for="data" class="form-label">Data</label>
      <input class="form-control  @error('data') is-invalid @enderror" type="date" name="data" value="{{old('data', $noticia->data->format('Y-m-d'))}}">
        @error('data')
            <div class="alert alert-danger">{{ $message }}</div>
        @enderror

    </div>
    <div class="mb-3">
      <label for="categoria_id" class="form-label">Categoria</label>
      <select class="form-select  @error('categoria_id') is-invalid @enderror" id="categoria_id" name="categoria_id">
        @foreach($categorias as $categoria)
          <option {{$categoria->id==old('categoria_id',$noticia->categoria_id)? 'selected':''}} value="{{$categoria->id}}">{{$categoria->descricao}}</option>
        @endforeach
      </select>
      @error('categoria_id')
          <div class="alert alert-danger">{{ $message }}</div>
      @enderror

    </div>
    <div class="mb-3">
      <label for="autor_id" class="form-label">Autor</label>
      <select class="form-select  @error('autor_id') is-invalid @enderror" id="autor_id" name="autor_id">
        @foreach($autores as $autor)
          <option {{$autor->id==old('autor_id', $noticia->autor_id)? 'selected':''}} value="{{$autor->id}}">{{$autor->nome}}</option>
        @endforeach
      </select>
      @error('autor_id')
          <div class="alert alert-danger">{{ $message }}</div>
      @enderror

    </div>

    <button class="btn btn-primary" type="submit" name="button">Salvar</button>
  </form>
@endsection
@extends('templateNews')

@section('conteudo')
  <main>
    <h1>{{$noticia->categoria->descricao}}</h1>
    <img style='width: 100%; height: 10rem; object-fit: cover' src="/storage/imagens/{{$noticia->figura}}" alt="">
    <h2>{{$noticia->titulo}}</h2>
    <p>{{$noticia->texto}}</p>
    <div>
      <p>{{$noticia->data->format('d/m/Y')}} - {{$noticia->autor->nome}}</p>
    </div>
  </main>
@endsection

@extends('template')

@section('conteudo')
  <h1>Mensagens para Autor</h1>
  @if($autor->figura != "")
    <img style="width:150px;height:150px;object-fit:cover;border-radius:20px;border:1px solid gray;padding: 0.25rem" src="/storage/imagens/{{$autor->figura}}">
  @endif



  <form action="{{url('autor/enviarMensagem')}}" method="post">
    @csrf
    <div class="mb-3">
      <label for="id" class="form-label">ID</label>
      <input readonly class="form-control" readonly type="text" name="id" value="{{$autor->id}}">
    </div>
    <div class="mb-3">
      <label for="nome" class="form-label">Nome</label>
      <input readonly class="form-control" type="text" name="nome" value="{{$autor->nome}}">
    </div>
    <div class="mb-3">
      <label for="cpf" class="form-label">CPF</label>
      <input readonly class="form-control" type="text" name="cpf" value="{{$autor->cpf}}">
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">E-mail</label>
      <input readonly class="form-control" type="text" name="email" value="{{$autor->email}}">
    </div>
    <div class="mb-3">
      <label for="mensagem" class="form-label">Mensagem</label>
      <textarea class="form-control" id="mensagem" name="mensagem" rows="10"></textarea>      
    </div>
    <button class="btn btn-primary" type="submit" name="button">Enviar</button>
  </form>
@endsection

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title></title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: sans-serif;
      }
      body {
        width: 80%;
        margin: auto;
      }
      table {
        width: 100%;
        border-collapse: collapse;
      }
      th,td {
        border: 1px solid black;
        padding: 0.5rem;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <h1>Relatório de Categorias</h1>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Descrição</th>
          <th>Figura</th>
        </tr>
      </thead>
      <tbody>
        @foreach($categorias as $categoria)
          <tr>
            <td>{{$categoria->id}}</td>
            <td>{{$categoria->descricao}}</td>
            <td>
              @if($categoria->figura != "")
                <img style="width:50px;height:50px;object-fit:cover" src='{{storage_path("app/public/imagens/$categoria->figura") }}'>
              @endif
            </td>
          </tr>
        @endforeach
      </tbody>
    </table>

  </body>
</html>

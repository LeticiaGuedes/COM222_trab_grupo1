<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Publicação</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Consultar Publicação
                </h1>

                <form action="" method="post">
                    <div class="form-group form-inline">
                        <label>ISBN ou Título:</label>
                        <input name="query" required class="form-control" type="text">
                        <button type="submit" name="salvar" class="btn btn-primary col-sm-offset-1">Pesquisar</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <!-- A parte de baixo só existe após pesquisar -->
                <div class="form-group">
                    <h3>Resultados da Busca (2)</h3>
                    <hr>
                </div>

                <div class="form-group table-responsive">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <td>Exemplar</td>
                                <td>Título</td>
                                <td>Status</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Devolu&ccedil;&atilde;o</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Realizar Devolu&ccedil;&atilde;o
                </h1>
                <form action="cad_devolucao" method="post">

                    <div class="form-group">
                        <label>N&uacute;mero de Exemplar</label>
                        <input name="exemplar" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>ISBN</label>
                        <input name="isbn" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

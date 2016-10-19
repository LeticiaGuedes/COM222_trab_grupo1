<%-- 
    Document   : cad_emprestimo
    Created on : 17/10/2016, 20:02:28
    Author     : le_10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Empr&eacute;stimo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Realizar Empréstimo
                </h1>
                <form action="cad_emprestimo" method="post">

                    <input name="acao" value="true" hidden="true"></input>
                    
                    <div class="form-group">
                        <label>Número de Exemplar</label>
                        <input name="exemplar" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>ISBN</label>
                        <input name="isbn" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Data do Empréstimo</label>
                        <input name="data" required class="form-control" type="text">
                    </div>


                    <div class="form-group">
                        <label>Associado</label>
                        <input name="associado" required class="form-control" type="text">
                    </div>


                    <div class="form-group">
                        <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

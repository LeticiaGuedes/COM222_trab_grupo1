<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Publica&ccedil;&atilde;o</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Cadastrar Publicação
                </h1>
                <form action="cad_publicacao" method="post">

                    <input name="acao" value="true" hidden="true"></input>
                    
                    <div class="form-group">
                        <label>ISBN</label>
                        <input name="isbn" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Título</label>
                        <input name="titulo" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Autor</label>
                        <input name="autor" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Editora</label>
                        <input name="editora" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Ano de Publicação</label>
                        <input name="ano" required class="form-control" type="number">
                    </div>

                    <div class="form-group">
                        <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

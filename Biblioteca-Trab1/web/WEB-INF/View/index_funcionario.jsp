<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionário</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Bem vindo, ${userFuncionario.nome}
                </h1>

                <div class="form-group">
                    Gostariamos de confirmar os seus dados:<br>
                    <br>
                    <b>Código: </b>${userFuncionario.codigo}<br>
                    <b>Nome: </b>${userFuncionario.nome}<br>
                    <b>Endereço: </b>${userFuncionario.endereco}<br>
                    <b>Email: </b>${userFuncionario.email}<br>
                    <br>
                    Em caso de inconformidades entre em contato com um de seus superiores.
                </div>
            </div>
        </div>
    </body>
</html>

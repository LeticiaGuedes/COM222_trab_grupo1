<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Associado</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_associado.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Bem vindo, ${userAssociado.nome}
                </h1>

                <div class="form-group">
                    Gostariamos de confirmar os seus dados:<br>
                    <br>
                    <b>Código: </b>${userAssociado.codigo}<br>
                    <b>Nome: </b>${userAssociado.nome}<br>
                    <b>Endereço: </b>${userAssociado.endereco}<br>
                    <b>Email: </b>${userAssociado.email}<br>
                    <br>
                    Em caso de inconformidades entre em contato com um de nossos funcionários.
                </div>
            </div>
        </div>
    </body>
</html>

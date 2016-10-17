<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Histórico</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <<div class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <h1 class="page-title">
                    Seu Histórico
                </h1>
                <div class="table-responsive">

                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td>Publicação</td>
                                <td>Data de Empréstimo</td>
                                <td>Data de Devolução</td>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- Caso existam emprestimos -->

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <!-- Caso não existam, mostrar a TR abaixo -->

                            <tr>
                                <td colspan="3">Você não realizou nenhum Empréstimo</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

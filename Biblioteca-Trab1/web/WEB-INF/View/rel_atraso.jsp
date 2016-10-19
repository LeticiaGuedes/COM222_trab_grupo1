<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Atraso</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
            <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <h1 class="page-title">
                    Relatório de Devoluções em Atraso
                </h1>
                <div class="table-responsive">
                    <p>Devoluções atrasadas (${fn:length(listaAtraso)})</p>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td>#</td>
                                <td>Nome do Associado</td>
                                <td>ISBN</td>
                                <td>Titulo</td>
                                <td>Autor</td>
                                <td>Data Emprestimo</td>
                                <td>Data Devolução</td>

                            </tr>
                        </thead>
                        <tbody>
                            
                                
                                    <tr>
                                        <td>-</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
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

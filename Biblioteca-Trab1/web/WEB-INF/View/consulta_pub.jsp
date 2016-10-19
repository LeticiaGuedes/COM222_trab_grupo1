<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Publicação</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_associado.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Consultar Publicação
                </h1>

                <form action="consulta_pub" method="post">
                    
                    <input name="acao" value="true" hidden="true">
                    
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
                    <h3>Resultados da Busca (${fn:length(lista)})</h3>
                    <hr>
                </div>

                <div class="form-group table-responsive">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <td>ISBN</td>
                                <td>Exemplar</td>
                                <td>Título</td>
                                <td>Autor</td>
                                <td>Status</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="exemp" items="${lista}">
                                <tr>
                                    <td>${exemp.ISBN}</td>
                                    <td>${exemp.numero}</td>
                                    <td>${exemp.titulo}</td>
                                    <td>${exemp.autor}</td>
                                    <td>
                                        <c:if test="${exemp.status == 1}">
                                            Emprestado
                                        </c:if>
                                        <c:if test="${exemp.status == 0}">
                                            Disponível
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

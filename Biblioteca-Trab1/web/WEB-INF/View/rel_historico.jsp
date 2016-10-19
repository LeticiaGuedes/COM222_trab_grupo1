<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Histórico</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
            <%@ include file = 'menu_associado.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <h1 class="page-title">
                    Seu Histórico
                </h1>
                <div class="table-responsive">

                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td>Data de Empréstimo</td>
                                <td>Data de Devolução</td>
                                <td>Título</td>
                                <td>Autor</td>
                                <td>ISBN</td>
                                <td>Exemplar</td>
                                <td>Status</td>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- Caso existam emprestimos -->

                            <c:if test="${!empty userAssociado.listaEmp}">
                                <c:forEach var="emp" items="${userAssociado.listaEmp}">
                                    <tr>
                                        <td>${emp.emprestimo}</td>
                                        <td>${emp.devolucao}</td>
                                        <td>${emp.exemplar.titulo}</td>
                                        <td>${emp.exemplar.autor}</td>
                                        <td>${emp.exemplar.ISBN}</td>
                                        <td>${emp.exemplar.numero}</td>
                                        <td>
                                            <c:if test= "${emp.exemplar.status == 1}">
                                                Emprestado
                                            </c:if>
                                            <c:if test= "${emp.exemplar.status == 0}">
                                                Devolvido
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <!-- Caso não existam, mostrar a TR abaixo -->
                            <c:if test="${empty userAssociado.listaEmp}">
                                <tr>
                                    <td colspan="6">Você não realizou nenhum Empréstimo</td>
                                </tr>
                            </c:if>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

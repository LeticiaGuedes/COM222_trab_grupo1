<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div class="text-right">
            <a href="login_funcionario.jsp">Login de Funcionários</a>
        </div>
        <div class="container">
            <div class="col-sm-6 col-sm-offset-3">
                 <h1 class="page-title">
                    Login Associado
                </h1>
                
                <h4>
                    <c:if test="${!param.login}">
                        Entrar
                    </c:if>
                    <c:if test="${param.login == 'falha'}">
                        Código ou senha invalidos. Tente novamente.
                    </c:if>
                </h4>
                </br>
                <form action="loginAssociado" method="post">

                    <div class="form-group">
                        <label>Código</label>
                        <input name="codigo" required class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label>Senha</label>
                        <input name="senha" required class="form-control" type="password">
                    </div>

                    <div class="form-group">
                        <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

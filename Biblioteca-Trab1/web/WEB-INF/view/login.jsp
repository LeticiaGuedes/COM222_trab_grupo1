<%-- 
    Document   : login
    Created on : 17/10/2016, 10:21:53
    Author     : wallace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div class="text-right">
            <a href="WEB-INF/view/login_funcionario.jsp">Login de Funcionários</a>
        </div>
        <h1 class="page-title">
            Entrar
        </h1>

        <form action="" method="post">

            <div class="form-group">
                <label>Código</label>
                <input name="codigo" required class="form-control" type="text">
            </div>

            <div class="form-group">
                <label>Senha</label>
                <input name="senha" required class="form-control" type="text">
            </div>

            <div class="form-group">
                <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
            </div>

        </form>
    

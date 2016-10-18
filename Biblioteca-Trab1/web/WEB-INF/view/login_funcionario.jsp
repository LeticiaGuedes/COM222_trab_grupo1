<%-- 
    Document   : login_funcionario
    Created on : 17/10/2016, 11:00:20
    Author     : wallace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="text-right">
	<a href="index.jsp">Login Associados</a>
</div>
<h1 class="page-title">
	Entrar
</h1>

<form action="loginFuncionario" method="post">

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

    </body>
</html>

<%-- 
    Document   : cad_associado
    Created on : 17/10/2016, 12:52:09
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
        <h1 class="page-title">
            Cadastrar Associado
        </h1>
        <form action="funcionario" method="post" >

            <input name="acao" value="cadastro_associado" hidden="true">
            
            <div class="form-group">
                <label>Codigo</label>
                <input name="codigo" required class="form-control" type="text">
            </div>
            
            <div class="form-group">
                <label>Nome</label>
                <input name="nome" required class="form-control" type="text">
            </div>

            <div class="form-group">
                <label>E-mail</label>
                <input name="email" required class="form-control" type="text">
            </div>

            <div class="form-group">
                <label>Senha</label>
                <input name="senha" required class="form-control" type="text">
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status" required class="form-control">
                    <option value="grad">Grad (aluno de graduação): 7 dias</option>
                    <option value="posgrad">Posgrad (aluno de pós-graduação): 10 dias</option>
                    <option value="prof">Prof (professor): 14 dias</option>
                </select>
            </div>

            <div class="form-group">
                <label>Endereço</label>
                <textarea name="endereco" required class="form-control" rows="2"></textarea>
            </div>

            <div class="form-group">
                <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
            </div>

        </form>

    </body>
</html>

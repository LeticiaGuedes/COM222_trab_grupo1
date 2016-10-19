<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Associados</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <%@ include file = 'menu_funcionario.html' %>
        </div>
        <div style="padding-top: 70px;" class="container">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="page-title">
                    Cadastrar Associado
                </h1>
                <form action="" method="post">

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
                            <option value="grad">Grad (aluno de gradua&ccedil;&atilde;o): 7 dias</option>
                            <option value="posgrad">Posgrad (aluno de p&oacute;s-gradua&ccedil;&atilde;o): 10 dias</option>
                            <option value="prof">Prof (professor): 14 dias</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Endere&ccedil;o</label>
                        <textarea name="endereco" required class="form-control" rows="2"></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" name="salvar" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

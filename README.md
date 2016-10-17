# COM222_trab_grupo1

# Padrões para o desenvolvimento:

**nome dos arquivos**

Os nomes dos arquivos serão uma combinação do identificador com qual classe se destina:

Ex.:

	- cad_associado;


**Banco de Dados**

O dump do banco de dados oficial é o arquivo sql bibliotecaDB. Por convenção, esse também é o nome do banco de dados para usá-lo. Pode-se utilizar qualquer nome para o banco, porém deve-se lembrar de alterar seu nome de acesso no arquivo ConnectionFactory.java

Há também um banco de dados remoto configurado, o projeto ja está pré-configurado para usá-lo.


**Arquivo ConnectionFactory**

Esse arquivo utiliza o pattern Factory para esconder a conexão do JDBC. Dessa forma, alteração de nome de base de dados e usuário de acesso precisa ser apenas configurado nesse arquivo.

**Namespace**

Todos os arquivos java utilizam de namespace afim de separa-los logicamente.
Esse namespace são compostos pelo prefixo "br.com.com222" seguido do nome do pacote e subpacote quanto ocorrer, como por exemplo:
	- br.com.com222.jdbc		(exemplo de nome de pacote)
	- br.com.com222.jdbc.dao	(exemplo de nome de subpacote)

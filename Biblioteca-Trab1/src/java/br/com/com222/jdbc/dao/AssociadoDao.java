/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Associado;
import br.com.com222.model.Emprestimo;
import br.com.com222.model.Exemplar;
import br.com.com222.model.Publicacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wallace
 */
public class AssociadoDao {

    Connection connection;

    public AssociadoDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AssociadoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Associado login(int codigo, String pass) {

        String sql = "SELECT * FROM associado WHERE codigo = " + codigo + " AND  senha = '" + pass +"'";
        String sqlEmp = "SELECT emprestimo.*, publicacao.*, exemplar.preco "
                + "FROM emprestimo JOIN publicacao ON emprestimo.exemplar_ISBN = publicacao.ISBN "
                + "JOIN exemplar ON emprestimo.exemplar_ISBN = exemplar.publicacao_ISBN "
                + "AND emprestimo.exemplar_numero = exemplar.numero "
                + "WHERE emprestimo.associado_codigo = "+ codigo +" ORDER BY emprestimo.dataRetirada DESC";
        

        List<Emprestimo> lista = new ArrayList<>();

        try {
            Associado associado = null;

            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                stmt = this.connection.prepareStatement(sqlEmp);
                ResultSet rsEmp = stmt.executeQuery();

                while (rsEmp.next()) {
                    int isbn = rsEmp.getInt("ISBN");

                    Exemplar ex = new Exemplar(isbn, rsEmp.getInt("exemplar_numero"),
                            rsEmp.getFloat("preco"), rsEmp.getInt("status"),
                            rsEmp.getString("titulo"), rsEmp.getString("autor"),
                            rsEmp.getString("editora"), rsEmp.getInt("ano"));

                    Emprestimo emp = new Emprestimo(rsEmp.getInt("id"), rsEmp.getDate("dataRetirada"),
                            rsEmp.getDate("dataDevolucao"), rsEmp.getInt("associado_codigo"),
                            rsEmp.getInt("status"), ex);

                    lista.add(emp);
                }

                associado = new Associado(rs.getInt("codigo"), rs.getString("nome"), rs.getString("endereco"), rs.getString("email"), rs.getString("senha"), rs.getString("status"), lista);

            }

            rs.close();
            stmt.close();

            return associado;

        } catch (SQLException e) {

            throw new RuntimeException(e);

        }

    }

    public String cadastro(Associado assoc) {

        String sql = "INSERT INTO associado (codigo, nome, endereco, email, senha, status) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            stmt.setInt(1, assoc.getCodigo());
            stmt.setString(2, assoc.getNome());
            stmt.setString(3, assoc.getEndereco());
            stmt.setString(4, assoc.getEmail());
            stmt.setString(5, assoc.getSenha());
            stmt.setString(6, assoc.getStatus());

            stmt.execute();
            stmt.close();
            
            return "Cadastro realizado com sucesso";
            
        } catch (SQLException e) {
            if (e.getSQLState().equals("23000")) {
                return "O Código do Associado que você está tentando adicionar já está cadastrado";
            } else {
                throw new RuntimeException(e.getSQLState());
            }
        }
    }
    
    public int consultaPrazo(int codigo){
        
        String sql = "SELECT `status` FROM `associado` WHERE `codigo` = "+codigo;
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            
            int result = 0;
            
            if (rs.next()) {
                switch(rs.getString("status")){
                    case "grad":
                        result = 7;
                        break;
                    case "posgrad":
                        result = 10;
                        break;
                    case "prof":
                        result = 14;
                }
            }
            
            rs.close();
            stmt.close();
            
            return result;

        } catch (SQLException e) {

            throw new RuntimeException(e);
            
        }
    }
    
    public List<Associado> geraRelatorio() {
        
        List<Associado> list = new ArrayList<>();
        Date dataAt = new Date();
        java.sql.Date dataAtual = new java.sql.Date(dataAt.getTime());
        String sql = "SELECT associado.* FROM `associado` JOIN emprestimo ON associado.codigo = emprestimo.associado_codigo WHERE emprestimo.dataDevolucao < '"+dataAtual+"' AND emprestimo.status = 1";
        
        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()){
                int result = 0;
                for (Associado assoc: list) {
                    if(assoc.getCodigo() == rs.getInt("codigo")){
                        result = 1;
                    }
                }

                if(result == 0){
                Associado associado = new Associado();
                associado.setCodigo(rs.getInt("codigo"));
                associado.setNome(rs.getString("nome"));
                associado.setEndereco(rs.getString("endereco"));
                associado.setEmail(rs.getString("email"));
                associado.setSenha(rs.getString("senha"));
                associado.setStatus(rs.getString("status"));
                
                EmprestimoDao empDao = new EmprestimoDao();
                List<Emprestimo> lisEmp = empDao.consultaEmpAt(rs.getInt("codigo"), dataAtual);
                associado.setListaEmp(lisEmp);
                list.add(associado);
                }
            }
            
            rs.close();
            stmt.close();
        
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

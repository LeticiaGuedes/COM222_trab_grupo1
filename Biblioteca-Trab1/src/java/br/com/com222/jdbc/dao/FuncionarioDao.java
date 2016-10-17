/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wallace
 */
public class FuncionarioDao {

    private Connection connection;

    public FuncionarioDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Funcionario login(int codigo, String pass) {

        String sql = "SELECT * FROM funcionario WHERE codigo = " + codigo;

        try {
            Funcionario funcionario = null;
            
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {

                String senha = rs.getString("senha");

                if (senha.equals(pass)) {
                    
                    funcionario = new Funcionario();
                    
                    funcionario.setCodigo(rs.getInt("codigo"));
                    funcionario.setEmail(rs.getString("email"));
                    funcionario.setEndereco(rs.getString("endereco"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setSenha(senha);

                }
            }
            
            rs.close();
            stmt.close();
            
            return funcionario;

        } catch (SQLException e) {

            throw new RuntimeException(e);
            
        }

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Associado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wallace
 */
public class AssociadoDao {
    
    Connection connection;
    
    public AssociadoDao() throws ClassNotFoundException {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    public void cadastro(Associado assoc){
        
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
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
    
    
    
}

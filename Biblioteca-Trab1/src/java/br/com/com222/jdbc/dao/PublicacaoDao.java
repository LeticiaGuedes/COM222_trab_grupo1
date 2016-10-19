package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Publicacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PublicacaoDao {
    
    Connection connection;

    public PublicacaoDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PublicacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void cadastro(Publicacao pub){
        
        String sql = "INSERT INTO `publicacao`(`ISBN`, `titulo`, `autor`, `editora`, `ano`) VALUES (?,?,?,?,?)";
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            
            stmt.setInt(1, pub.getISBN());
            stmt.setString(2, pub.getTitulo());
            stmt.setString(3, pub.getAutor());
            stmt.setString(4, pub.getEditora());
            stmt.setInt(5, pub.getAno());
            
            stmt.execute();
            stmt.close();
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
}

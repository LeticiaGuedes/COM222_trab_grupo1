package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Exemplar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExemplarDao {
    
    Connection connection;

    public ExemplarDao() {
         try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ExemplarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void cadastro(Exemplar exemp){
        
        String sql = "INSERT INTO `exemplar`(`publicacao_ISBN`, `numero`, `preco`, `status`) VALUES (?,?,?,?)";
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            
            stmt.setInt(1, exemp.getISBN());
            stmt.setInt(2, exemp.getNumero());
            stmt.setFloat(3, exemp.getPreco());
            stmt.setInt(4, exemp.getStatus());
            
            stmt.execute();
            stmt.close();
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
}

package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Exemplar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public void cadastro(Exemplar exemp) {

        String sql = "INSERT INTO `exemplar`(`publicacao_ISBN`, `numero`, `preco`, `status`) VALUES (?,?,?,?)";

        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            stmt.setInt(1, exemp.getISBN());
            stmt.setInt(2, exemp.getNumero());
            stmt.setFloat(3, exemp.getPreco());
            stmt.setInt(4, exemp.getStatus());

            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int count(int isbn) {
        String sql = "SELECT COUNT(*) FROM exemplar WHERE publicacao_ISBN =" + isbn;
        int total = 0;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return total = rs.getInt(1);
            } else {
                return total;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void setStatus(int status, int isbn, int numero) {
        
        String sql = "UPDATE `exemplar` SET `status`= "+status+" WHERE `publicacao_ISBN` = "+isbn+" AND `numero` = "+numero;
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            
            stmt.executeUpdate();
            stmt.close();
            
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
        
    }
    
    public Exemplar consulta(int ISBN, int numExemplar) {

        String sql = "SELECT * FROM `exemplar` JOIN `publicacao` on `exemplar`.`publicacao_ISBN` = `publicacao`.`ISBN` where exemplar.publicacao_ISBN = "+ISBN+" AND exemplar.numero = "+numExemplar;

        try {
            Exemplar exemplar = null;
            
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                exemplar = new Exemplar();
                exemplar.setISBN(rs.getInt("ISBN"));
                exemplar.setNumero(rs.getInt("numero"));
                exemplar.setPreco(rs.getFloat("preco"));
                exemplar.setStatus(rs.getInt("status"));
                exemplar.setTitulo(rs.getString("titulo"));
                exemplar.setAutor(rs.getString("autor"));
                exemplar.setEditora(rs.getString("editora"));
                exemplar.setAno(rs.getInt("ano"));
            }

            rs.close();
            stmt.close();

            return exemplar;

        } catch (SQLException e) {

            throw new RuntimeException(e);

        }
    }
}

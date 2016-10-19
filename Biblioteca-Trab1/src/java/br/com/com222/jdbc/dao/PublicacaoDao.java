package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Exemplar;
import br.com.com222.model.Publicacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;

public class PublicacaoDao {

    Connection connection;

    public PublicacaoDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PublicacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cadastro(Publicacao pub) {

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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Publicacao consulta(int query) {
        String sql = "SELECT * FROM publicacao WHERE isbn= " + query;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int isbn = rs.getInt("isbn");
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                String editora = rs.getString("editora");
                int ano = rs.getInt("ano");
                Publicacao pub = new Publicacao(isbn, titulo, autor, editora, ano);
                
                return pub;
            }
            
            return null;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Exemplar> consulta(String busca) {

        String sql = "SELECT * FROM `exemplar` JOIN `publicacao` on `exemplar`.`publicacao_ISBN` = `publicacao`.`ISBN` where `publicacao`.`ISBN` = '" + busca + "' OR `publicacao`.`titulo` Like '" + busca + "%'";

        try {
            ArrayList<Exemplar> list = new ArrayList();

            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Exemplar exemplar = new Exemplar(rs.getInt("ISBN"), rs.getInt("numero"),
                        rs.getFloat("preco"), rs.getInt("status"), rs.getString("titulo"),
                        rs.getString("autor"), rs.getString("editora"), rs.getInt("ano"));

                list.add(exemplar);
            }

            rs.close();
            stmt.close();

            return list;

        } catch (SQLException e) {

            throw new RuntimeException(e);

        }
    }
}

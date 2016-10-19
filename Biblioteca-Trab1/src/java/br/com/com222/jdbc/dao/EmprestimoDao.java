package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Emprestimo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;

public class EmprestimoDao {
    
    Connection connection;

    public EmprestimoDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmprestimoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void cadastroEmp(Emprestimo emp){
        
        
        String sql = "INSERT INTO `emprestimo`(`id`, `dataRetirada`, `dataDevolucao`, `associado_codigo`, `exemplar_ISBN`, `exemplar_numero`, `status`) VALUES (?,?,?,?,?,?,?)";
        
        try {
            int prazo;
            
            AssociadoDao ad = new AssociadoDao();
            prazo = ad.consultaPrazo(emp.getCodigoAssoc());
            
            Date dataEmp = emp.getEmprestimo();
            Calendar c = Calendar.getInstance();
            c.setTime(dataEmp);
            c.add(Calendar.DAY_OF_MONTH, prazo);
            Date dataDev = c.getTime();
            
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            
            stmt.setInt(1, emp.getId());
            stmt.setDate(2, (java.sql.Date) emp.getEmprestimo());
            stmt.setDate(3, (java.sql.Date) dataDev);
            stmt.setInt(4, emp.getCodigoAssoc());
            stmt.setInt(5, emp.getExemplar().getNumero());
            stmt.setInt(6, emp.getStatus());
            
            stmt.execute();
            stmt.close();
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
    
    public String cadastroDev(int ISBN, int numExemplar){
        
        String sql1 = "SELECT  `dataDevolucao` FROM `emprestimo` WHERE `exemplar_ISBN` = "+ISBN+" AND `exemplar_numero` = "+numExemplar+" AND `status` = 1";
        
        try {
            String result = "";
            PreparedStatement stmt1 = this.connection.prepareStatement(sql1);

            ResultSet rs = stmt1.executeQuery();
            
            if (rs.next()) {
                Date dataDev = rs.getDate("dataDevolucao");
                Date dataAt = new Date();
                if(dataAt.before(dataDev)){
                    long diferenca = dataDev.getTime() - dataAt.getTime();
                    int atraso = (int) ((diferenca /1000) / 60 / 60 /24); //resultado é diferença entre as datas em dias
                    result = "A devolução está com "+atraso+" dias de atraso, portanto deverá ser paga uma multa de R$"+atraso+",00";
                }else{
                    result = "Devolução dentro do prazo.";
                }
            }
            
            rs.close();
            stmt1.close();
            
            return result;

        } catch (SQLException e) {

            throw new RuntimeException(e);
            
        }
        
        String sql2 = "UPDATE `emprestimo` SET `status`= 0 WHERE `exemplar_ISBN` = "+ISBN+" AND `exemplar_numero` = "+numExemplar+" AND `status` = 1";
        
        try {
            PreparedStatement stmt2 = this.connection.prepareStatement(sql2);
            
            stmt2.execute();
            stmt2.close();
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
}

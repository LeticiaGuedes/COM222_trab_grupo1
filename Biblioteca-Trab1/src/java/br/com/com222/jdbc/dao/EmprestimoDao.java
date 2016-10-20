package br.com.com222.jdbc.dao;

import br.com.com222.jdbc.ConnectionFactory;
import br.com.com222.model.Emprestimo;
import br.com.com222.model.Exemplar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class EmprestimoDao {
    
    Connection connection;

    public EmprestimoDao() {
        try {
            this.connection = new ConnectionFactory().getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmprestimoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String cadastroEmp(Emprestimo emp){
                
        String sql = "INSERT INTO `emprestimo`(`dataRetirada`, `dataDevolucao`, `associado_codigo`, `exemplar_ISBN`, `exemplar_numero`, `status`) VALUES (?,?,?,?,?,?)";
        
        try {
            if(this.verStatus(emp.getExemplar().getISBN(), emp.getExemplar().getNumero())==1){
                return "Exemplar já emprestado";
            }else{
                int prazo;

                AssociadoDao ad = new AssociadoDao();
                prazo = ad.consultaPrazo(emp.getCodigoAssoc());

                Date dataEmp = emp.getEmprestimo();
                Calendar c = Calendar.getInstance();
                c.setTime(dataEmp);
                c.add(Calendar.DAY_OF_MONTH, prazo);
                Date dataDev = c.getTime();

                PreparedStatement stmt = this.connection.prepareStatement(sql);

                //stmt.setInt(1, emp.getId());
                stmt.setDate(1, new java.sql.Date(emp.getEmprestimo().getTime()));
                stmt.setDate(2, new java.sql.Date(dataDev.getTime()));
                stmt.setInt(3, emp.getCodigoAssoc());
                stmt.setInt(4, emp.getExemplar().getISBN());
                stmt.setInt(5, emp.getExemplar().getNumero());
                stmt.setInt(6, emp.getStatus());

                new ExemplarDao().setStatus(1, emp.getExemplar().getISBN(), emp.getExemplar().getNumero());
                
                stmt.execute();
                stmt.close();
                
                return "Cadastro realizado com sucesso";
            }
        } catch(SQLException e) {
            if (e.getSQLState().equals("23000")) {
                return "Emprestimo já existente";
            } else {
                throw new RuntimeException(e.getSQLState());
            }
        }
    }
    
    public String cadastroDev(int ISBN, int numExemplar) {
        
        String sql = "SELECT * FROM `emprestimo` WHERE `exemplar_ISBN` = "+ISBN+" AND `exemplar_numero` = "+numExemplar+" AND `status` = 1";
        
        Emprestimo emp = new Emprestimo();
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                //Monta bean emprestimo
                int id = rs.getInt("id");
                Date emprestimo = rs.getDate("dataRetirada");
                Date devolucao = rs.getDate("dataDevolucao");
                int codigoAssoc = rs.getInt("associado_codigo");
                int status = rs.getInt("status");
                
                ExemplarDao exemp = new ExemplarDao();
                Exemplar exemplar = exemp.consulta(ISBN, numExemplar);
                
                emp.setId(id);
                emp.setEmprestimo(emprestimo);
                emp.setDevolucao(devolucao);
                emp.setCodigoAssoc(codigoAssoc);
                emp.setStatus(status);
                emp.setExemplar(exemplar);
            } else {
                return "Exemplar informado não se encontra emprestado!";
            }
            
            rs.close();
            stmt.close();

        } catch (SQLException e) {

            throw new RuntimeException(e);
            
        }
        
        //capta data atual e faz parse de util.Date para sql.Date
        Date dataAt = new Date();

        java.sql.Date dataDB = new java.sql.Date(dataAt.getTime());
        
        //atualiza data e status da tabela emprestimo
        this.devStatus(emp.getId(), dataDB );
        
        Date dataDev = emp.getDevolucao();
        new ExemplarDao().setStatus(0, emp.getExemplar().getISBN(), emp.getExemplar().getNumero());
        
        
        if(dataAt.after(dataDev)){
            long diferenca = dataAt.getTime() - dataDev.getTime();
            int atraso = Math.round((diferenca /1000) / 60 / 60 /24); //resultado é diferença entre as datas em dias
            return "A devolução está com "+atraso+" dias de atraso, portanto deverá ser paga uma multa de R$"+atraso+",00";
        }else{
            return "Devolução dentro do prazo.";
        }
    }
    
    public int verStatus(int ISBN, int numExemplar){
        
        String sql = "SELECT `status` FROM `emprestimo` WHERE `exemplar_ISBN` = "+ISBN+" AND `exemplar_numero` = "+numExemplar;
        
        try {
            
            int result = 0;
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                if(rs.getInt("status")==1){
                    result = 1;
                }
            }
            
            rs.close();
            stmt.close();
        
            return result;
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
    
    public void devStatus(int id, java.sql.Date dataAt){
        String sql = "UPDATE `emprestimo` SET `dataDevolucao` = ? , `status`= 0 WHERE `id` = ?";
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setDate(1, dataAt);
            stmt.setInt(2, id);
            stmt.execute();
            stmt.close();
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
    
    public List<Emprestimo> consultaEmpAt(int codAssoc, java.sql.Date dataAt){
        List<Emprestimo> list = new ArrayList<>();
        String sql = "SELECT * FROM `emprestimo` WHERE `associado_codigo` = "+codAssoc+" AND emprestimo.dataDevolucao > '"+dataAt+"' AND emprestimo.status = 1";
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Emprestimo emp = new Emprestimo();
                emp.setId(rs.getInt("id"));
                emp.setEmprestimo(rs.getDate("dataRetirada"));
                emp.setDevolucao(rs.getDate("dataDevolucao"));
                emp.setCodigoAssoc(rs.getInt("associado_codigo"));
                emp.setStatus(rs.getInt("status"));
                
                ExemplarDao exempDao = new ExemplarDao();
                Exemplar exemp = exempDao.consulta(rs.getInt("exemplar_ISBN"), rs.getInt("exemplar_numero"));
                emp.setExemplar(exemp);
                
                list.add(emp);
            }
            
            rs.close();
            stmt.close();
        
            return list;
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
    
    public List<Emprestimo> gerarHist(int codAssoc){
        List<Emprestimo> list = new ArrayList<>();
        String sql = "SELECT * FROM `emprestimo` WHERE `associado_codigo` = "+codAssoc;
        
        try {
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Emprestimo emp = new Emprestimo();
                emp.setId(rs.getInt("id"));
                emp.setEmprestimo(rs.getDate("dataRetirada"));
                emp.setDevolucao(rs.getDate("dataDevolucao"));
                emp.setCodigoAssoc(rs.getInt("associado_codigo"));
                emp.setStatus(rs.getInt("status"));
                
                ExemplarDao exempDao = new ExemplarDao();
                Exemplar exemp = exempDao.consulta(rs.getInt("exemplar_ISBN"), rs.getInt("exemplar_numero"));
                emp.setExemplar(exemp);
                
                list.add(emp);
            }
            
            rs.close();
            stmt.close();
        
            return list;
        } catch(SQLException e) {
            throw new RuntimeException (e);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author wallace
 */
public class ConnectionFactory {
    
    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://db4free.net:3306/biblioteca_trab1", "wallacefeliper", "baldochi12345");
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

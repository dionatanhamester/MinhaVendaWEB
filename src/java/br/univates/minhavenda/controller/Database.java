/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Dionatan
 */
public class Database {
    
    public Database(){}
    
    public Statement getInstance() throws ClassNotFoundException, SQLException{
        // Registrar o driver JDBC para PostgreSQL
        Class.forName("org.postgresql.Driver"); // ou DriverManager.registerDriver(new org.postgresql.Driver());
        // Conectar o banco
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/minhavenda_web", "postgres", "postgres");
        // Statement para executar a query
        return conn.createStatement();        
    }  
}

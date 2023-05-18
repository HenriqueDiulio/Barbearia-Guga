/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Henrique
 */
public class DataBaseDAO {

    Connection conn;

    // CONECTANDO COM O BANCO DE DADOS
    public void conectar() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");

        String user = "root";
        String pass = "";
        String url = "jdbc:mysql://localhost/projeto";
        conn = DriverManager.getConnection(url, user, pass);
        
    }
    // DESCONECATANDO DO BANCO DE DADOS
    public void desconectar() throws Exception {
        // ele vai testa se a conexão está ativa( ! == operador de negação) 
        if (!conn.isClosed()) {
            conn.close();

        }

    }
}

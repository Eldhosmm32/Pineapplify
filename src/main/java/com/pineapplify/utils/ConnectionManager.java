/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class ConnectionManager {

    Connection conn = null;

    public Connection getSQLConneection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        conn = (Connection) DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net/sql12355348", "sql12355348", "8ZiUr4USNU");
        //conn = (Connection) DriverManager.getConnection("jdbc:mysql://www.db4free.net/db_pineapplify", "pineapplify", "5yL9-Fe-vqC3Q");
        //conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db_agromart", "root", "root");

        return conn;
    }

    public void closeConnection() throws SQLException {
        conn.close();
    }
}

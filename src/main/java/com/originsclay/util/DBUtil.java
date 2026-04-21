package com.originsclay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBUtil - Database connection singleton for MariaDB / MySQL.
 * Update the URL, USER, and PASSWORD constants to match your environment.
 */
public class DBUtil {

    private static final String URL  = "jdbc:mysql://localhost:3306/origins_clay";
    private static final String USER = "root";
    private static final String PASS = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found.", e);
        }
    }

    /**
     * Returns a new database connection.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    private DBUtil() { /* prevent instantiation */ }
}

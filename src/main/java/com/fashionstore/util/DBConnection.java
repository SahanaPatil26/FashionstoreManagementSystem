package com.fashionstore.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/fashionstore_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // Ensure this is your password!

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            if (con != null) {
                System.out.println("✅ SUCCESS: Database Connected Successfully!");
            }
        } catch (Exception e) {
            System.err.println("❌ ERROR: Database Connection Failed!");
            e.printStackTrace();
        }
        return con;
    }
}
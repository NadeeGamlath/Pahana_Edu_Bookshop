package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.insert.model.LoginBean;

public class LoginDao {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    // Login Validation
    public boolean validate(LoginBean bean) {
        boolean status = false;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, bean.getEmail());
            ps.setString(2, bean.getPassword());
            ResultSet rs = ps.executeQuery();
            status = rs.next(); // true if match found
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}

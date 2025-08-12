package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.insert.model.RegisterBean;

public class RegisterDao {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }
    public boolean isEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) { // changed from SQLException to Exception
            e.printStackTrace();
        }
        return false;
    }

    public boolean registerUser(RegisterBean bean) {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getEmail());
            ps.setString(3, bean.getPassword());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) { // changed from SQLException to Exception
            e.printStackTrace();
            return false;
        }
    }

}

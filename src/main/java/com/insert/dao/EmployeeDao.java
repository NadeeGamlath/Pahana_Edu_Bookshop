package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.insert.model.CustomerBean;

public class EmployeeDao {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    // Insert Customer
    public boolean insertCustomer(CustomerBean customer) {
        boolean success = false;
        String sql = "INSERT INTO customer (acc_no, name, address, phone) VALUES (?, ?, ?, ?)";
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, customer.getAcc_no());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getPhone());

            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // View All Customers
    public List<CustomerBean> getAllCustomers() {
        List<CustomerBean> list = new ArrayList<>();
        String sql = "SELECT * FROM customer";
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                CustomerBean cb = new CustomerBean();
                cb.setAcc_no(rs.getString("acc_no"));
                cb.setName(rs.getString("name"));
                cb.setAddress(rs.getString("address"));
                cb.setPhone(rs.getString("phone"));
                list.add(cb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Delete Customer
    public static boolean deleteCustomer(String accNo) {
        boolean rowDeleted = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
                 PreparedStatement ps = conn.prepareStatement("DELETE FROM customer WHERE acc_no = ?")) {

                ps.setString(1, accNo);
                rowDeleted = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
    //Search Customers
    public static List<CustomerBean> searchCustomers(String query) {
        List<CustomerBean> customers = new ArrayList<>();

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM customer WHERE name LIKE ? OR acc_no LIKE ?"
            )
        ) {
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerBean c = new CustomerBean();
                c.setAcc_no(rs.getString("acc_no"));
                c.setName(rs.getString("name"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                customers.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }

    //Update Customers
    public static boolean updateCustomer(CustomerBean customer) {
        boolean updated = false;
        String sql = "UPDATE customer SET name = ?, address = ?, phone = ? WHERE acc_no = ?";

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getAcc_no());

            updated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }
}

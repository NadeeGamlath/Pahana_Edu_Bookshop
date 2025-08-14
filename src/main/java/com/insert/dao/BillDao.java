package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.insert.model.BillBean;

public class BillDao {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    // Save bill
    public boolean saveBill(BillBean bill) {
        boolean success = false;
        String sql = "INSERT INTO bill (customer_id, customer_name, item_ids, item_names, quantities, total_amount) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, bill.getCustomer_id());
            ps.setString(2, bill.getCustomer_name());
            ps.setString(3, bill.getItem_ids());
            ps.setString(4, bill.getItem_names());
            ps.setString(5, bill.getQuantities());
            ps.setDouble(6, bill.getTotal_amount());

            success = ps.executeUpdate() > 0;
        } catch(Exception e) { e.printStackTrace(); }
        return success;
    }
    public List<BillBean> getAllBills() {
        List<BillBean> bills = new ArrayList<>();
        String sql = "SELECT * FROM bill";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                BillBean b = new BillBean();
                b.setCustomer_id(rs.getString("customer_id"));
                b.setCustomer_name(rs.getString("customer_name"));
                b.setItem_ids(rs.getString("item_ids"));
                b.setItem_names(rs.getString("item_names"));
                b.setQuantities(rs.getString("quantities"));
                b.setTotal_amount(rs.getDouble("total_amount"));
                bills.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bills;
    }

}

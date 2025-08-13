package com.insert.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.insert.model.ItemBean;

public class ItemDao {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private final String JDBC_USER = "root";
    private final String JDBC_PASS = "1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }
    // Insert Item
    public boolean insertItem(ItemBean item) {
        boolean success = false;
        String sql = "INSERT INTO items (item_id, item_name, price,quantity, description) VALUES (?, ?, ?, ?, ?)";
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, item.getItem_id());
            ps.setString(2, item.getItem_name());
            ps.setDouble(3, item.getPrice());
            ps.setInt(4, item.getQuantity());
            ps.setString(5, item.getDescription());

            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return success;
    }
 // View All Items
    public List<ItemBean> getAllItems() {
        List<ItemBean> list = new ArrayList<>();
        String sql = "SELECT * FROM items";
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                ItemBean ib = new ItemBean();
                ib.setItem_id(rs.getString("item_id"));
                ib.setItem_name(rs.getString("item_name"));
                ib.setPrice(rs.getDouble("price"));
                ib.setQuantity(rs.getInt("quantity"));
                ib.setDescription(rs.getString("description"));
                list.add(ib);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Delete Item
    public static boolean deleteItem(String itemId) {
        boolean rowDeleted = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
                 PreparedStatement ps = conn.prepareStatement("DELETE FROM items WHERE item_id = ?")) {

                ps.setString(1, itemId);
                rowDeleted = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
    
  //Update items
    public static boolean updateItem(ItemBean item) {
        boolean updated = false;
        String sql = "UPDATE items SET item_name = ?, price = ?, quantity = ?, description = ? WHERE item_id = ?";

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, item.getItem_name());
            ps.setDouble(2, item.getPrice());
            ps.setInt(3, item.getQuantity());
            ps.setString(4, item.getDescription());
            ps.setString(5, item.getItem_id());

            updated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }
 // Search Items
    public static List<ItemBean> searchItem(String query) {
        List<ItemBean> items = new ArrayList<>();

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_edu", "root", "1234");
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM items WHERE item_name LIKE ? OR item_id LIKE ?"
            )
        ) {
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	ItemBean it = new ItemBean();
                it.setItem_id(rs.getString("item_id"));
                it.setItem_name(rs.getString("item_name"));
                it.setPrice(rs.getDouble("price"));
                it.setQuantity(rs.getInt("quantity"));
                it.setDescription(rs.getString("description"));
                items.add(it);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}

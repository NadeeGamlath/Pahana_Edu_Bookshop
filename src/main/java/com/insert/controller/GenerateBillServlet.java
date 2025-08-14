package com.insert.controller;

import com.insert.dao.BillDao;
import com.insert.dao.EmployeeDao;
import com.insert.dao.ItemDao;
import com.insert.model.BillBean;
import com.insert.model.CustomerBean;
import com.insert.model.ItemBean;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String acc_no = request.getParameter("acc_no");

        // Get customer details
        EmployeeDao dao = new EmployeeDao();
        List<CustomerBean> customers = dao.getAllCustomers();

        CustomerBean selectedCustomer = null;
        for (CustomerBean c : customers) {
            if (c.getAcc_no().equals(acc_no)) {
                selectedCustomer = c;
                break;
            }
        }

        // Get selected item IDs and quantities
        String[] itemIds = request.getParameterValues("item_id");
        String[] quantities = request.getParameterValues("quantity");

        ItemDao itemdao = new ItemDao();
        List<ItemBean> allItems = itemdao.getAllItems();
        List<ItemBean> selectedItems = new ArrayList<>();

        double grandTotal = 0;

        if (itemIds != null && quantities != null && itemIds.length == quantities.length) {
            for (int i = 0; i < itemIds.length; i++) {
                if (itemIds[i] != null && !itemIds[i].isEmpty()) {
                    String id = itemIds[i];
                    int qty = 1;
                    try {
                        qty = Integer.parseInt(quantities[i]);
                    } catch (NumberFormatException e) {
                        qty = 1;
                    }
                    for (ItemBean item : allItems) {
                        if (item.getItem_id().equals(id)) {
                            ItemBean copy = new ItemBean();
                            copy.setItem_id(item.getItem_id());
                            copy.setItem_name(item.getItem_name());
                            copy.setPrice(item.getPrice());
                            copy.setQuantity(qty);
                            selectedItems.add(copy);
                            grandTotal += item.getPrice() * qty;

                            // Reduce stock in DB
                            itemdao.reduceStock(item.getItem_id(), qty);
                            break;
                        }
                    }
                }
            }
        }
        
     // Store bill in DB
        if(selectedCustomer != null && !selectedItems.isEmpty()) {
            StringBuilder ids = new StringBuilder();
            StringBuilder names = new StringBuilder();
            StringBuilder qtys = new StringBuilder();
            for(int i=0;i<selectedItems.size();i++) {
                ItemBean si = selectedItems.get(i);
                ids.append(si.getItem_id());
                names.append(si.getItem_name());
                qtys.append(si.getQuantity());
                if(i!=selectedItems.size()-1) { ids.append(","); names.append(","); qtys.append(","); }
            }
            BillBean bill = new BillBean();
            bill.setCustomer_id(selectedCustomer.getAcc_no());
            bill.setCustomer_name(selectedCustomer.getName());
            bill.setItem_ids(ids.toString());
            bill.setItem_names(names.toString());
            bill.setQuantities(qtys.toString());
            bill.setTotal_amount(grandTotal);
            new BillDao().saveBill(bill);
        }


        // Set attributes for JSP
        request.setAttribute("selectedCustomer", selectedCustomer);
        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("grandTotal", grandTotal);

        // Also resend customers and items for form rendering
        request.setAttribute("customers", customers);
        request.setAttribute("items", itemdao.getAllItems()); // get updated stock

        // Forward back to billing.jsp
        request.getRequestDispatcher("View/bill_view.jsp").forward(request, response);
    }
}

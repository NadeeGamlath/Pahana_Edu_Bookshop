package com.insert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.ItemDao;
import com.insert.model.ItemBean;

@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateItemServlet() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("item_id");
        String itemName = request.getParameter("item_name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");

        ItemBean item = new ItemBean();
        item.setItem_id(itemId);
        item.setItem_name(itemName);
        item.setPrice(price);
        item.setQuantity(quantity);
        item.setDescription(description);

        boolean success = ItemDao.updateItem(item);

        if (success) {
            request.setAttribute("message", "Item updated successfully!");
        } else {
            request.setAttribute("message", "Update failed.");
        }

        // Reload updated item list
        response.sendRedirect("viewItemServlet");
	}

}

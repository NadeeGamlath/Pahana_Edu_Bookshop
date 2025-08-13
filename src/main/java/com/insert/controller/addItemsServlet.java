package com.insert.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.ItemDao;
import com.insert.model.ItemBean;

@WebServlet("/addItemsServlet")
public class addItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addItemsServlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_id = request.getParameter("itemId");
        String item_name = request.getParameter("itemName");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");

        ItemBean item = new ItemBean();
        item.setItem_id(item_id);
        item.setItem_name(item_name);
        item.setPrice(price);
        item.setQuantity(quantity);
        item.setDescription(description);

        ItemDao dao = new ItemDao();
        boolean result = dao.insertItem(item);

        if (result) {
            request.setAttribute("message", "Item added successfully!");
        } else {
            request.setAttribute("message", "Failed to add item.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("View/add_item.jsp");
        dispatcher.forward(request, response);
	}

}

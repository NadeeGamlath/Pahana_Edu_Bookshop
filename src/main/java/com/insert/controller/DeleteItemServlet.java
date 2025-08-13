package com.insert.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.ItemDao;


@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteItemServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("item_id");
        System.out.println("itemId**********************"+ itemId);
        try {
            boolean success = ItemDao.deleteItem(itemId);

            if (success) {
                // redirect to wrapper that triggers the servlet again
//            	response.sendRedirect(request.getContextPath() + "/View/view_item_wrapper.jsp");
            	request.setAttribute("message", "Item deleted successfully!");
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/View/view_item_wrapper.jsp");
            	dispatcher.forward(request, response);

            } else {
                response.getWriter().println("Failed to delete item with ID: " + itemId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting item: " + e.getMessage());
        }
	}

}

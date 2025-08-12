package com.insert.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.EmployeeDao;


@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accNo = request.getParameter("acc_no");
        try {
            boolean success = EmployeeDao.deleteCustomer(accNo);

            if (success) {
                // redirect to wrapper that triggers the servlet again
//            	response.sendRedirect(request.getContextPath() + "/View/view_customer_wrapper.jsp");
            	request.setAttribute("message", "Customer deleted successfully!");
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/View/view_customer_wrapper.jsp");
            	dispatcher.forward(request, response);

            } else {
                response.getWriter().println("Failed to delete customer with ID: " + accNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting customer: " + e.getMessage());
        }
	}

}

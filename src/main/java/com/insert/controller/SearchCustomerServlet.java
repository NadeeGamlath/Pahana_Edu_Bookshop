package com.insert.controller;

import java.io.IOException;
import java.util.List;
import com.insert.model.CustomerBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.EmployeeDao;


@WebServlet("/SearchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SearchCustomerServlet() {
        super();
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = request.getParameter("query");
        List<CustomerBean> customerList = EmployeeDao.searchCustomers(query);

        request.setAttribute("customerList", customerList);
        request.setAttribute("message", "Showing results for: " + query);
        request.getRequestDispatcher("/View/view_customer.jsp").forward(request, response);
	}

}

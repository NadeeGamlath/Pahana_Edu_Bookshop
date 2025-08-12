package com.insert.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.EmployeeDao;
import com.insert.model.CustomerBean;


@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ViewCustomerServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeDao dao = new EmployeeDao();
        List<CustomerBean> customerList = dao.getAllCustomers();

        request.setAttribute("customerList", customerList);
        RequestDispatcher rd = request.getRequestDispatcher("View/view_customer.jsp");
        rd.forward(request, response);
    }
    
    // Optional: Also allow GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    
	}

}

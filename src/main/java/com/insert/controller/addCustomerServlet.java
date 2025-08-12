package com.insert.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.EmployeeDao;
import com.insert.model.CustomerBean;

@WebServlet("/addCustomerServlet")
public class addCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acc_no = request.getParameter("acc_no");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        CustomerBean customer = new CustomerBean();
        customer.setAcc_no(acc_no);
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhone(phone);

        EmployeeDao dao = new EmployeeDao();
        boolean result = dao.insertCustomer(customer);

        if (result) {
            request.setAttribute("message", "Customer added successfully!");
        } else {
            request.setAttribute("message", "Failed to add customer.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("View/add_customer.jsp");
        dispatcher.forward(request, response);
    }
}

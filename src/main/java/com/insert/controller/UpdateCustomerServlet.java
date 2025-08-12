package com.insert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.EmployeeDao;
import com.insert.model.CustomerBean;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateCustomerServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accNo = request.getParameter("acc_no");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        CustomerBean customer = new CustomerBean();
        customer.setAcc_no(accNo);
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhone(phone);


        boolean success = EmployeeDao.updateCustomer(customer);

        if (success) {
            request.setAttribute("message", "Customer updated successfully!");
        } else {
            request.setAttribute("message", "Update failed.");
        }

        response.sendRedirect("ViewCustomerServlet");
	}

}

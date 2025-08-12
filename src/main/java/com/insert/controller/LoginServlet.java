package com.insert.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.insert.dao.LoginDao;
import com.insert.model.LoginBean;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
       
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("username");
	        String password = request.getParameter("password");

	        LoginBean bean = new LoginBean();
	        bean.setEmail(email);
	        bean.setPassword(password);

	        LoginDao dao = new LoginDao();
	        boolean isValid = dao.validate(bean);

	        if (isValid) {
	            HttpSession session = request.getSession();
	            session.setAttribute("user", email);
	            response.sendRedirect("View/header.jsp");
	        } else {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("loginError", "Invalid email or password!");
	        	response.sendRedirect(request.getContextPath() + "/View/login.jsp");
	        }
	}

}

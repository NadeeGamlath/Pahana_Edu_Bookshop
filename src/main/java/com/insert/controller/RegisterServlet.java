package com.insert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.insert.dao.RegisterDao;
import com.insert.model.RegisterBean;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        RegisterDao dao = new RegisterDao();

        // 1. Password match validation
        if (!password.equals(confirmPassword)) {
            session.setAttribute("registerError", "Password and Confirm Password do not match!");
            response.sendRedirect("View/register.jsp");
            return;
        }

        // 2. Email uniqueness validation
        if (dao.isEmailExists(email)) {
            session.setAttribute("registerError", "Email already registered! Please use another.");
            response.sendRedirect("View/register.jsp");
            return;
        }

        // 3. Save user
        RegisterBean user = new RegisterBean();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password); // In production, hash before saving

        boolean success = dao.registerUser(user);

        if (success) {
            session.setAttribute("registerSuccess", "Registration successful! Please login.");
            HttpSession sessions = request.getSession();
            sessions.setAttribute("user", email);
            response.sendRedirect("View/header.jsp");
        } else {
            session.setAttribute("registerError", "Registration failed! Please try again.");
            response.sendRedirect("View/register.jsp");
        }

        
    }

}

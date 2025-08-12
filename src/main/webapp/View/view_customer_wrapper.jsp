<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewCustomerServlet");
    dispatcher.include(request, response);
%>
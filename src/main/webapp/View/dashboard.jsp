<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.insert.dao.EmployeeDao" %>
<%@ page import="com.insert.dao.ItemDao" %>
<%@ page import="com.insert.model.CustomerBean" %>
<%@ page import="com.insert.model.ItemBean" %>
<%@ page import="com.insert.dao.BillDao" %>

<%
    // Redirect to login if user not logged in
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    EmployeeDao dao = new EmployeeDao();
    int customerCount = dao.getAllCustomers().size();
    ItemDao idao = new ItemDao();
    int itemCount = idao.getAllItems().size();
    BillDao bdao = new BillDao();
    int billCount = bdao.getAllBills().size();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .shortcut-btn {
            width: 100%;
            padding: 15px;
            font-size: 1.1rem;
            border-radius: 10px;
        }
        .body-padding {
        	padding-top: 1rem;
        	padding-right: 1rem;
        }
        .row {
        	padding-top: 2rem;
        }
    </style>
</head>
<body class="body-padding">

    <h3 class="mb-4">Welcome, <%= user %> 👋</h3>

    <!-- Stats Row -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card dashboard-card bg-primary text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Customers</h5>
                    <h2><%= customerCount %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card dashboard-card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Total Items</h5>
                    <h2><%= itemCount %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card dashboard-card bg-warning text-dark">
                <div class="card-body">
                    <h5 class="card-title">Recent Bills</h5>
                    <h2><%= billCount %></h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Shortcuts Row -->
    <div class="row mb-4">
        
        <div class="col-md-2">
            <a href="add_customer.jsp" class="btn btn-outline-success shortcut-btn">Add Customers</a>
        </div>
        <div class="col-md-2">
            <a href="view_customer_wrapper.jsp" class="btn btn-outline-success shortcut-btn">View Customers</a>
        </div>
        <div class="col-md-2">
            <a href="add_item.jsp" class="btn btn-outline-info shortcut-btn">Add Items</a>
        </div>
         <div class="col-md-2">
            <a href="view_item_wrapper.jsp" class="btn btn-outline-info shortcut-btn">View Items</a>
        </div>
        <div class="col-md-2">
            <a href="billing.jsp" class="btn btn-outline-warning shortcut-btn">Billing</a>
        </div>
        <div class="col-md-2">
            <a href="help_section.jsp" class="btn btn-outline-dark shortcut-btn">Help</a>
        </div>
    </div>

  
</body>
</html>

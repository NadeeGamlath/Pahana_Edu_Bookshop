<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.ItemBean" %>
<%@ page import="com.insert.model.CustomerBean" %>

<%
    CustomerBean customer = (CustomerBean) request.getAttribute("selectedCustomer");
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("selectedItems");
    Double grandTotal = (Double) request.getAttribute("grandTotal");
    if(grandTotal == null) grandTotal = 0.0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Bill - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    	body {
            background-color: #f8f9fa;
            margin-right: 16px;
        }
         h3 {
         margin: 0 0 2rem 0;
        }
    </style>
</head>
<body class="p-3">

<h3>Pahana Edu Bookshop - Bill</h3>

<% if(customer != null && items != null && !items.isEmpty()) { %>
    <h5>Customer: <%= customer.getName() %> (<%= customer.getAcc_no() %>)</h5>
    <table class="table table-bordered mt-3">
        <thead>
            <tr><th>Item Name</th><th>Price</th><th>Quantity</th><th>Subtotal</th></tr>
        </thead>
        <tbody>
            <% for(ItemBean i : items) { %>
                <tr>
                    <td><%= i.getItem_name() %></td>
                    <td><%= String.format("%.2f", i.getPrice()) %></td>
                    <td><%= i.getQuantity() %></td>
                    <td><%= String.format("%.2f", i.getPrice()*i.getQuantity()) %></td>
                </tr>
            <% } %>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3" class="text-end">Total</th>
                <th><%= String.format("%.2f", grandTotal) %></th>
            </tr>
        </tfoot>
    </table>

    <button class="btn btn-success" onclick="window.print()">Print Bill</button>
<% } else { %>
    <p>No bill generated.</p>
<% } %>

</body>
</html>

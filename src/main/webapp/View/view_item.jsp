<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.ItemBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Items - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            margin-right: 16px;
        }
        .container {
        	margin-top: 16px;
        	margin-left:0;
        	margin-right:0;
        	padding:0;
        	width:100%;
        }
        .container, .container-lg, .container-md, .container-sm, .container-xl {
        	max-width: 100%;
    
        }
       
    </style>
</head>
<body>

<div class="container">
    <h2 class="mb-4">📚 Item Management</h2>

    <!-- Search bar -->
    <form class="d-flex mb-4" method="get" action="<%= request.getContextPath() %>/SearchItemServlet">
        <input class="form-control me-2" type="search" name="query" placeholder="Search by Item ID or Name">
        <button class="btn btn-primary" type="submit">Search</button>
    </form>
<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>

    <!-- Items Table -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Item ID</th>
            <th>Name</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
    List<com.insert.model.ItemBean> itemList = (List<com.insert.model.ItemBean>) request.getAttribute("itemList");
        
    if (itemList != null && !itemList.isEmpty()) {
        for (com.insert.model.ItemBean it : itemList) {
%>
         <tr>
        <td><%= it.getItem_id() %></td>
        <td><%= it.getItem_name() %></td>
        <td><%= it.getPrice() %></td>
        <td><%= it.getQuantity() %></td>
        <td><%= it.getDescription() %></td>
        <td>
            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal"
                    onclick="fillEditForm('<%= it.getItem_id() %>', '<%= it.getItem_name() %>', '<%= it.getPrice() %>','<%= it.getQuantity() %>', '<%= it.getDescription() %>')">Edit</button>
            <a href="<%= request.getContextPath() %>/DeleteItemServlet?item_id=<%= it.getItem_id() %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
            
            
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="6" class="text-center text-muted">No Item records found.</td>
    </tr>
<%
    }
%>
        </tbody>
    </table>
</div>

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<%= request.getContextPath() %>/UpdateItemServlet" method="post">
        <div class="modal-header">
          <h5 class="modal-title">Edit Item</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="item_id" id="editItemId">
          <div class="mb-3">
            <label class="form-label">Item ID</label>
            <input type="text" id="editItemIdText" class="form-control" disabled>
          </div>
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" id="editName" name="item_name" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Price (Rs.)</label>
            <input type="number" id="editPrice" name="price" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="number" id="editQuantity" name="quantity" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea id="editDescription" class="form-control" name="description" rows="3"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success" >Update</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- JavaScript -->
<script>
    function fillEditForm(id, name, price,quantity, description) {
        document.getElementById('editItemId').value = id;
        document.getElementById('editItemIdText').value = id;
        document.getElementById('editName').value = name;
        document.getElementById('editPrice').value = price;
        document.getElementById('editQuantity').value = quantity;
        document.getElementById('editDescription').value = description;
    }
</script>

</body>
</html>
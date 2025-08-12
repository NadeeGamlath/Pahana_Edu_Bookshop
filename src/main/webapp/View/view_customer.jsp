<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.CustomerBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>View / Edit Customers - Pahana Edu</title>
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
    <h2 class="mb-4">Customer Management</h2>

    <!-- Search Bar -->
    <form class="d-flex mb-4" method="get" action="<%= request.getContextPath() %>/SearchCustomerServlet">
	    <input class="form-control me-2" type="search" name="query" placeholder="Search by Name or Account No" required>
	    <button class="btn btn-primary" type="submit">Search</button>
	</form>
    
<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>
    <!-- Customer Table -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
    List<com.insert.model.CustomerBean> customerList = (List<com.insert.model.CustomerBean>) request.getAttribute("customerList");
    if (customerList != null && !customerList.isEmpty()) {
        for (com.insert.model.CustomerBean c : customerList) {
%>
    <tr>
        <td><%= c.getAcc_no() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getAddress() %></td>
        <td><%= c.getPhone() %></td>
        <td>
            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal"
                    onclick="fillEditForm('<%= c.getAcc_no() %>', '<%= c.getName() %>', '<%= c.getAddress() %>', '<%= c.getPhone() %>')">Edit</button>
            <a href="<%= request.getContextPath() %>/DeleteCustomerServlet?acc_no=<%= c.getAcc_no() %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="6" class="text-center text-muted">No customer records found.</td>
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
      <form action="<%= request.getContextPath() %>/UpdateCustomerServlet" method="post">
        <div class="modal-header">
          <h5 class="modal-title">Edit Customer</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="editAccountNo" name="acc_no">
          <div class="mb-3">
            <label class="form-label">Account No</label>
            <input type="text" id="editAccountNoText" class="form-control" disabled>
          </div>
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" id="editName"  name="name" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Address</label>
            <input type="text" id="editAddress" name="address" class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" id="editPhone" name="phone" class="form-control">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- JavaScript for filling modal -->
<script>
    function fillEditForm(accountNo, name, address, phone) {
        document.getElementById("editAccountNo").value = accountNo;
        document.getElementById("editAccountNoText").value = accountNo;
        document.getElementById("editName").value = name;
        document.getElementById("editAddress").value = address;
        document.getElementById("editPhone").value = phone;
    }
</script>

</body>
</html>

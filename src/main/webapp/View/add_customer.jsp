<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer - Pahana Edu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin-right: 16px;
        }
       
        h2 {
 
            margin: 16px 0 25px 0;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2 class="text-left">Add New Customer</h2>
    <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-info">
            <%= request.getAttribute("message") %>
        </div>
    <% } %>
    <form action="<%= request.getContextPath() %>/addCustomerServlet" method="post">
        <div class="mb-3">
            <label for="acc_no" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="acc_no" name="acc_no" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Telephone Number</label>
            <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" placeholder="Phone" required>
        </div>
        <div class="d-flex justify-content-between">
            <button type="reset" class="btn btn-secondary">Clear</button>
            <button type="submit" class="btn btn-primary">Add Customer</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

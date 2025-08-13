<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Item - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin-right: 16px;
        }
       
        h2 {
 
            margin: 16px 0 25px 0;
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
    <h2 class="mb-4">Add New Item</h2>
	<% if (request.getAttribute("message") != null) { %>
	        <div class="alert alert-info">
	            <%= request.getAttribute("message") %>
	        </div>
	    <% } %>
    <form  action="<%= request.getContextPath() %>/addItemsServlet" method="post"> 
        <div class="mb-3">
            <label for="itemId" class="form-label">Item ID</label>
            <input type="text" class="form-control" id="itemId" name="itemId" placeholder="E.g., B001" required>
        </div>

        <div class="mb-3">
            <label for="itemName" class="form-label">Item Name</label>
            <input type="text" class="form-control" id="itemName" name="itemName" placeholder="E.g., English Grammar Book" required>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Price (Rs.)</label>
            <input type="number" class="form-control" id="price" name="price" placeholder="E.g., 450" required>
        </div>
        
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description (Optional)</label>
            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter short description..."></textarea>
        </div>

        <button type="submit" class="btn btn-success">Add Item</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
    </form>
</div>

</body>
</html>
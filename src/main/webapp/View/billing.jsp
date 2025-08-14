<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.insert.model.CustomerBean" %>
<%@ page import="com.insert.model.ItemBean" %>

<%
    List<CustomerBean> customers = (List<CustomerBean>) request.getAttribute("customers");
    if (customers == null) { // first time load, get from dao
        com.insert.dao.EmployeeDao dao = new com.insert.dao.EmployeeDao();
        customers = dao.getAllCustomers();
        request.setAttribute("customers", customers);
    }
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("items");
    if (items == null) {
        com.insert.dao.ItemDao dao = new com.insert.dao.ItemDao();
        items = dao.getAllItems();
        request.setAttribute("items", items);
    }

    CustomerBean selectedCustomer = (CustomerBean) request.getAttribute("selectedCustomer");
    List<ItemBean> selectedItems = (List<ItemBean>) request.getAttribute("selectedItems");
    Double grandTotal = (Double) request.getAttribute("grandTotal");
    if (grandTotal == null) grandTotal = 0.0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Billing - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
<body class="pt-3">

<h3>Generate Bill</h3>

<form action="<%= request.getContextPath() %>/GenerateBillServlet" method="post">
    <!-- Customer select -->
    <div class="mb-3">
        <label class="form-label">Select Customer:</label>
        <select name="acc_no" class="form-select" required>
            <option value="">-- Select Customer --</option>
            <% for (CustomerBean c : customers) { %>
                <option value="<%= c.getAcc_no() %>" 
                    <%= (selectedCustomer != null && selectedCustomer.getAcc_no().equals(c.getAcc_no())) ? "selected" : "" %>>
                    <%= c.getName() %> - <%= c.getAcc_no() %>
                </option>
            <% } %>
        </select>
    </div>
   <!-- Item Search -->
<!-- Item Search -->
<div class="mb-3">
    <input type="text" id="itemSearch" class="form-control" placeholder="Search by Item ID or Name">
</div>
    <!-- Items -->
    <table class="table table-bordered">
        <thead>
            <tr><th>Select</th><th>Item Name</th><th>Price</th><th>Quantity</th></tr>
        </thead>
        <tbody>
            <% for (ItemBean i : items) {
                boolean isChecked = false;
                int quantity = 1;
                if (selectedItems != null) {
                    for (ItemBean si : selectedItems) {
                        if (si.getItem_id().equals(i.getItem_id())) {
                            isChecked = true;
                            quantity = si.getQuantity();
                            break;
                        }
                    }
                }
            %>
            <tr>
                <td>
                    <input type="checkbox" name="item_id" value="<%= i.getItem_id() %>" <%= isChecked ? "checked" : "" %> />
                </td>
                <td><%= i.getItem_id() %></td>
                <td><%= i.getItem_name() %></td>
                <td><%= i.getPrice() %></td>
                <td>
                    <input type="number" name="quantity" min="1" value="<%= quantity %>" class="form-control" <%= isChecked ? "" : "disabled" %> />
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <button type="submit" class="btn btn-primary">Generate Bill</button>
</form>
<script>
    // Filter item table based on input
    document.getElementById('itemSearch').addEventListener('keyup', function() {
        const query = this.value.toLowerCase();
        const rows = document.querySelectorAll('table tbody tr');

        rows.forEach(row => {
            const itemId = row.cells[1].textContent.toLowerCase();
            const itemName = row.cells[2].textContent.toLowerCase();
            if (itemId.includes(query) || itemName.includes(query)) {
                row.style.display = ''; // show row
            } else {
                row.style.display = 'none'; // hide row
            }
        });
    });
</script>

<script>
    // Enable quantity input when checkbox checked, disable otherwise
    document.querySelectorAll('input[type=checkbox][name=item_id]').forEach(cb => {
        cb.addEventListener('change', () => {
            const qtyInput = cb.closest('tr').querySelector('input[name=quantity]');
            qtyInput.disabled = !cb.checked;
            if (!cb.checked) qtyInput.value = 1;
        });
    });

    // On page load, if bill exists, show modal
    window.onload = function() {
        <% if (selectedCustomer != null && selectedItems != null && !selectedItems.isEmpty()) { %>
            var billModal = new bootstrap.Modal(document.getElementById('billModal'));
            billModal.show();
        <% } %>
    };
</script>

</body>
</html>

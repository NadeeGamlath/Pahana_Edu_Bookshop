<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-right: 1rem;
        }
       h3 {
         margin: 0 0 2rem 0;
        }
        .accordion-button {
            font-weight: bold;
            font-size: 1.1rem;
        }
        .accordion-button:hover {
            background-color: #e7f1ff;
        }
        .search-box {
            margin-bottom: 20px;
        }
        .highlight {
            background-color: yellow;
        }
    </style>
</head>
<body class="pt-3">
    <div>
        <h3 class="mb-4"> Help & User Guide</h3>

        <!-- Search -->
        <input type="text" id="searchInput" class="form-control search-box" placeholder="Search help topics...">

        <div class="accordion" id="helpAccordion">

            <!-- Register -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#registerHelp">
                        <i class="bi bi-person-plus me-2 text-success"></i> Register
                    </button>
                </h2>
                <div id="registerHelp" class="accordion-collapse collapse show">
                    <div class="accordion-body">
                        <p>Admins can register new accounts by filling the form with:</p>
                        <ul>
                            <li>Full Name</li>
                            <li>Email Address</li>
                            <li>Username</li>
                            <li>Password & Confirm Password</li>
                        </ul>
                        <p>Click <strong>Submit</strong> to save the account.</p>
                    </div>
                </div>
            </div>

            <!-- Login -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#loginHelp">
                        <i class="bi bi-box-arrow-in-right me-2 text-primary"></i> Login
                    </button>
                </h2>
                <div id="loginHelp" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <p>To log in:</p>
                        <ol>
                            <li>Enter your registered <strong>username/email</strong>.</li>
                            <li>Type your <strong>password</strong>.</li>
                            <li>Click <strong>Login</strong> to access the dashboard.</li>
                        </ol>
                        <p>If credentials are wrong, an error will appear.</p>
                    </div>
                </div>
            </div>
            
            <!-- Dashboard -->
		<div class="accordion-item">
		    <h2 class="accordion-header">
		        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#dashboardHelp">
		            <i class="bi bi-speedometer2 me-2 text-info"></i> Dashboard
		        </button>
		    </h2>
		    <div id="dashboardHelp" class="accordion-collapse collapse">
		        <div class="accordion-body">
		            <p>The <strong>Dashboard</strong> gives you a quick overview of the system:</p>
		            <ul>
		                <li><strong>Total Customers:</strong> Displays the number of registered customers.</li>
		                <li><strong>Total Items:</strong> Shows how many items are available in inventory.</li>
		                <li><strong>Recent Bills:</strong> Quick view of billing activity.</li>
		            </ul>
		            <p>Below the statistics, you can access <strong>shortcuts</strong> to quickly manage:</p>
		            <ul>
		                <li><strong>Add/View Customers</strong></li>
		                <li><strong>Add/View Items</strong></li>
		                <li><strong>Billing Section</strong></li>
		                <li><strong>Help Section</strong></li>
		            </ul>
		            <p>Use the dashboard as your starting point for daily tasks 🚀.</p>
		        </div>
		    </div>
		</div>
            <!-- Customer Management -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#customerHelp">
                        <i class="bi bi-people me-2 text-warning"></i> Customer Management
                    </button>
                </h2>
                <div id="customerHelp" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <p>You can manage customers by:</p>
                        <ul>
                            <li><strong>Add:</strong> Fill in name, contact number, and address.</li>
                            <li><strong>Edit:</strong> Click edit icon, update fields, save changes.</li>
                            <li><strong>Search:</strong> Use the search bar to find by name.</li>
                            <li><strong>Delete:</strong> Click delete icon to remove a record.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Item Management -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#itemHelp">
                        <i class="bi bi-box-seam me-2 text-danger"></i> Item Management
                    </button>
                </h2>
                <div id="itemHelp" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <p>Control inventory by:</p>
                        <ul>
                            <li><strong>Add:</strong> Item name, category, price, stock.</li>
                            <li><strong>Edit:</strong> Update item details anytime.</li>
                            <li><strong>Search:</strong> Quickly find items by name or ID.</li>
                            <li><strong>Delete:</strong> Remove outdated or unavailable items.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Billing -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#billingHelp">
                        <i class="bi bi-receipt me-2 text-success"></i> Billing
                    </button>
                </h2>
                <div id="billingHelp" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <p>Steps for billing:</p>
                        <ol>
                            <li>Select a <strong>Customer</strong>.</li>
                            <li>Choose <strong>Items</strong> from the search.</li>
                            <li>Adjust <strong>Quantities</strong> as needed.</li>
                            <li>Total is auto-calculated.</li>
                            <li>Click <strong>Print</strong> or <strong>Save as PDF</strong>.</li>
                        </ol>
                    </div>
                </div>
            </div>

            <!-- Logout -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#logoutHelp">
                        <i class="bi bi-box-arrow-right me-2 text-secondary"></i> Logout
                    </button>
                </h2>
                <div id="logoutHelp" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <p>Click the <strong>Logout</strong> button in the top menu to safely end your session.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Search functionality
        document.getElementById("searchInput").addEventListener("input", function() {
            let query = this.value.toLowerCase();
            document.querySelectorAll(".accordion-item").forEach(function(item) {
                let text = item.innerText.toLowerCase();
                if (text.includes(query)) {
                    item.style.display = "";
                } else {
                    item.style.display = "none";
                }
            });
        });
    </script>
</body>
</html>

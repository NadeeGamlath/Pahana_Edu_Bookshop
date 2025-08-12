<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Pahana Edu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            background-color: #f8f9fa;
        }
        .login-container {
            height: 100vh;
        }
        .welcome-section {
            background: #121538;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 50px;
        }
        .login-section {
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            width: 100%;
            max-width: 400px;
        }
        .btn-primary {
        	background-color:#121538;
        	border-color:#121538;
        }
    </style>
</head>
<body>
<div class="container-fluid login-container">
    <div class="row h-100">
        <!-- Left Side Welcome Section -->
        <div class="col-md-6 welcome-section text-center">
            <h1>Welcome to</h1>
            <h1 class="fw-bold">Pahana Edu Bookshop</h1>
            <p class="mt-3">Efficient and Smart Billing System</p>
            <div class="text-center">
			  <img src="logo.jpg" width="100" height="100" class="logo">
			</div>

        </div>

        <!-- Right Side Login Form -->
        <div class="col-md-6 login-section">
            <div class="login-box">
                <h2 class="text-left mb-4">Sign in</h2>
                <%
				    String error = (String) session.getAttribute("loginError");
				    if (error != null) {
				%>
				    <div class="alert alert-danger" role="alert">
				        <%= error %>
				    </div>
				<%
				    session.removeAttribute("loginError"); // clear after showing
				    }
				%>
                <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                    <p class="text-left text-muted">Don't have an account? Contact admin.</p>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

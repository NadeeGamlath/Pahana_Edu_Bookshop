<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("View/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Pahana Edu System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            height: 100%;
            overflow: hidden;
            background-color: #f8f9fa;
        }
        .main-wrapper {
            display: flex;
            height: calc(100vh - 32px);
        }
        .sidebar {
            width: 300px;
            background-color: #121538;
            color: white;
            border-radius: 16px;
            margin: 16px;
            height: 100%;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
        }
        .sidebar a.active {
            background-color: #084298;
        }
        iframe {
            flex-grow: 1;
            border: none;
            width: 100%;
        }
        .title {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="main-wrapper">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="container-fluid title text-center">
            <img src="logo.jpg" width="60" height="60" class="logo">
            <h5>Pahana Edu</h5>
        </div>
        <hr>
        <div>
        	<a href="dashboard.jsp" target="contentFrame" class="nav-link">Dashboard</a>
            <a href="add_customer.jsp" target="contentFrame" class="nav-link">Add Customer</a>
            <a href="view_customer_wrapper.jsp" target="contentFrame" class="nav-link">View Customers</a>
            <a href="add_item.jsp" target="contentFrame" class="nav-link">Add Item</a>
            <a href="view_item_wrapper.jsp" target="contentFrame" class="nav-link">View Items</a>
            <a href="billing.jsp" target="contentFrame" class="nav-link">Billing</a>
            <a href="help_section.jsp" target="contentFrame" class="nav-link">Help</a>
            <a href="logout.jsp" target="contentFrame" class="nav-link">Logout</a>
        </div>
    </div>

    <!-- Dynamic Content Area -->
    <iframe name="contentFrame" id="contentFrame"></iframe>
</div>

<script>
    const links = document.querySelectorAll('.sidebar a.nav-link');
    const iframe = document.getElementById('contentFrame');

    // Load page based on URL query param or default first link
    function loadPageFromUrl() {
        const urlParams = new URLSearchParams(window.location.search);
        let page = urlParams.get('page');
        if (!page) {
            // default first link href page name
            page = links[0].href.split('/').pop();
            history.replaceState(null, '', '?page=' + page);
        }
        iframe.src = page;

        links.forEach(link => {
            link.classList.toggle('active', link.href.endsWith(page));
        });
    }

    // Update iframe and URL on sidebar link click
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const page = this.href.split('/').pop();
            iframe.src = page;
            history.pushState(null, '', '?page=' + page);
            links.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Handle back/forward buttons
    window.addEventListener('popstate', () => {
        loadPageFromUrl();
    });

    // Initial load
    loadPageFromUrl();
</script>

</body>
</html>

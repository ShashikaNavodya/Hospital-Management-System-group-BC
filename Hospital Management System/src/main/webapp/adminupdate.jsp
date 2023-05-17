<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="model.admin" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    String username = (String) session1.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Admin User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
	    <div class="container-fluid">
	        <a class="navbar-brand" href="dashboard.jsp">Wecare</a>
	        <div class="collapse navbar-collapse" id="navbarText">
	            <ul class="navbar-nav me-auto">
	            	<li class="nav-item"><a class="nav-link" href="DashboardServlet">Dashboard</a></li>
	                <li class="nav-item"><a class="nav-link active" href="adminmanagement.jsp">Admin Users Management</a></li>
	                <li class="nav-item"><a class="nav-link" href="doctormanagement.jsp">Manage Doctors</a></li>
	                <li class="nav-item"><a class="nav-link" href="bookingmanagement.jsp">View Bookings</a></li>
	            </ul>
	            <span class="navbar-text text-white me-3">Welcome, <%= username %></span>
	            <a href="logout" class="btn btn-danger">Logout</a>
	        </div>
	    </div>
	</nav>
	
	<div class="container mt-4">
	    <h3 class="text-center">
	    <img alt="img/persom.svg" src="img/edit-info.png" class="rounded-circle mx-auto mb-3 " alt="Doctor Image" style="width: 70px;  height: 70px; object-fit: cover;"><br>
	    Update Admin User
	    </h3>
	
	    <!-- Search Form -->
	    <form method="get" action="updateAdminServlet" class="d-flex mb-3 justify-content-center">
	        <input class="form-control me-2 w-50" name="searchEmail" type="search" placeholder="Search by email">
	        <button class="btn btn-outline-primary" type="submit">Search</button>
	    </form>
	
	    <%
	        admin foundAdmin = (admin) request.getAttribute("foundAdmin");
	        String message = (String) request.getAttribute("message");
	    %>
	
	    <% if (foundAdmin != null) { %>
	        <!-- Update Form -->
	        <form method="post" action="updateAdminServlet" class="card p-4">
	            <h5 class="mb-3">Edit Admin Details</h5>
	            <input type="hidden" name="originalEmail" value="<%= foundAdmin.getEmail() %>">
	
	            <div class="mb-3">
	                <label>Name</label>
	                <input type="text" name="name" class="form-control" value="<%= foundAdmin.getName() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Email</label>
	                <input type="email" name="email" class="form-control" value="<%= foundAdmin.getEmail() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Password</label>
	                <input type="text" name="password" class="form-control" value="<%= foundAdmin.getPassword() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Role</label>
	                <select name="role" class="form-control" required>
	                    <option value="admin" <%= "admin".equals(foundAdmin.getRole()) ? "selected" : "" %>>Admin</option>
	                    <option value="manager" <%= "manager".equals(foundAdmin.getRole()) ? "selected" : "" %>>Manager</option>
	                </select>
	            </div>
	            <button type="submit" class="btn btn-success">Update</button>
	        </form>
	    <% } else if (message != null) { %>
	        <div class="alert alert-info mt-3"><%= message %></div>
	    <% } %>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

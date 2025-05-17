<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="model.doctor" %>

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
    <title>Update Doctor</title>
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
                <li class="nav-item"><a class="nav-link" href="adminmanagement.jsp">Admin Users Management</a></li>
                <li class="nav-item"><a class="nav-link active" href="doctormanagement.jsp">Manage Doctors</a></li>
                <li class="nav-item"><a class="nav-link" href="bookingmanagement.jsp">View Bookings</a></li>
            </ul>
            <span class="navbar-text text-white me-3">Welcome, <%= username %></span>
            <a href="logout" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

	<div class="container mt-4">
	    <h3 class="text-center">
	        <img src="img/edit-info.png" class="rounded-circle mx-auto mb-3" alt="Edit Doctor" style="width: 70px; height: 70px; object-fit: cover;"><br>
	        Update Doctor Details
	    </h3>
	
	    <!-- Search Form -->
	    <form method="get" action="updateDoctorServelet" class="d-flex mb-3 justify-content-center">
	        <input class="form-control me-2 w-50" name="searchEmail" type="search" placeholder="Search by email">
	        <button class="btn btn-outline-primary" type="submit">Search</button>
	    </form>
	
	    <%
	        doctor foundDoctor = (doctor) request.getAttribute("foundDoctor");
	        String message = (String) request.getAttribute("message");
	    %>
	
	    <% if (foundDoctor != null) { %>
	        <!-- Update Form -->
	        <form method="post" action="updateDoctorServelet" class="card p-4">
	            <h5 class="mb-3">Edit Doctor Details</h5>
	            <input type="hidden" name="originalEmail" value="<%= foundDoctor.getEmail() %>">
	
	            <div class="mb-3">
	                <label>Name</label>
	                <input type="text" name="name" class="form-control" value="<%= foundDoctor.getName() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Hospital</label>
	                <input type="text" name="hospital" class="form-control" value="<%= foundDoctor.getHospital() %>" required>
	            </div>
				<div class="mb-3">
	                <label>Speciality</label>
	                <input type="text" name="speciality" class="form-control" value="<%= foundDoctor.getSpeciality() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Experience</label>
	                <input type="text" name="experience" class="form-control" value="<%= foundDoctor.getExperience() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Contact</label>
	                <input type="text" name="contact" class="form-control" value="<%= foundDoctor.getContact() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Email</label>
	                <input type="email" name="email" class="form-control" value="<%= foundDoctor.getEmail() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Country</label>
	                <input type="text" name="country" class="form-control" value="<%= foundDoctor.getCountry() %>" required>
	            </div>
	            <div class="mb-3">
	                <label>Gender</label>
	                <input type="text" name="gender" class="form-control" value="<%= foundDoctor.getGender() %>" required>
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

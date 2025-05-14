
<%@ page import="java.util.List" %>
<%@ page import="model.doctor" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
    <title>Doctor List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="dashboard.jsp">Mecare</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarText">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="DashboardServlet">Dashboard</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="adminmanagement.jsp">Admin Users Management</a>
	        </li>
	        
			<li class="nav-item">
	          <a class="nav-link active" href="doctormanagement.jsp">Manage Doctors</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="bookingmanagement.jsp">View Bookings</a>
	        </li>
	      </ul>
			<div class="d-flex align-items-center justify-content-between">
			  
			
			  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    			<span class="navbar-text text-white me-3">
  				Welcome, <%= username %>
			  </span>
			              <a href="logout" class="btn btn-danger">Logout</a>

			  </div>
			</div>
	  </div>
	  </div>
	</nav>
	
	<div class="container mt-4">
	    <h2 class="text-center mb-4">
	    <img alt="img/persom.svg" src="img/phone-book.png" class="mx-auto mb-3 " alt="Doctor Image" style="width: 70px;  height: 70px; object-fit: cover;"><br>
	    
	    Doctor List</h2>
	
	    <%
	        List<doctor> doctorList = (List<doctor>) request.getAttribute("doctorList");
	        String error = (String) request.getAttribute("error");
	    %>
	
	    <% if (error != null) { %>
	        <div class="alert alert-danger"><%= error %></div>
	    <% } else if (doctorList != null && !doctorList.isEmpty()) { %>
	        <table class="table table-bordered table-hover">
	            <thead class="table-dark">
	                <tr>
	                    <th>Name</th>
	                    <th>Email</th>
	                    <th>Hospital</th>
	                    <th>Contact</th>
	                </tr>
	            </thead>
	            <tbody>
	                <% for (doctor dc : doctorList) { %>
	                    <tr>
	                        <td><%= dc.getName() %></td>
	                        <td><%= dc.getEmail() %></td>
	                        <td><%= dc.getHospital() %></td>
	                        <td><%= dc.getContact() %></td>
	                    </tr>
	                <% } %>
	            </tbody>
	        </table>
	    <% } else { %>
	        <div class="alert alert-info">No admin users found.</div>
	    <% } %>
	    <a href="viewDoctorServlet" class="btn btn-primary">Refreash</a>
	</div>

</body>
</html>

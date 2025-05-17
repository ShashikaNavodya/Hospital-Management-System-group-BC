<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession session1 = request.getSession(false); // don't create a new session
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    String username = (String) session.getAttribute("userEmail");
%>


<%
    System.out.println("Session: " + session);
    System.out.println("User Email: " + session.getAttribute("userEmail"));
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>

	<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="dashboard.jsp">Wecare</a>
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
<br><br>
	<h3 class="text-center">
	<img alt="img/doctor.png" src="img/doctor.png" class="rounded-circle mx-auto mb-3" alt="Doctor Image" style="width: 70px; height: 70px; object-fit: cover;"><br>
	  Doctor Management
	</h3>
	<br><br>
	<div class="container" style="max-width: 1500px;">
	  <div class="row">
		    <!-- Register New Doctor -->
		    <div class="col-sm-6 mb-3 mb-sm-4">
		      <div class="card shadow-sm">
		        <div class="card-body">
		          <h5 class="card-title">Register New Doctor</h5>
		          <p class="card-text">Create a new doctor profile with the required details to manage patient appointments and medical records.</p>
		          <a href="doctorreg.jsp" class="btn btn-primary">Register Doctor <i class="bi bi-person-plus-fill"></i></a>
		        </div>
		      </div>
		    </div>
		
		    <!-- Update Doctor Details -->
		    <div class="col-sm-6 mb-3 mb-sm-4">
		      <div class="card shadow-sm">
		        <div class="card-body">
		          <h5 class="card-title">Update Doctor Details</h5>
		          <p class="card-text">Modify the existing details of doctors including specialization, contact details, and working hours.</p>
		          <a href="doctorupdate.jsp" class="btn btn-warning">Update Details <i class="bi bi-person-fill-add"></i></a>
		        </div>
		      </div>
		    </div>
		
		    <!-- Delete Doctor -->
		    <div class="col-sm-6 mb-3 mb-sm-4">
		      <div class="card shadow-sm">
		        <div class="card-body">
		          <h5 class="card-title">Delete Doctor</h5>
		          <p class="card-text">Remove a doctor profile permanently from the system, including all associated data.</p>
		          <a href="doctordelete.jsp" class="btn btn-danger">Delete Doctor <i class="bi bi-trash"></i></a>
		        </div>
		      </div>
		    </div>
		
		    <!-- View All Doctors -->
		    <div class="col-sm-6 mb-3 mb-sm-4">
		      <div class="card shadow-sm">
		        <div class="card-body">
		          <h5 class="card-title">View All Doctors</h5>
		          <p class="card-text">Browse a complete list of registered doctors, including their specialties, availability, and status.</p>
		          <a href="viewAvalabilityServelet" class="btn btn-dark">View Doctors <i class="bi bi-view-list"></i></a>
		        </div>
		      </div>
		    </div>
		    
		<!-- Doctor availability manage -->
		<div class="d-flex justify-content-center align-items-center">
		  <div class="col-sm-6 mb-3 mb-sm-4">
		    <div class="card shadow-sm">
		      <div class="card-body text-center">
		        <h5 class="card-title">Manage Doctor Availability</h5>
		        <p class="card-text">Browse a complete list of registered doctors availability, and manage.</p>
		        <a href="addavalability.jsp" class="btn btn-success">Add Availability <i class="bi bi-person-workspace"></i></a>
		        <a href="updateavalability.jsp" class="btn btn-warning">Update Availability <i class="bi bi-calendar-month"></i></a>       
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	</div>
	

</body>
</html>
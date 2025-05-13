<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    String username = (String) session1.getAttribute("userEmail");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-card {
            transition: transform 0.2s;
        }
        .dashboard-card:hover {
            transform: scale(1.03);
        }
    </style>
</head>
<body>

	<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="DashboardServlet">Wecare</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarText">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="DashboardServlet">Dashboard</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="adminmanagement.jsp">Admin Users Management</a>
		        </li>
		        
				<li class="nav-item">
		          <a class="nav-link" href="doctormanagement.jsp">Manage Doctors</a>
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

<!-- Dashboard Section -->
<div class="container py-5">
   <h2 class="text-center mb-4 ">
  Your Control Panel
</h2>


    
    <div class="row g-4">
        <div class="col-md-3">
            <a href="adminmanagement.jsp" class="text-decoration-none">
                <div class="card shadow-sm text-center dashboard-card">
                    <div class="card-body">
                        <i class="bi bi-people-fill display-5 text-primary"></i>
                        <h5 class="mt-3">Admin Users</h5>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="doctormanagement.jsp" class="text-decoration-none">
                <div class="card shadow-sm text-center dashboard-card">
                    <div class="card-body">
                        <i class="bi bi-person-badge-fill display-5 text-success"></i>
                        <h5 class="mt-3">Manage Doctors</h5>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="bookingViewServelet" class="text-decoration-none">
                <div class="card shadow-sm text-center dashboard-card">
                    <div class="card-body">
                        <i class="bi bi-calendar-check-fill display-5 text-warning"></i>
                        <h5 class="mt-3">View Bookings</h5>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-md-3">
            <a href="adminLogout" class="text-decoration-none">
                <div class="card shadow-sm text-center dashboard-card">
                    <div class="card-body">
                        <i class="bi bi-box-arrow-right display-5 text-danger"></i>
                        <h5 class="mt-3">Logout</h5>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>



<div class="container my-5">
  <div class="row g-4 mb-5">
      <div class="col-md-4">
          <div class="card text-bg-primary shadow-sm text-center p-4">
              <div class="card-body">
                  <i class="bi bi-calendar2-check display-5 mb-2"></i>
                  <h5>Total Bookings</h5>
                  <h3><%= request.getAttribute("bookingCount") != null ? request.getAttribute("bookingCount") : "N/A" %></h3>
              </div>
          </div>
      </div>

      <div class="col-md-4">
          <div class="card text-bg-success shadow-sm text-center p-4">
              <div class="card-body">
                  <i class="bi bi-person-badge display-5 mb-2"></i>
                  <h5>Total Doctors</h5>
                  <h3><%= request.getAttribute("doctorCount") != null ? request.getAttribute("doctorCount") : "N/A" %></h3>
              </div>
          </div>
      </div>

      <div class="col-md-4">
          <div class="card text-bg-warning shadow-sm text-center p-4">
              <div class="card-body">
                  <i class="bi bi-people display-5 mb-2"></i>
                  <h5>Total Patients</h5>
                  <h3><%= request.getAttribute("patientCount") != null ? request.getAttribute("patientCount") : "N/A" %></h3>
              </div>
          </div>
      </div>
      
  </div>
</div>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

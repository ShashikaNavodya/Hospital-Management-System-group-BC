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
<title>Add Admin User</title>
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
			    <a href="adminLogout" class="btn btn-danger">Logout</a>
			  </div>
			</div>
	  	</div>
	  </div>
	</nav>	
<br><br>
<h3 class="text-center">
<img alt="img/persom.svg" src="img/registration-form.png" class="rounded-circle mx-auto mb-3 " alt="Doctor Image" style="width: 70px;  height: 70px; object-fit: cover;"><br>
  Doctor Availability  
</h3>

<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
    
      <form class="row g-3 bg-light p-4 rounded shadow" action="addAvalability" method="post">
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Doctor ID</label>
          <input type="number" class="form-control" id="name" name="id">
        </div>
        
        <div class="col-md-6">
          <label for="inputState" class="form-label">Select Weekday</label>
          <select name="weekday" id="weekday" class="form-control">
			  <option value="Monday">Monday</option>
			  <option value="Tuesday">Tuesday</option>
			  <option value="Wednesday">Wednesday</option>
			  <option value="Thursday">Thursday</option>
			  <option value="Friday">Friday</option>
			  <option value="Saturday">Saturday</option>
			  <option value="Sunday">Sunday</option>
			</select>
        </div>
        
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Start Time</label>
		  <input type="time" id="start_time" name="start_time" class="form-control" required>        
		 </div>
        
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">End Time</label>
          <input type="time" id="end_time" name="end_time" class="form-control" required>
        </div>
        
        <div class="col-md-14">
          <label for="inputState" class="form-label">Select Location</label>
          <select name="location" id="location" class="form-control">
			  <option value="Colombo">Colombo - WeCare Hospital</option>
			  <option value="Malabe">Malabe - WeCare Hospital</option>
			  <option value="Negambo">Negambo - WeCare Hospital</option>
			  <option value="Jaffna">Jaffna - WeCare Hospital</option>
			  <option value="Kiribathgoda">Kiribathgoda - WeCare Hospital</option>
			</select>
        </div>       
	        <div class="col-12 text-center">
			  <button type="submit" class="btn btn-primary btn-lg">Submit <i class="bi bi-database-add"></i></button>		  
			</div>
      </form>      
    </div>
  </div>
</div>

</body>
</html>
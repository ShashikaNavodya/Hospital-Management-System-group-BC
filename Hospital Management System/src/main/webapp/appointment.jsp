<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession session1 = request.getSession(false); // don't create a new session
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
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
<title>Appointment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
<style>
  html, body {
    height: 100%;
  }

  body {
    display: flex;
    flex-direction: column;
  }

  main {
    flex: 1;
  }
</style>

</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
	
		<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp">Wecare</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarText">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="appointment.jsp">Appointment</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="services.jsp">Servicer</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="about.jsp">About</a>
		        </li>
		      </ul>
				<div class="d-flex align-items-center justify-content-between">
				  <span class="navbar-text me-4">
				    <a href="tel:+94772801487" class="text-decoration-none">
				      <i class="bi bi-telephone"></i> +9411-2691111
				    </a>
				  </span>
				  
				<span class="navbar-text text-white me-3">
	  				Welcome, <%= username %>
				  </span>
				  <a href="logout" class="btn btn-danger">Logout</a>
				</div>
		  </div>
		  </div>
		</nav>	
	<br><br>
	<main>
	<h3 class="text-center">
	  Book Now <i class="bi bi-book-half"></i>
	</h3>
	<div class="d-flex justify-content-center align-items-center min-vh-50">
	  <div class="container my-5">
	  
	    <div class="row justify-content-center">
	      <div class="col-md-6 col-lg-4">
	      	<div class="alert alert-success" role="alert">
	  			Book an Appointment and Save upto Rs.400/=
			</div><br>
	        <form action="SearchDoctorServlet" method="post"  class="row g-3 bg-light p-4 rounded shadow" >
	
	          <div class="col-12">
	            <input type="text" class="form-control form-control-sm" id="inputEmail4" name="name" placeholder="Doctor - Max 20 Characters">
	          </div>
	
	          <div class="col-12">
	            <select id="inputState" class="form-select form-select-sm" name="specialization">
	              <option selected disabled>Any Specialization</option>
	              <option value="Surgeon">Surgeon</option>
	              <option value="Psychiatrist">Psychiatrist</option>
	              <option value="Dentist">Dentist</option>
	              <option value="Neurologist">Neurologist</option>
	              <option value="Cardiologist">Cardiologist</option>
	              <option value="Orthopedic">Orthopedic</option>
	            </select>
	          </div>
	 		 <div class="col-12">
	            <select id="inputState" class="form-select form-select-sm" name="hospital">
	              <option selected disabled>Any Hospital</option>
	              
	 			    <option value="colombo">wecare-colombo</option>
					<option value="gampaha">wecare-gampaha</option>
					<option value="kandy">wecare-kandy</option>
					<option value="kurunegala">wecare-kurunegala</option>
					<option value="galle">wecare-galle</option>
					<option value="matara">wecare-matara</option>
					<option value="anuradhapura">wecare-anuradhapura</option>
					<option value="ratnapura">wecare-ratnapura</option>
					<option value="batticaloa">wecare-batticaloa</option> 			  
	            </select>
	          </div>
	          
          
	          <div class="col-12 text-center">
	            <button type="submit" class="btn btn-success btn-lg">Search <i class="bi bi-search"></i> </button>
	          </div>
	
				
	        </form><br>
	        <div class="alert alert-success" role="alert">
				  View already Booked <a href="viewProfileBookedServelet" class="alert-link">View</a>. Give it a click if you like.
				</div>
	      </div>
	    </div>
	    
	  </div>
	</div>
	</main>
	
	  <footer class="bg-dark text-white text-center py-3">
	    <div class="container">
	      <p class="mb-1">© 2025 Wecare Hospital. All rights reserved.</p>
	      <p class="mb-0">
	        <a href="tel:+94772801487" class="text-white text-decoration-none me-3">Call: +94 77 280 1487</a>
	        <a href="mailto:info@mecare.lk" class="text-white text-decoration-none">Email: info@wecare.lk</a>
	      </p>
	    </div>
	  </footer>

</body>
</html>
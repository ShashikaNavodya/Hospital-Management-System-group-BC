<%
    // Check if the user is logged in
    HttpSession session1 = request.getSession(false);
    String userEmail = null;
    if (session1 != null) {
        userEmail = (String) session1.getAttribute("userEmail");
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
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
			          <a class="nav-link" href="appointment.jsp">Appointment</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="services.jsp">Servicer</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="about.jsp">About</a>
			        </li>
			      </ul>
				<div class="d-flex align-items-center justify-content-between">
					  <span class="navbar-text me-4">
					    <a href="tel:+94772801487" class="text-decoration-none">
					      <i class="bi bi-telephone"></i> +9411-2691111
					    </a>
					  </span>	
					  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		    				  <%
					            if (userEmail != null) {
					          %>
					              <!-- User is logged in -->
					              <span class="navbar-text text-white">Welcome, <%= userEmail %></span>
					              <a href="logout" class="btn btn-danger">Logout</a>
					          <% 
					            } else {
					          %>
					              <!-- User is not logged in -->
					              <a href="register.jsp" class="btn btn-secondary" role="button">Register as new User</a>
					              <a href="login.jsp" class="btn btn-success" role="button">Login</a>
					          <% 
					            }
					          %>
					  </div>
				</div>
		  </div>
		  </div>
	</nav>	
	
		<main>
		<!-- Hero Banner -->
		<div class="bg-primary text-white text-center py-5">
		  <h1 class="display-4">About Wecare Hospital</h1>
		  <p class="lead">Caring for You Since 1945</p>
		</div>
		
		<!-- About Content -->
		<div class="container my-5">
		  <div class="row align-items-center mb-5">
		    <div class="col-md-6">
		      <img src="img/Hospital.jpg" class="img-fluid rounded shadow" alt="Hospital Image">
		    </div>
		    <div class="col-md-6">
		      <h2 class="mb-3">Who We Are</h2>
		      <p class="text-muted">
		        Wecare Hospital is a trusted name in healthcare, known for delivering advanced medical care with compassion. With decades of experience, we focus on innovation, quality treatment, and community wellness.
		      </p>
		    </div>
		  </div>
		
		  <!-- Vision & Mission Cards -->
		  <div class="row text-center mb-5">
		    <div class="col-md-6 mb-4">
		      <div class="card h-100 border-0 shadow-sm">
		        <div class="card-body">
		          <div class="mb-3">
		            <i class="bi bi-eye-fill text-primary fs-1"></i>
		          </div>
		          <h5 class="card-title">Our Vision</h5>
		          <p class="card-text">To be Sri Lanka's most patient-centric hospital by consistently delivering top-quality care with cutting-edge technologies.</p>
		        </div>
		      </div>
		    </div>
		    
		    <div class="col-md-6 mb-4">
		      <div class="card h-100 border-0 shadow-sm">
		        <div class="card-body">
		          <div class="mb-3">
		            <i class="bi bi-heart-pulse-fill text-danger fs-1"></i>
		          </div>
		          <h5 class="card-title">Our Mission</h5>
		          <p class="card-text">To enhance lives through excellence in healthcare, education, and compassionate service to every patient who walks through our doors.</p>
		        </div>
		      </div>
		    </div>
		  </div>
		
		  <!-- Why Choose Us -->
		  <div class="text-center mb-5">
		    <h3 class="mb-3">Why Choose Wecare?</h3>
		    <p class="text-muted mb-4">We're not just a hospital – we’re your health partners.</p>
		    <div class="row">
		      <div class="col-md-3 col-6 mb-3">
		        <i class="bi bi-person-check fs-1 text-success"></i>
		        <p>Experienced Staff</p>
		      </div>
		      <div class="col-md-3 col-6 mb-3">
		        <i class="bi bi-hospital fs-1 text-primary"></i>
		        <p>Modern Facilities</p>
		      </div>
		      <div class="col-md-3 col-6 mb-3">
		        <i class="bi bi-clock-history fs-1 text-warning"></i>
		        <p>24/7 Emergency</p>
		      </div>
		      <div class="col-md-3 col-6 mb-3">
		        <i class="bi bi-shield-check fs-1 text-danger"></i>
		        <p>Trusted Care</p>
		      </div>
		    </div>
		  </div>
		</div>
			
		</main>
		  <footer class="bg-dark text-white text-center py-3">
		    <div class="container">
		      <p class="mb-1">© 2025 Wecare Hospital. All rights reserved.</p>
		      <p class="mb-0">
		        <a href="tel:+94772801487" class="text-white text-decoration-none me-3">Call: +9411-2691111</a>
		        <a href="mailto:info@mecare.lk" class="text-white text-decoration-none">Email: info@wecare.lk</a>
		      </p>
		    </div>
		  </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>Services</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
<%
    // Check if the user is logged in
    HttpSession session1 = request.getSession(false);
    String userEmail = null;
    if (session1 != null) {
        userEmail = (String) session1.getAttribute("userEmail");
    }
%>

	
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
		          <a class="nav-link active" href="services.jsp">Servicer</a>
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
	<!-- Header Section -->
	<div class="bg-primary text-white text-center py-5">
	  <h1 class="display-4">Our Services</h1>
	  <p class="lead">Delivering Excellence in Every Department</p>
	</div>
	
	<!-- Services Grid -->
	<div class="container my-5">
	  <div class="row g-4">
	
	    <!-- Card 1 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-heart-pulse-fill fs-1 text-danger mb-3"></i>
	          <h5 class="card-title">Cardiology</h5>
	          <p class="card-text text-muted">Advanced cardiac care and diagnostics from experienced cardiologists.</p>
	        </div>
	      </div>
	    </div>
	
	    <!-- Card 2 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-eyedropper fs-1 text-primary mb-3"></i>
	          <h5 class="card-title">Laboratory Services</h5>
	          <p class="card-text text-muted">Accurate testing and timely reports with state-of-the-art equipment.</p>
	        </div>
	      </div>
	    </div>
	
	    <!-- Card 3 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-person-bounding-box fs-1 text-success mb-3"></i>
	          <h5 class="card-title">General Medicine</h5>
	          <p class="card-text text-muted">Comprehensive care for adults with various health conditions.</p>
	        </div>
	      </div>
	    </div>
	
	    <!-- Card 4 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-brightness-high fs-1 text-warning mb-3"></i>
	          <h5 class="card-title">Radiology</h5>
	          <p class="card-text text-muted">CT, MRI, X-rays, and ultrasound by certified radiologists.</p>
	        </div>
	      </div>
	    </div>
	
	    <!-- Card 5 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-bandaid-fill fs-1 text-info mb-3"></i>
	          <h5 class="card-title">Surgery</h5>
	          <p class="card-text text-muted">Safe and modern surgical solutions from expert surgeons.</p>
	        </div>
	      </div>
	    </div>
	
	    <!-- Card 6 -->
	    <div class="col-md-4">
	      <div class="card h-100 text-center border-0 shadow">
	        <div class="card-body">
	          <i class="bi bi-people-fill fs-1 text-secondary mb-3"></i>
	          <h5 class="card-title">Pediatrics</h5>
	          <p class="card-text text-muted">Dedicated healthcare for infants, children, and teens.</p>
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
	        <a href="tel:+94772801487" class="text-white text-decoration-none me-3">Call: +9411-2691111</a>
	        <a href="mailto:info@mecare.lk" class="text-white text-decoration-none">Email: info@wecare.lk</a>
	      </p>
	    </div>
	  </footer>

</body>
</html>
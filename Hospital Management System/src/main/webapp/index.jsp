<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">

<style>
  #carouselExampleAutoplaying .carousel-item img {
    height: 560px; 
    object-fit: cover;
  }
</style>
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
		          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="appointment.jsp">Appointment</a>
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
			              <a href="register.jsp" class="btn btn-secondary me-md-2" role="button">Register</a>
			              <a href="login.jsp" class="btn btn-success" role="button">Login</a>
			          <% 
			            }
			          %>
			  </div>
			</div>
	  </div>
	  </div>
	</nav>	
	
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="img/banner15.png" class="d-block w-100" alt="First slide">
	    </div>
	    <div class="carousel-item">
	      <img src="img/banner8.png" class="d-block w-100" alt="Second slide">
	    </div>
	    <div class="carousel-item">
	      <img src="img/banner14.png" class="d-block w-100" alt="Third slide">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<br><br>
	
	<div class="container " >
	  <div class="row">
	    <div class="col text-center">
	    <h3 class="card-subtitle mb-2 text-body-secondary">Welcome to Wecare Hospital.</h3>
	    <h6 class="card-subtitle mb-2 text-body-secondary">Trust in us for all your healthcare needs.</h6>
	    <p class="card-text">Experience the best in helthcare ad Wecare Hospial's new Alfred Place Wing.</p>
	    <a href="appointment.jsp" class="btn btn-primary btn-lg" role="button"><i class="bi bi-book"></i> Book and Appointment</a><br><br>
	      
	      <p class="card-text">Since our foundation in 1945, we have built a reputation for regional leadership in medical excellence and innovation, based on a simple philosophy: that improving the health of our community should be driven by passion as well as compassion. 
	      We offer a range of spacious modern rooms and are equipped with state of critical care units. 
	     </p>
	    </div>
	  </div>
	</div>
	
	
	<!-- Footer -->
	<footer class="bg-body-tertiary text-center">
	
	  <!-- Copyright -->
	  <div class="text-center p-3">
	    © 2025 Copyright:
	    <a class="text-reset fw-bold" href="index.jsp">WeCare</a>
	  </div>
	  <!-- Copyright -->
	</footer>
	<!-- Footer -->
</body>
</html>
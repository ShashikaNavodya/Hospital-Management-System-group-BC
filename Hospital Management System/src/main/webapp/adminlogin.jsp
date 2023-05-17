
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>

	<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.jsp">Wecare  - </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
		    <div class="collapse navbar-collapse" id="navbarText">
				<div class="d-flex align-items-center justify-content-between">
				  <span class="navbar-text me-4">
				    <a href="tel:+94772801487" class="text-decoration-none">
				       Admin Pannel Login
				    </a>
				  </span>
				</div>
		  </div>
	  </div>
	</nav>	
		<%
		    String error = (String) request.getAttribute("error");
		    if (error != null) {
		%>
		    <div class="alert alert-danger"><%= error %></div>
		<%
		    }
		%>
	<br><br>

	<br><br>
	<h3 class="text-center">Admin Login</h3>
	<div class="d-flex justify-content-center align-items-center min-vh-50">
	  <div class="container my-5">
	    <div class="row justify-content-center">
	      <div class="col-md-6 col-lg-4">
	        <form class="row g-3 bg-light p-4 rounded shadow" action="adminLogin" method="post">
	          
	          <div class="col-12">
	            <label for="inputEmail4" class="form-label">Email</label>
	            <input type="email" class="form-control form-control-sm" id="inputEmail4" name="email">
	          </div>
	
	          <div class="col-12">
	            <label for="inputPassword4" class="form-label">Password</label>
	            <input type="password" class="form-control form-control-sm" id="inputPassword4" name="password">
	          </div>
	          
	          <div class="col-12 text-center">
	            <button type="submit" class="btn btn-primary btn-lg">Login</button>
	          </div>
	
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>
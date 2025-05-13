<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="model.doctor" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
    HttpSession session1 = request.getSession(false); 
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session1.getAttribute("userEmail");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Channel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
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
	                    <a class="nav-link" href="services.jsp">Servicer</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="about.jsp">About</a>
	                </li>
	            </ul>
	            <div class="d-flex align-items-center justify-content-between">
	                <span class="navbar-text me-4">
	                    <a href="tel:+94772801487" class="text-decoration-none">
	                        <i class="bi bi-telephone"></i> +94772801487
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
	<div class="container my-5">
	    <div class="row justify-content-center">
	        <div class="col-md-6">
	            <div class="card shadow p-4 text-center">
	                <h5 class="mb-1">Confirm Appointment</h5>
	
	                <form action="BookingController" method="POST">
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Full Name</label>
	                        <input type="text" name="patient_name" class="form-control" placeholder="Enter Yor Name" required>
	                    </div>
	
	                    <div class="mb-3 text-start">
	                        <label class="form-label">NIC</label>
	                        <input type="text" name="nic" class="form-control" placeholder="Enter Your NIC" required>
	                    </div>
	                    
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Email</label>
	                        <input type="email" name="email" class="form-control" placeholder="Enter Registered Email"required>
	                    </div>
	                    
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Address</label>
	                        <input type="text" name="address" class="form-control" placeholder="Enter Your Address" required>
	                    </div>
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Phone Number</label>
	                        <input type="number" name="contact" class="form-control" placeholder="07772349902" required>
	                    </div>
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Payment Method</label>
	                        <select name="pay" class="form-select" required>
	                            <option value="Card">Card</option>
	                            <option value="Cash">Cash</option>
	                        </select>
	                    </div>
	                    <div class="mb-3 text-start">
	                        <label class="form-label">Selected Doctor Avalabale Only ever <b><%= request.getParameter("day") %> at that time.</b></label>
	                        <input type="date" name="appointment_date" class="form-control" required>
	                    </div>
	
						<input type="hidden" name="availability_id" value="<%= request.getParameter("availability_id") %>">
						<input type="hidden" name="doctor_id" value="<%= request.getParameter("doctor_id") %>">
						<input type="hidden" name="patient_id" value="<%= request.getParameter("patient_id") %>">
						                    
						                    
	                    <button type="submit" class="btn btn-success">Confirm Booking</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>
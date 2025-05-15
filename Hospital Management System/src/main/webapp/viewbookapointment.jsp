<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
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
    <title>Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico">
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
	
	<div class="container mt-4">
	    <h2 class="text-center mb-4">
	    <img alt="img/persom.svg" src="img/phone-book.png" class="mx-auto mb-3 " alt="Doctor Image" style="width: 70px;  height: 70px; object-fit: cover;"><br>
	    
	    Your Profile Booked List</h2>

	    <%
	        List<Booking> doctorList = (List<Booking>) request.getAttribute("doctorList");
	        String error = (String) request.getAttribute("error");
	    %>
	
	    <% if (error != null) { %>
	        <div class="alert alert-danger"><%= error %></div>
	    <% } else if (doctorList != null && !doctorList.isEmpty()) { %>
	        <table class="table table-bordered table-hover">
	            <thead class="table-dark">
	                <tr class="text-center">
	                    <th>Name</th>
	                    <th>Doctor</th>
	                    <th>Hospital</th>
	                    <th>Appointment Dates</th>
	                    <th>Start Time</th>
	                    <th>End Time</th>
	                    <th>Status</th>
	                </tr>
	            </thead>
	            <tbody>
	            
	            
	                <% for (Booking dc : doctorList) { %>
	                    <tr class="text-center">
	                        <td><%= dc.getPatientName() %></td>
	                        <td><%= dc.getDoctorName() %></td>
	                        <td><%= dc.getLocation() %></td>
	                        <td><%= dc.getAppointmentDate() %></td>
	                        <td>
							    <%
							        String startTime = dc.getStartTime();
							        if (startTime != null && !startTime.isEmpty()) {
							            try {
							                java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("HH:mm");
							                java.text.SimpleDateFormat outputFormat = new java.text.SimpleDateFormat("hh:mm a");
							                java.util.Date parsedTime = inputFormat.parse(startTime);
							                out.print(outputFormat.format(parsedTime));
							            } catch (Exception e) {
							                out.print(startTime); 
							            }
							        } else {
							            out.print("N/A");
							        }
							    %>
							</td>
							<td>
							    <%
							        String endTime = dc.getEndTime();
							        if (endTime != null && !endTime.isEmpty()) {
							            try {
							                java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("HH:mm");
							                java.text.SimpleDateFormat outputFormat = new java.text.SimpleDateFormat("hh:mm a");
							                java.util.Date parsedTime = inputFormat.parse(endTime);
							                out.print(outputFormat.format(parsedTime)); // Format end time
							            } catch (Exception e) {
							                out.print(endTime); 
							            }
							        } else {
							            out.print("N/A");
							        }
							    %>
							</td>

	                        <td class="text-center">
							    <%
							        String status = dc.getStatus();
							        if ("confirmed".equalsIgnoreCase(status)) {
							            out.print("<span class='text-success'>" + status + "</span>"); // Green for confirmed
							        } else {
							            out.print("<span class='text-danger'>" + status + "</span>"); // Red for any other status
							        }
							    %>
							</td>

	                    </tr>
	                <% } %>
	            </tbody>
	        </table>
	    <% } else { %>
	        <div class="alert alert-info">No appointmet to display.</div>
	    <% } %>
	    <a href="viewProfileBookedServelet" class="btn btn-primary">Refreash</a>
	</div>

</body>
</html>

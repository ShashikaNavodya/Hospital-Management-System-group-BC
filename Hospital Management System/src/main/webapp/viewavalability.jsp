<%@ page import="java.util.List" %>
<%@ page import="model.avalability" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>Session List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<nav class="navbar navbar-expand-lg  bg-primary" data-bs-theme="dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="dashboard.jsp">Wecare</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarText">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="dashboard.jsp">Dashboard</a>
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
	
	<div class="container mt-4">
	    <h2 class="text-center mb-4">
	        <img src="img/phone-book.png" class="mx-auto mb-3" alt="Doctor Image" style="width: 70px; height: 70px; object-fit: cover;"><br>
	        Session List
	    </h2>
	
	    <%
	        List<avalability> doctorList = (List<avalability>) request.getAttribute("doctorList");
	        String error = (String) request.getAttribute("error");
	    %>
	
	    <% if (error != null) { %>
	        <div class="alert alert-danger"><%= error %></div>
	    <% } else if (doctorList != null && !doctorList.isEmpty()) { %>
	        <table class="table table-bordered table-hover">
	            <thead class="table-dark">
	                <tr>
	                    <th>Doctor</th>
	                    <th>Location</th>
	                    <th>Day Of Week</th>
	                    <th>Start Time</th>
	                    <th>End Time</th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	                SimpleDateFormat sdf24 = new SimpleDateFormat("HH:mm");
	                SimpleDateFormat sdf12 = new SimpleDateFormat("hh:mm a");
	
	                for (avalability dc : doctorList) {
	                    String startTime24 = dc.getStart_time();
	                    String endTime24 = dc.getEnd_time();
	
	                    String startTime12 = startTime24;
	                    String endTime12 = endTime24;
	
	                    try {
	                        startTime12 = sdf12.format(sdf24.parse(startTime24));
	                        endTime12 = sdf12.format(sdf24.parse(endTime24));
	                    } catch (Exception e) {
	                        e.printStackTrace(); 
	                    }
	            %>
	                <tr>
	                    <td>DR. <%= dc.getDoctorName() %></td>
	                    <td><%= dc.getLocation() %></td>
	                    <td><%= dc.getWeekday() %></td>
	                    <td><%= startTime12 %></td>
	                    <td><%= endTime12 %></td>
	                </tr>
	            <%
	                }
	            %>
	            </tbody>
	        </table>
	    <% } else { %>
	        <div class="alert alert-info">No session data found.</div>
	    <% } %>
	    <a href="viewAvalabilityServelet" class="btn btn-primary">Refresh</a>
	</div>

</body>
</html>

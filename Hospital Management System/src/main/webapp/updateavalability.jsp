<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.util.List" %>
<%@ page import="model.avalability" %>

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
    <meta charset="UTF-8">
    <title>Update Doctor Availability</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
	    <div class="container-fluid">
	        <a class="navbar-brand" href="dashboard.jsp">Wecare</a>
	        <div class="collapse navbar-collapse" id="navbarText">
	            <ul class="navbar-nav me-auto">
	            	<li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
	                <li class="nav-item"><a class="nav-link" href="adminmanagement.jsp">Admin Users Management</a></li>
	                <li class="nav-item"><a class="nav-link active" href="doctormanagement.jsp">Manage Doctors</a></li>
	                <li class="nav-item"><a class="nav-link" href="bookingmanagement.jsp">View Bookings</a></li>
	            </ul>
	            <span class="navbar-text text-white me-3">Welcome, <%= username %></span>
	            <a href="logout" class="btn btn-danger">Logout</a>
	        </div>
	    </div>
	</nav>
	
	<div class="container mt-4">
	    <h3 class="text-center">
	        <img src="img/edit-info.png" class="rounded-circle mx-auto mb-3" alt="Edit Doctor" style="width: 70px; height: 70px; object-fit: cover;"><br>
	        Update Doctor Availability
	    </h3>
	
	    <!-- Display success or error message -->
	    <%
	        String message = (String) request.getAttribute("message");
	        if (message != null) {
	    %>
	        <div class="alert alert-info">
	            <%= message %>
	        </div>
	    <% 
	        }
	    %>
	
	    <!-- Search Form -->
	    <form method="get" action="updateDoctorAvalabilityServerlet" class="d-flex mb-3 justify-content-center">
	        <input class="form-control me-2 w-50" name="searcID" type="search" placeholder="Type Doctor ID to search">
	        <button class="btn btn-outline-primary" type="submit">Search</button>
	    </form>
	
	    <%
	        List<avalability> doctorAvailabilityList = (List<avalability>) request.getAttribute("doctorAvailabilityList");
	        if (doctorAvailabilityList != null && !doctorAvailabilityList.isEmpty()) {
	    %>
	        <!-- Table to Display Doctor Availability Records -->
	        <table class="table table-striped">
	            <thead>
	                <tr>
	                
	                    <th>Day</th>
	                    <th>Start Time</th>
	                    <th>End Time</th>
	                    <th>Location</th>
	                    <th>Action</th>
	                </tr>
	            </thead>
	            <tbody>
	                <% for (avalability avl : doctorAvailabilityList) { %>
	                    <tr>
	                    
	                        <td><%= avl.getWeekday() %></td>
	                        <td><%= avl.getStart_time() %></td>
	                        <td><%= avl.getEnd_time() %></td>
	                        <td><%= avl.getLocation() %></td>
	                        <td>
								<button class="btn btn-warning btn-sm edit-btn"
						        data-id="<%= avl.getId() %>"
						        data-weekday="<%= avl.getWeekday() %>"
						        data-start-time="<%= avl.getStart_time() %>"
						        data-end-time="<%= avl.getEnd_time() %>">Edit
						        </button>
	                        </td>
	                    </tr>
	                <% } %>
	            </tbody>
	        </table>
	    <% 
	        } else {
	            out.println("<p>No availability records found for this doctor.</p>");
	        }
	    %>
	
	    <!-- Inline Edit Form -->
	    <div id="editForm" class="card p-4 mt-4" style="display:none;">
	        <h5 class="mb-3">Edit Doctor Availability</h5>
	        <form id="updateForm" method="post" action="updateDoctorAvalabilityServerlet">
	            <!-- Hidden input for doctor ID -->
				<input type="hidden" id="availabilityID" name="availabilityID">
	
	            <!-- Select Weekday -->
	            <div class="col-md-6">
	                <label for="weekday" class="form-label">Select Weekday</label>
	                <select id="weekday" name="weekday" class="form-control">
	                    <option value="Monday">Monday</option>
	                    <option value="Tuesday">Tuesday</option>
	                    <option value="Wednesday">Wednesday</option>
	                    <option value="Thursday">Thursday</option>
	                    <option value="Friday">Friday</option>
	                    <option value="Saturday">Saturday</option>
	                    <option value="Sunday">Sunday</option>
	                </select>
	            </div>
	
	            <!-- Start Time -->
	            <div class="col-md-6">
	                <label for="start_time" class="form-label">Start Time</label>
	                <input type="time" id="start_time" name="start_time" class="form-control" required>
	            </div>
	
	            <!-- End Time -->
	            <div class="col-md-6">
	                <label for="end_time" class="form-label">End Time</label>
	                <input type="time" id="end_time" name="end_time" class="form-control" required>
	            </div>
	
	            <button type="submit" class="btn btn-success mt-3">Save Changes</button>
	            <button type="button" class="btn btn-secondary mt-3" onclick="cancelEdit()">Cancel</button>
	        </form>
	    </div>
	</div>
	
	<script>
	    // Handle the Edit button click event
	    document.querySelectorAll('.edit-btn').forEach(function(button) {
	        button.addEventListener('click', function() {
	            // Get data from the clicked button
	            const doctorID = this.getAttribute('data-id');
	            const weekday = this.getAttribute('data-weekday');
	            const startTime = this.getAttribute('data-start-time');
	            const endTime = this.getAttribute('data-end-time');
	            
	            // Populate the edit form with the data
				const availabilityID = this.getAttribute('data-id');
				document.getElementById('availabilityID').value = availabilityID;
	            document.getElementById('weekday').value = weekday;
	            document.getElementById('start_time').value = startTime;
	            document.getElementById('end_time').value = endTime;
	
	            // Show the edit form
	            document.getElementById('editForm').style.display = 'block';
	        });
	    });
	
	    // Handle the cancel edit action
	    function cancelEdit() {
	        document.getElementById('editForm').style.display = 'none';
	    }
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

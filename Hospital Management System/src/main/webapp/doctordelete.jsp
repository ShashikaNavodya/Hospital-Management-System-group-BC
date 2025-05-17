<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("userEmail") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    String username = (String) session1.getAttribute("userEmail");
%>
<%@ page import="model.doctor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Delete</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="DashboardServlet">Wecare</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
	                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	                <li class="nav-item">
	                        <a class="nav-link" href="DashboardServlet">Dashboard</a>
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
                    <span class="navbar-text text-white me-3">Welcome, <%= username %></span>
                    <a href="adminLogout" class="btn btn-danger">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h3 class="text-center">
            <img alt="img/persom.svg" src="img/delete-user.png" class="rounded-circle mx-auto mb-3 " alt="Doctor Image" style="width: 70px;  height: 70px; object-fit: cover;"><br>
        
        Doctor Deletion</h3>

        <!-- Search form -->
        <div class="d-flex justify-content-center">
            <form method="get" action="deleteDoctorServslet" class="d-flex mb-3" style="max-width: 600px; width: 100%;">
                <input class="form-control form-control-sm me-2" name="searchEmail" type="search" placeholder="Search by email" aria-label="Search">
                <button class="btn btn-outline-success btn-sm" type="submit">Search</button>
            </form>
        </div>

        <% 
            doctor foundDoctor = (doctor) request.getAttribute("foundDoctor");
            String message = (String) request.getAttribute("message");
        %>

        <!-- Display user details if found -->
        <% if (foundDoctor != null) { %>
            <div class="card p-3 mt-3">
                <h5>Doctor Found</h5>
                <p><strong>Name:</strong> <%= foundDoctor.getName() %></p>
                <p><strong>Email:</strong> <%= foundDoctor.getEmail() %></p>
                <p><strong>Hospital</strong> <%= foundDoctor.getHospital() %></p>
                <p><strong>Speciality</strong> <%= foundDoctor.getSpeciality() %></p>

                <form method="post" action="deleteDoctorServslet">
                    <input type="hidden" name="emailToDelete" value="<%= foundDoctor.getEmail() %>">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        <% } else if (message != null) { %>
            <div class="alert alert-info mt-3"><%= message %></div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0vnPsl/2uF+2rjv7zD/1HshHyOe9f5P5NsYZZrYw6TflZURz" crossorigin="anonymous"></script>
</body>
</html>

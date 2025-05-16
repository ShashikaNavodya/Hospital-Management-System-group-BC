package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogout
 */
@WebServlet("/adminLogout")
public class adminLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession(false); // Do not create new session
	        if (session != null) {
	            session.invalidate(); // Destroys session
	        }

	        response.sendRedirect("adminlogin.jsp"); // Redirect to login page
	    }
}

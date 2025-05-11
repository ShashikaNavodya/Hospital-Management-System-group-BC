package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.adminService;
import model.admin;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        admin ad = new admin();
        ad.setEmail(email);
        ad.setPassword(password);

        adminService service = new adminService();
        boolean status = service.validate(ad);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", ad.getEmail());

            response.sendRedirect("dashboard.jsp"); // Better than forward for login success
        } else {
            request.setAttribute("error", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
            dispatcher.forward(request, response);
        }
	}

}

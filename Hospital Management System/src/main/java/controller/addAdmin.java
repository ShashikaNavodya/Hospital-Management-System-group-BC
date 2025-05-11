package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminService;
import model.admin;

/**
 * Servlet implementation class addAdmin
 */
@WebServlet("/addAdmin")
public class addAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAdmin() {
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
		admin ad = new admin();
		ad.setName(request.getParameter("name"));
		ad.setPassword(request.getParameter("password"));
		ad.setEmail(request.getParameter("email"));
		ad.setRole(request.getParameter("inputstate"));
		
		
		adminService service = new adminService();
		service.regAdmin(ad);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminreg.jsp");
		dispatcher.forward(request, response);
	}

}

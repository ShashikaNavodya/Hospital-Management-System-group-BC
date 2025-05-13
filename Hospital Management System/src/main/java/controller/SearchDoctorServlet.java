package controller;

import java.awt.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.customerService;
import model.doctor;
/**
 * Servlet implementation class SearchDoctorServlet
 */
@WebServlet("/SearchDoctorServlet")
public class SearchDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDoctorServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String specialization = request.getParameter("specialization");
	    String hospital = request.getParameter("hospital");
	    //String date = request.getParameter("inputDate");

	    java.util.List<doctor> doctors = new java.util.ArrayList<>();

	    try {
	        doctors = customerService.searchDoctors(name, specialization, hospital);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    request.setAttribute("doctors", doctors);
	    request.getRequestDispatcher("search.jsp").forward(request, response);
	}
}



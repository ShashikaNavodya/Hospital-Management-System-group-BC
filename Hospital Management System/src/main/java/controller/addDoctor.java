package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.doctorService;
import model.doctor;

/**
 * Servlet implementation class addDoctor
 */
@WebServlet("/addDoctor")
public class addDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDoctor() {
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
		doctor dc = new doctor();
		dc.setName(request.getParameter("name"));
		dc.setHospital(request.getParameter("hospital"));
		dc.setSpeciality(request.getParameter("specialization"));
		dc.setExperience(request.getParameter("experience"));
		dc.setContact(request.getParameter("contact"));
		dc.setEmail(request.getParameter("email"));
		dc.setCountry(request.getParameter("country"));
		dc.setGender(request.getParameter("inputstate"));
		

		doctorService service = new doctorService();
		service.regDoctor(dc);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("doctorreg.jsp");
		dispatcher.forward(request, response);
	}

}

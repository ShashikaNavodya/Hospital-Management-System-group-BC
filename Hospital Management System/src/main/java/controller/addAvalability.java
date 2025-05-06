package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.avalabilityService;
import model.avalability;


/**
 * Servlet implementation class addAvalability
 */
@WebServlet("/addAvalability")
public class addAvalability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAvalability() {
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
	    avalability dc = new avalability();

	    try {
	        int doctorId = Integer.parseInt(request.getParameter("id"));
	        dc.setDoctorID(doctorId);
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        // Handle error if needed
	    }

	    dc.setWeekday(request.getParameter("weekday"));
	    dc.setStart_time(request.getParameter("start_time"));
	    dc.setEnd_time(request.getParameter("end_time"));
	    dc.setLocation(request.getParameter("location"));


	    avalabilityService service = new avalabilityService();
	    service.avbDoctor(dc);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("addavalability.jsp");
	    dispatcher.forward(request, response);
	}


}

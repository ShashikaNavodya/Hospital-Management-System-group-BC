package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.doctorService;
import model.doctor;

/**
 * Servlet implementation class viewDoctorServelet
 */
@WebServlet("/viewDoctorServlet")
public class viewDoctorServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewDoctorServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            doctorService service = new doctorService();
            List<doctor> doctorList = service.getAllDoctor();
            request.setAttribute("doctorList", doctorList);
            
        } catch (ClassNotFoundException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewdoctor.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

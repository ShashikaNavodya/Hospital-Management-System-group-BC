package controller;

import java.awt.List;
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
 * Servlet implementation class updateDoctorAvalabilityServerlet
 */
@WebServlet("/updateDoctorAvalabilityServerlet")
public class updateDoctorAvalabilityServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDoctorAvalabilityServerlet() {
        super();
        // TODO Auto-generated constructor stub
    }
/*
 // Fetch doctor by email (GET method)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String searchIdParam = request.getParameter("searcID");

        if (searchIdParam != null && !searchIdParam.isEmpty()) {
            try {
                int searchID = Integer.parseInt(searchIdParam);

                avalability foundDoctor = new avalabilityService().getDoctorByID(searchID);
                if (foundDoctor != null) {
                    request.setAttribute("foundDoctor", foundDoctor);
                } else {
                    request.setAttribute("message", "Doctor not found.");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving doctor details.");
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateavalability.jsp");
        dispatcher.forward(request, response);
    }
*/
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchIdParam = request.getParameter("searcID");

        if (searchIdParam != null && !searchIdParam.isEmpty()) {
            try {
                int searchID = Integer.parseInt(searchIdParam);

                // Fetch all availability records for the doctor
                java.util.List<avalability> doctorAvailabilityList = new avalabilityService().getDoctorByID(searchID);
                if (doctorAvailabilityList != null && !doctorAvailabilityList.isEmpty()) {
                    request.setAttribute("doctorAvailabilityList", doctorAvailabilityList);
                } else {
                    request.setAttribute("message", "No availability records found for this doctor.");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving doctor details.");
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateavalability.jsp");
        dispatcher.forward(request, response);
    }

    // Update doctor info (POST method)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String idStr = request.getParameter("availabilityID");
        String updatedweekday = request.getParameter("weekday");
        String updatedstart_time = request.getParameter("start_time");
        String updatedend_time = request.getParameter("end_time");
        System.out.println(idStr);
        System.out.println(updatedweekday);

        
        avalability updatedDoctor = new avalability();
        updatedDoctor.setWeekday(updatedweekday);
        updatedDoctor.setStart_time(updatedstart_time);
        updatedDoctor.setEnd_time(updatedend_time);

        boolean updated = false;
        try {
        	int originalIDcon = Integer.parseInt(idStr);

            updated = new avalabilityService().updateDoctor(originalIDcon, updatedDoctor);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (updated) {
            request.setAttribute("message", "Doctor updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update doctor.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateavalability.jsp");
        dispatcher.forward(request, response);
    }

}

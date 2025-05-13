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
 * Servlet implementation class deleteDoctorServslet
 */
@WebServlet("/deleteDoctorServslet")
public class deleteDoctorServslet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteDoctorServslet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchEmail = request.getParameter("searchEmail");

        if (searchEmail != null && !searchEmail.trim().isEmpty()) {
            doctor foundDoctor = null;
            try {
            	foundDoctor = new doctorService().getDoctorByEmail(searchEmail);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving Doctor details.");
            }

            if (foundDoctor != null) {
                request.setAttribute("foundDoctor", foundDoctor);
            } else {
                request.setAttribute("message", "Doctor not found.");
            }
        }

        // Forward to admindelete.jsp instead of adminmanagement.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("doctordelete.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailToDelete = request.getParameter("emailToDelete");

        if (emailToDelete != null && !emailToDelete.trim().isEmpty()) {
            boolean deleted = false;
            try {
                deleted = new doctorService().deleteDoctorByEmail(emailToDelete);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (deleted) {
                request.setAttribute("message", "Doctor deleted successfully.");
            } else {
                request.setAttribute("message", "Failed to delete Doctor.");
            }
        }

        // Forward to admindelete.jsp after deletion for the result display
        RequestDispatcher dispatcher = request.getRequestDispatcher("doctordelete.jsp");
        dispatcher.forward(request, response);
    }
}

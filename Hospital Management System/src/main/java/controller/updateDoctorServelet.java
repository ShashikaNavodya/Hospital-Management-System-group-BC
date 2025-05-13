package controller;

import dao.doctorService;
import model.doctor;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateDoctorServelet")
public class updateDoctorServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateDoctorServelet() {
        super();
    }

    // Fetch doctor by email (GET method)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchEmail = request.getParameter("searchEmail");

        if (searchEmail != null && !searchEmail.trim().isEmpty()) {
            try {
                doctor foundDoctor = new doctorService().getDoctorByEmail(searchEmail);
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

        RequestDispatcher dispatcher = request.getRequestDispatcher("doctorupdate.jsp");
        dispatcher.forward(request, response);
    }

    // Update doctor info (POST method)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalEmail = request.getParameter("originalEmail");
        String updatedName = request.getParameter("name");
        String updatedHospital = request.getParameter("hospital");
        String updatedSpeciality = request.getParameter("speciality");
        String updatedExperience = request.getParameter("experience");
        String updatedContact = request.getParameter("contact");
        String updatedEmail = request.getParameter("email");
        String updatedCountry = request.getParameter("country");
        String updatedGender = request.getParameter("gender");
        
        
        doctor updatedDoctor = new doctor();
        updatedDoctor.setName(updatedName);
        updatedDoctor.setHospital(updatedHospital);
        updatedDoctor.setSpeciality(updatedSpeciality);
        updatedDoctor.setExperience(updatedExperience);
        updatedDoctor.setContact(updatedContact);
        updatedDoctor.setEmail(updatedEmail);
        updatedDoctor.setCountry(updatedCountry);
        updatedDoctor.setGender(updatedGender);
        boolean updated = false;
        try {
            updated = new doctorService().updateDoctor(originalEmail, updatedDoctor);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (updated) {
            request.setAttribute("message", "Doctor updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update doctor.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("doctorupdate.jsp");
        dispatcher.forward(request, response);
    }
}

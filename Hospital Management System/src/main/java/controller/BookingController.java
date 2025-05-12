package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDAO;
import model.Booking;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public BookingController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Placeholder for GET method if required
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form parameters
            int availabilityId = Integer.parseInt(request.getParameter("availability_id"));
            String patientName = request.getParameter("patient_name");
            String nic = request.getParameter("nic");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String pay = request.getParameter("pay");
            String appointmentDate = request.getParameter("appointment_date");
            String email = request.getParameter("email");
            // Retrieve doctor information
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));

            // Log the form data (for debugging purposes)
            System.out.println("Received form data:");
            System.out.println("Availability ID: " + availabilityId);
            System.out.println("Patient Name: " + patientName);
            System.out.println("NIC: " + nic);
            System.out.println("Address: " + address);
            System.out.println("Contact: " + contact);
            System.out.println("Payment: " + pay);
            System.out.println("Appointment Date: " + appointmentDate);
            System.out.println("Doctor ID: " + doctorId);

            // Fetch the patient_id from the customer table using NIC
            BookingDAO bookingDAO = new BookingDAO();
            int patientId = bookingDAO.getPatientIdByNic(email);
            System.out.println(patientId);
            // If patient is found, proceed with booking
            if (patientId != -1) {
                // Create a new Booking object
                Booking booking = new Booking();
                booking.setDoctorId(doctorId);
                booking.setPatientId(patientId);
                booking.setAvailabilityId(availabilityId);
                booking.setPatientName(patientName);
                booking.setNic(nic);
                booking.setAddress(address);
                booking.setContact(contact);
                booking.setPay(pay);
                booking.setAppointmentDate(appointmentDate);
                booking.setStatus("Confirmed");  // Set the status to confirmed

                // Insert the booking into the database
                boolean result = bookingDAO.insertBooking(booking);

                // Redirect based on the result
                if (result) {
                    response.sendRedirect("success.jsp");  // Booking was successful
                } else {
                    response.sendRedirect("error.jsp");    // Something went wrong
                }
            } else {
                // No patient found, redirect to error page
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            // Log the exception (or use a logger)
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}

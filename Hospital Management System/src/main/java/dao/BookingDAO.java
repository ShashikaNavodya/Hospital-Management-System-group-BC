package dao;
import model.customer;

import model.Booking;
import model.avalability;
import util.DBConnect;

import java.sql.*;

public class BookingDAO {

	// Insert booking
	public boolean insertBooking(Booking booking) throws ClassNotFoundException {
	    String query = "INSERT INTO booking (doctor_id, patient_id, availability_id, patient_name, NIC, address, contact, pay, appointment_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DBConnect.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        ps.setInt(1, booking.getDoctorId());
	        ps.setInt(2, booking.getPatientId());
	        ps.setInt(3, booking.getAvailabilityId());
	        ps.setString(4, booking.getPatientName());
	        ps.setString(5, booking.getNic());
	        ps.setString(6, booking.getAddress());
	        ps.setString(7, booking.getContact());
	        ps.setString(8, booking.getPay());
	        ps.setString(9, booking.getAppointmentDate()); // Make sure this is in 'yyyy-MM-dd' format
	        ps.setString(10, booking.getStatus());

	        return ps.executeUpdate() > 0;

	    } catch (SQLException e) {
	        System.out.println("Error in insertBooking: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}
	
	// Method to retrieve patient_id from customer table based on email
	public int getPatientIdByNic(String nic) throws SQLException, ClassNotFoundException {
	    String query = "SELECT id FROM customer WHERE email = ?";
	    
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, nic);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            return rs.getInt("id"); // Assuming "id" is the correct column name
	        }
	    }
	    
	    return -1;  // Return -1 if patient is not found
	}
	
	
	public java.util.List<Booking> getAllAvailability(int patientId) throws ClassNotFoundException {
	    java.util.List<Booking> bookingList = new java.util.ArrayList<>();

	    String query = "SELECT " +
	               "  b.booking_id, b.doctor_id, b.patient_id, " +
	               "  b.patient_name, b.NIC, b.address, b.contact, " +
	               "  b.pay, b.appointment_date, b.status, " +
	               "  d.name AS doctor_name, " +
	               "  da.day_of_week, da.start_time, da.end_time, da.location " +
	               "FROM booking b " +
	               "INNER JOIN doctor_availability da ON b.availability_id = da.id " +
	               "INNER JOIN doctor d ON b.doctor_id = d.id " +
	               "WHERE b.patient_id = ?";

	    try (Connection conn = DBConnect.getConnection()) {
	        
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, patientId); // Set patient_id as the parameter

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Booking booking = new Booking();
	                booking.setBookingId(rs.getInt("booking_id"));
	                booking.setDoctorId(rs.getInt("doctor_id"));
	                booking.setPatientId(rs.getInt("patient_id"));
	                booking.setPatientName(rs.getString("patient_name"));
	               // booking.setNIC(rs.getString("NIC"));
	                booking.setAddress(rs.getString("address"));
	                booking.setContact(rs.getString("contact"));
	                booking.setPay(rs.getString("pay"));
	                booking.setAppointmentDate(rs.getString("appointment_date"));
	                booking.setStatus(rs.getString("status"));
	                booking.setDoctorName(rs.getString("doctor_name"));
	              //  booking.setDayOfWeek(rs.getString("day_of_week"));
	                booking.setStartTime(rs.getString("start_time"));
	                booking.setEndTime(rs.getString("end_time"));
	                booking.setLocation(rs.getString("location"));

	                bookingList.add(booking);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}


	public java.util.List<Booking> getAllBooking(String doctorName) throws ClassNotFoundException {
	    java.util.List<Booking> bookingList = new java.util.ArrayList<>();

	    String query = "SELECT " +
	               "  b.booking_id, b.doctor_id, b.patient_id, " +
	               "  b.patient_name, b.NIC, b.address, b.contact, " +
	               "  b.pay, b.appointment_date, b.status, " +
	               "  d.name AS doctor_name, " +
	               "  da.day_of_week, da.start_time, da.end_time, da.location " +
	               "FROM booking b " +
	               "INNER JOIN doctor_availability da ON b.availability_id = da.id " +
	               "INNER JOIN doctor d ON b.doctor_id = d.id " +
	               "WHERE LOWER(d.name) LIKE ?";

	    try (Connection conn = DBConnect.getConnection()) {
	        
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, "%" + doctorName + "%");

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Booking booking = new Booking();
	                booking.setBookingId(rs.getInt("booking_id"));
	                booking.setDoctorId(rs.getInt("doctor_id"));
	                booking.setPatientId(rs.getInt("patient_id"));
	                booking.setPatientName(rs.getString("patient_name"));
	               // booking.setNIC(rs.getString("NIC"));
	                booking.setAddress(rs.getString("address"));
	                booking.setContact(rs.getString("contact"));
	                booking.setPay(rs.getString("pay"));
	                booking.setAppointmentDate(rs.getString("appointment_date"));
	                booking.setStatus(rs.getString("status"));
	                booking.setDoctorName(rs.getString("doctor_name"));
	              //  booking.setDayOfWeek(rs.getString("day_of_week"));
	                booking.setStartTime(rs.getString("start_time"));
	                booking.setEndTime(rs.getString("end_time"));
	                booking.setLocation(rs.getString("location"));

	                bookingList.add(booking);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return bookingList;
	}
	
	public int getBookingCount() throws SQLException, ClassNotFoundException {
	    int count = 0;
	    String query = "SELECT COUNT(*) FROM booking";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    }
	    return count;
	}

}
package dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.avalability;
import model.doctor;
import util.DBConnect;

public class avalabilityService {

	
	public void avbDoctor(avalability dc) {
	    String query = "INSERT INTO doctor_availability (doctor_id, day_of_week, start_time, end_time, location) VALUES (?, ?, ?, ?, ?)";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	         
	        ps.setInt(1, dc.getDoctorID()); 
	        ps.setString(2, dc.getWeekday());
	        ps.setString(3, dc.getStart_time());
	        ps.setString(4, dc.getEnd_time());
	        ps.setString(5, dc.getLocation());

	        ps.executeUpdate();
	        System.out.println("Availability inserted successfully!");

	    } catch (SQLException e) {
	        System.out.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

/*
	 // Get doctor details by email
    public avalability getDoctorByID(int searchID) throws ClassNotFoundException {
        String query = "SELECT * FROM doctor_availability WHERE doctor_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, searchID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    avalability dc = new avalability();
                    dc.setWeekday(rs.getString("day_of_week"));
                    dc.setStart_time(rs.getString("start_time"));
                    dc.setEnd_time(rs.getString("end_time"));
                   
                    return dc;
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

	
*/
	
	public java.util.List<avalability> getDoctorByID(int searchID) throws ClassNotFoundException {
	    String query = "SELECT * FROM doctor_availability WHERE doctor_id = ?";
	    java.util.List<avalability> doctorAvailabilityList = new ArrayList<>();
	    
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        ps.setInt(1, searchID);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                avalability dc = new avalability();
	                dc.setId(rs.getInt("id"));
	                dc.setWeekday(rs.getString("day_of_week"));
	                dc.setStart_time(rs.getString("start_time"));
	                dc.setEnd_time(rs.getString("end_time"));
	                dc.setLocation(rs.getString("location"));
	                doctorAvailabilityList.add(dc);
	                System.out.println("id"+rs.getInt("id"));

	            }
	        }

	    } catch (SQLException e) {
	        System.out.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return doctorAvailabilityList;
	}


	

	// Update doctor details (only name & email for now)
	public boolean updateDoctor(int originalIDcon, avalability updateDoctor) throws ClassNotFoundException {
	    String query = "UPDATE doctor_availability SET day_of_week = ?, start_time = ?, end_time = ? WHERE id = ?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        ps.setString(1, updateDoctor.getWeekday());
	        ps.setString(2, updateDoctor.getStart_time());
	        ps.setString(3, updateDoctor.getEnd_time());
	        
	        // Corrected to set the doctor_id (4th parameter)
	        ps.setInt(4, originalIDcon);

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        System.out.println("SQL Error (update): " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}

	
/*	 //view admin users
    public java.util.List<avalability> getAllAvalability() throws ClassNotFoundException {
        java.util.List<avalability> doctorList = new java.util.ArrayList<>();  // Using fully qualified name
        String query = "SELECT * FROM doctor_availability";

        try (Connection conn = DBConnect.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	avalability dc = new avalability();  // Create admin object
                dc.setWeekday(rs.getString("day_of_week"));
                dc.setStart_time(rs.getString("start_time"));
                dc.setEnd_time(rs.getString("end_time"));
                dc.setLocation(rs.getString("location"));
                doctorList.add(dc);  
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctorList;  // Return the list of admins
    }
    */
	
	
	public java.util.List<avalability> getAllAvalability() throws ClassNotFoundException {
	    java.util.List<avalability> doctorList = new java.util.ArrayList<>();
	    
	    String query = "SELECT da.*, d.name AS doctor_name " +
	                   "FROM doctor_availability da " +
	                   "INNER JOIN doctor d ON da.doctor_id = d.id";

	    try (Connection conn = DBConnect.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            avalability dc = new avalability();
	            dc.setId(rs.getInt("id")); 
	            dc.setDoctorID(rs.getInt("doctor_id"));
	            dc.setWeekday(rs.getString("day_of_week"));
	            dc.setStart_time(rs.getString("start_time"));
	            dc.setEnd_time(rs.getString("end_time"));
	            dc.setLocation(rs.getString("location"));
	            dc.setDoctorName(rs.getString("doctor_name"));
	            doctorList.add(dc);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return doctorList;
	}

}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.admin;
import model.doctor;
import util.DBConnect;

public class doctorService {

	
	public void regDoctor(doctor dc) {
	    String query = "INSERT INTO doctor (name, hospital, speciality, experience, contact, email, country, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	         
	        ps.setString(1, dc.getName());
	        ps.setString(2, dc.getHospital());
	        ps.setString(3, dc.getSpeciality());
	        ps.setString(4, dc.getExperience());
	        ps.setString(5, dc.getContact());
	        ps.setString(6, dc.getEmail());
	        ps.setString(7, dc.getCountry());
	        ps.setString(8, dc.getGender());
	        
	        
	        ps.executeUpdate();
	        System.out.println("Customer inserted successfully!");

	    } catch (SQLException e) {
	        System.out.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	}
	
	
	 // Get doctor details by email
    public doctor getDoctorByEmail(String email) throws ClassNotFoundException {
        String query = "SELECT * FROM doctor WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    doctor dc = new doctor();
                    dc.setName(rs.getString("name"));
                    dc.setHospital(rs.getString("hospital"));
                    dc.setSpeciality(rs.getString("speciality"));
                    dc.setExperience(rs.getString("experience"));
                    dc.setContact(rs.getString("contact"));
                    dc.setEmail(rs.getString("email"));
                    dc.setCountry(rs.getString("country"));
                    dc.setGender(rs.getString("gender"));
                    return dc;
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    // Update doctor details (only name & email for now)
    public boolean updateDoctor(String originalEmail, doctor updateDoctor) throws ClassNotFoundException {
        String query = "UPDATE doctor SET name = ?, hospital = ?, speciality = ?, experience = ?, contact = ?, email = ?, country = ?, gender = ? WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, updateDoctor.getName());
            ps.setString(2, updateDoctor.getHospital());
            ps.setString(3, updateDoctor.getSpeciality());
            ps.setString(4, updateDoctor.getExperience());
            ps.setString(5, updateDoctor.getContact());
            ps.setString(6, updateDoctor.getEmail());
            ps.setString(7, updateDoctor.getCountry());
            ps.setString(8, updateDoctor.getGender());
            ps.setString(9, originalEmail);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("SQL Error (update): " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete admin by email
    public boolean deleteDoctorByEmail(String email) throws ClassNotFoundException {
        String query = "DELETE FROM doctor WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if deletion was successful

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;  // Return false if deletion failed
    }
    
    
    //view admin users
    public java.util.List<doctor> getAllDoctor() throws ClassNotFoundException {
        java.util.List<doctor> doctorList = new java.util.ArrayList<>();  // Using fully qualified name
        String query = "SELECT * FROM doctor";

        try (Connection conn = DBConnect.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                doctor dc = new doctor();  // Create admin object
                dc.setName(rs.getString("name"));
                dc.setEmail(rs.getString("email"));
                dc.setContact(rs.getString("contact"));
                dc.setHospital(rs.getString("hospital"));
                doctorList.add(dc);  // Add admin to list
                System.out.println("SQL Error: " + rs.getString("password"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctorList;  // Return the list of admins
    }
    
    public int getDoctorCount() throws SQLException, ClassNotFoundException {
        int count = 0;
        String query = "SELECT COUNT(*) FROM doctor";
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

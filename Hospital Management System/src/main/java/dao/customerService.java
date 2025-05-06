package dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.customer;
import model.doctor;
import util.DBConnect;

public class customerService {

	public void regCustomer(customer cus) {
	    String query = "INSERT INTO customer (email, password, address1, address2, city, state, zip) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	         
	        ps.setString(1, cus.getEmail());
	        ps.setString(2, cus.getPassword());
	        ps.setString(3, cus.getAddress1());
	        ps.setString(4, cus.getAddress2());
	        ps.setString(5, cus.getCity());
	        ps.setString(6, cus.getState());
	        ps.setString(7, cus.getZip());
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
	
	
	public boolean validate(customer cus) {
		
		
		 String query = "SELECT * FROM customer WHERE email = ? AND password = ?";
		    try (Connection conn = DBConnect.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		         
		        ps.setString(1, cus.getEmail());
		        ps.setString(2, cus.getPassword());
		        
		        try (ResultSet rs = ps.executeQuery()) {
		            return rs.next(); // returns true if a match is found
		        }

		    } catch (SQLException e) {
		        System.out.println("SQL Error: " + e.getMessage());
		        e.printStackTrace();
		        return false;
		    } catch (Exception e) {
		        System.out.println("Error: " + e.getMessage());
		        e.printStackTrace();
		        return false;
		    }
		
		
	}
	
	
	// Search doctors by optional filters
	public static java.util.List<doctor> searchDoctors(String name, String specialization, String hospital) throws ClassNotFoundException {
		java.util.List<doctor> resultList = new ArrayList<>();
		 StringBuilder query = new StringBuilder(
			        "SELECT d.id, d.name, d.speciality, d.hospital, d.experience, d.contact, d.email, d.country, d.gender, " +
			        "da.id, da.day_of_week, da.start_time, da.end_time, da.location " +
			        "FROM doctor d " +
			        "JOIN doctor_availability da ON d.id = da.doctor_id " +
			        "WHERE 1=1"
			    );

	   
	    if (name != null && !name.isEmpty()) {
	        query.append(" AND name LIKE ?");
	    }
	    if (specialization != null && !specialization.isEmpty()) {
	        query.append(" AND speciality LIKE ?");
	    }
	    if (hospital != null && !hospital.isEmpty()) {
	        query.append(" AND location LIKE ?");
	    }/*
	    if (date != null && !date.isEmpty()) {
	        query.append(" AND day_of_week = ?"); // Assuming your table has a 'date' column
	    }*/

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query.toString())) {

	        int paramIndex = 1;
	        if (name != null && !name.isEmpty()) {
	            ps.setString(paramIndex++, "%" + name + "%");
	        }
	        if (specialization != null && !specialization.isEmpty()) {
	            ps.setString(paramIndex++, "%" + specialization + "%");
	        }
	        if (hospital != null && !hospital.isEmpty()) {
	            ps.setString(paramIndex++, "%" + hospital + "%");
	        }/*
	        if (date != null && !date.isEmpty()) {
	            ps.setString(paramIndex++,  "%" + date  + "%");
	            
	        }*/

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                doctor dc = new doctor();
	                dc.setDId(rs.getInt("d.id"));
	                dc.setId(rs.getInt("da.id"));
	                dc.setName(rs.getString("name"));
	                dc.setHospital(rs.getString("hospital"));
	                dc.setSpeciality(rs.getString("speciality"));
	                dc.setExperience(rs.getString("experience"));
	                dc.setContact(rs.getString("contact"));
	                dc.setEmail(rs.getString("email"));
	                dc.setCountry(rs.getString("country"));
	                dc.setWeekday(rs.getString("day_of_week"));
	                dc.setLocation(rs.getString("location"));
	                dc.setStart_time(rs.getString("start_time"));
	                dc.setEnd_time(rs.getString("end_time"));
	                
	                resultList.add(dc);
	            }
	        }

	    } catch (SQLException e) {
	        System.out.println("SQL Error in searchDoctors: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return resultList;
	}
	
	
	 public int getPatientCount() throws SQLException, ClassNotFoundException {
	        int count = 0;
	        String query = "SELECT COUNT(*) FROM customer";
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

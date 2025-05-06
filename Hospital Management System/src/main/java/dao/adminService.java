package dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.admin;
import util.DBConnect;






public class adminService {

	public void regAdmin(admin ad) {
	    String query = "INSERT INTO admin (name, password, email, role) VALUES (?, ?, ?, ?)";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	         
	        ps.setString(1, ad.getName());
	        ps.setString(2, ad.getPassword());
	        ps.setString(3, ad.getEmail());
	        ps.setString(4, ad.getRole());
	        
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
	
	public boolean validate(admin ad) {
		
		
		 String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
		    try (Connection conn = DBConnect.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		         
		        ps.setString(1, ad.getEmail());
		        ps.setString(2, ad.getPassword());
		        
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
	
	
	// Method to get admin details by email
    public admin getAdminByEmail(String email) throws ClassNotFoundException {
        String query = "SELECT * FROM admin WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin ad = new admin();
                    ad.setName(rs.getString("name"));
                    ad.setEmail(rs.getString("email"));
                    ad.setPassword(rs.getString("password"));
                    ad.setRole(rs.getString("role"));
                    return ad;
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;  // Return null if admin not found
    }

    // Method to delete admin by email
    public boolean deleteAdminByEmail(String email) throws ClassNotFoundException {
        String query = "DELETE FROM admin WHERE email = ?";
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
    
    
    //update admin
    public boolean updateAdmin(String originalEmail, admin updatedAdmin) throws ClassNotFoundException {
        String query = "UPDATE admin SET name = ?, email = ?, password = ?, role = ? WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, updatedAdmin.getName());
            ps.setString(2, updatedAdmin.getEmail());
            ps.setString(3, updatedAdmin.getPassword());
            ps.setString(4, updatedAdmin.getRole());
            ps.setString(5, originalEmail);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("SQL Error (update): " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    //view admin users
    public java.util.List<admin> getAllAdmins() throws ClassNotFoundException {
        java.util.List<admin> adminList = new java.util.ArrayList<>();  // Using fully qualified name
        String query = "SELECT * FROM admin";

        try (Connection conn = DBConnect.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                admin ad = new admin();  // Create admin object
                ad.setName(rs.getString("name"));
                ad.setEmail(rs.getString("email"));
                ad.setPassword(rs.getString("password"));
                ad.setRole(rs.getString("role"));
                adminList.add(ad);  // Add admin to list
                System.out.println("SQL Error: " + rs.getString("password"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminList;  // Return the list of admins
    }

}

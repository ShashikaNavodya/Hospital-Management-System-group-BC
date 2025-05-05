package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
	    String username = "root";
	    String pwd = "20012020";

	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(
	        "jdbc:mysql://localhost:3306/hospitaldb?useSSL=false", 
	        username, pwd
	    );

	    if (con != null) {
	        System.out.println("Connection successful!");
	    } else {
	        System.out.println("Failed to make connection!");
	    }

	    return con;
	}
	
}

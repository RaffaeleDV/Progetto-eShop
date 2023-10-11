package it.unisa.signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import it.unisa.database.DriverManagerConnectionPool;

public class Validate {
	
	public static boolean emailExist(String email){
		
		boolean st = false;
		
		Connection conn = null;
		
		try{
			conn = DriverManagerConnectionPool.getConnection();
			
			
			PreparedStatement ps = conn.prepareStatement("SELECT email FROM utente WHERE email = ?");
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			st = rs.next();			
			
		} catch(SQLException e){
		  System.out.println("Error");
		}
		
		return st;
		
		
		
		
	}

}

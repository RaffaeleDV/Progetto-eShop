package it.unisa.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.unisa.database.DriverManagerConnectionPool;
import it.unisa.model.UtenteBean;

public class Validate {
	
	public static boolean checkUser(UtenteBean user){
		
		boolean st = false;
		
		Connection conn = null;
		try {
			conn = DriverManagerConnectionPool.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM utente WHERE email = ? AND password = ? ");
			
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			st = rs.next();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}		
		
		return st;		
	}

}

package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.unisa.database.DriverManagerConnectionPool;

public class UtenteModelDM {
	
	
	private static final String TABLE_NAME = "utente";
	
	
	public static void loadInfo(UtenteBean user) throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps = null;
	
		
		String selectSQL = "SELECT * FROM " + UtenteModelDM.TABLE_NAME + " WHERE email = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			
			ps.setString(1, user.getEmail());			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				user.setNome(rs.getString("nome"));
				user.setCognome(rs.getString("cognome"));
				user.setAdmin(rs.getBoolean("admin"));
				user.setIndirizzo_spedizione(rs.getString("indirizzo_spedizione"));
				user.setCAP(rs.getString("CAP"));
				user.setData_nascita(rs.getString("Data_Nascita"));							
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
	}
	
	public static UtenteBean loadUtente(String email) throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		UtenteBean user = new UtenteBean();
		
		user.setEmail(email);
		
		String selectSQL = "SELECT * FROM " + UtenteModelDM.TABLE_NAME + " WHERE email = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			
			ps.setString(1, email);			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				user.setNome(rs.getString("nome"));
				user.setCognome(rs.getString("cognome"));
				user.setAdmin(rs.getBoolean("admin"));
				user.setIndirizzo_spedizione(rs.getString("indirizzo_spedizione"));
				user.setCAP(rs.getString("CAP"));
				user.setData_nascita(rs.getString("Data_Nascita"));							
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return user;		
	}
	
	
	public static void doSaveUtente(UtenteBean utente) throws SQLException{
		
		String  email, nome, cognome, cap, indirizzo_spedizione, data_nascita,
		password;
		boolean admin;
			
		email = utente.getEmail();
		nome = utente.getNome();
		cognome = utente.getCognome();
		cap = utente.getCAP();
		indirizzo_spedizione = utente.getIndirizzo_spedizione();
		data_nascita = utente.getData_nascita();
		admin = false;
		password = utente.getPassword();
			
			
		Connection connection = null;
		PreparedStatement ps = null;
			
		String selectSQL =  "INSERT INTO " + UtenteModelDM.TABLE_NAME + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
		
			ps.setString(1, nome);
			ps.setString(2, cognome);
			ps.setString(3, email);
			ps.setString(4, cap);
			ps.setString(5, indirizzo_spedizione);
			ps.setString(6, data_nascita);
			ps.setBoolean(7, admin);
			ps.setString(8, password);
			
			System.out.println(ps.toString());
					
			ps.executeUpdate();
			connection.commit();
						
		}finally{	
			try{
				if(ps != null)
					ps.close();
			}finally{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
public static void doUpdateUtente(UtenteBean utente, String type, String dato) throws SQLException{
		
		String  email, nome, cognome, cap, indirizzo_spedizione, data_nascita,
		password;
		boolean admin;
			
		email = utente.getEmail();
		nome = utente.getNome();
		cognome = utente.getCognome();
		cap = utente.getCAP();
		indirizzo_spedizione = utente.getIndirizzo_spedizione();
		data_nascita = utente.getData_nascita();
		password = utente.getPassword();
			
		switch(type) {
		
		case "name": nome = dato ; break;
		case "surname": cognome = dato ; break;
		case "date": data_nascita = dato ; break;
		case "add": indirizzo_spedizione = dato ; break;
		case "cap": cap = dato; break;
		case "pass": password = dato; break;
		default: ; break; 
		}	
		
		Connection connection = null;
		PreparedStatement ps = null;
			
		String selectSQL =  "UPDATE " + UtenteModelDM.TABLE_NAME + 
				" SET nome = ?, cognome = ?, CAP = ?, indirizzo_spedizione = ?, data_nascita = ?, password = ? WHERE email = ?" ;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
		
			ps.setString(1, nome);
			ps.setString(2, cognome);
			ps.setString(3, cap);
			ps.setString(4, indirizzo_spedizione);
			ps.setString(5, data_nascita);
			ps.setString(6, password);
			ps.setString(7, email);
			
			//System.out.println(ps.toString());
					
			ps.executeUpdate();
			connection.commit();
						
		}finally{	
			try{
				if(ps != null)
					ps.close();
			}finally{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
}

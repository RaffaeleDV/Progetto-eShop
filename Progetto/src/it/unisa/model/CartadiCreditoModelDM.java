package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import it.unisa.database.DriverManagerConnectionPool;

public class CartadiCreditoModelDM {
	
private static final String TABLE_NAME = "cartacredito";
	
	
	public CartadiCreditoBean loadInfo(UtenteBean user) throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		CartadiCreditoBean credit = null;
		
		String selectSQL = "SELECT * FROM " + CartadiCreditoModelDM.TABLE_NAME + " WHERE proprietario = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			
			ps.setString(1, user.getEmail());			
			ResultSet rs = ps.executeQuery();
			
			
			
			while(rs.next()) {
				System.out.println("CartaTrovata");
				credit = new CartadiCreditoBean();
				credit.setCredito(rs.getFloat("credito"));
				credit.setCVV(rs.getString("CVV"));
				credit.setData_scadenza(rs.getString("data_scadenza"));
				credit.setPin(rs.getString("pin"));
				credit.setProprietario(rs.getString("proprietario"));
														
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return credit;		
	}
	
	
	
	public static void doSaveCredito(UtenteBean utente, CartadiCreditoBean credit) throws SQLException{
		
		String  email;
			
		email = utente.getEmail();
		
		String CVV, pin, data_scadenza;
		float credito;
		
		CVV = credit.getCVV();
		pin = credit.getPin();
		data_scadenza = credit.getData_scadenza();
		credito = credit.getCredito();
			
			
		Connection connection = null;
		PreparedStatement ps = null;
			
		String selectSQL =  "INSERT INTO " + CartadiCreditoModelDM.TABLE_NAME + " VALUES(?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
		
			ps.setString(1, pin);
			ps.setString(2, data_scadenza);
			ps.setString(3, CVV);
			ps.setFloat(4, credito);
			ps.setString(5, email);
			
			
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
	
	public static void doUpdateSaldo(float prezzo, UtenteBean user) throws SQLException{

		
		Connection connection = null;
		PreparedStatement ps = null;
		
			
		String selectSQL =  "UPDATE "+ CartadiCreditoModelDM.TABLE_NAME +" SET credito = ? WHERE proprietario = ?;";
		
		
			
		try {
			
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);	
			
			
			ps.setFloat(1, prezzo);
			ps.setString(2, user.getEmail());
			
			
					
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

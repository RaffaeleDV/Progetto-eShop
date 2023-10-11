package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import it.unisa.database.DriverManagerConnectionPool;

public class FatturaModelDM {
	
	private static final String TABLE_NAME = "fattura";
	
	public static ArrayList<FatturaBean> doRetrieveCompratore(UtenteBean compr) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		ArrayList<FatturaBean> fatt = new ArrayList<FatturaBean>();
		
		String selectSQL = "SELECT * FROM " + FatturaModelDM.TABLE_NAME + " WHERE compratore_fattura = ?";
		
			
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(selectSQL);
			
			ps.setString(1, compr.getEmail());	
		
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				FatturaBean bean = new FatturaBean();
	
				bean.setCompratore_fattura(rs.getString("compratore_fattura"));
				bean.setProdotto_fattura(rs.getInt("prodotto_fattura"));
				fatt.add(bean);
				
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}		
		return fatt;
	}
	
	
	
	public static void saveFattura(FatturaBean fat) throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String str = "INSERT INTO " + FatturaModelDM.TABLE_NAME + 
				" (compratore_fattura, prodotto_fattura) VALUES (?,?)";
		
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(str);
			
			ps.setString(1, fat.getCompratore_fattura());
			ps.setInt(2, fat.getProdotto_fattura());
			ps.executeUpdate();	
			
			conn.commit();
			
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}		
	}

}

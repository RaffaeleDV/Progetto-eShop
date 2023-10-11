package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.database.DriverManagerConnectionPool;

public class ProdottoModelDM {
	
	private static final String TABLE_NAME = "prodotto";

	public ProdottoBean doRetrieveByKey(int code) throws SQLException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		ProdottoBean bean = new ProdottoBean();
		
		String selectSQL = "SELECT * FROM " + ProdottoModelDM.TABLE_NAME + " WHERE codice_prod = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			
			ps.setInt(1, code);			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				bean.setCodice_prod(rs.getInt("codice_prod"));
				bean.setNome_prod(rs.getString("nome_prod"));
				bean.setDescrizione_prod(rs.getString("descrizione_prod"));
				bean.setPrezzo_prod(rs.getFloat("prezzo_prod"));
				bean.setVenditore_prod(rs.getString("venditore_prod"));
				bean.setDisponibile(rs.getBoolean("disponibile"));
				bean.setSconto_prod(rs.getInt("sconto_prod"));
							
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
		return bean;
	}
	
	public ArrayList<ProdottoBean> doRetrieveByName(String name) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();
		
		String selectSQL = "SELECT * FROM " + ProdottoModelDM.TABLE_NAME + " WHERE nome_prod LIKE ? AND disponibile = ?";
		
			
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(selectSQL);
			
			name = "%"+name+"%";
			
			ps.setString(1, name);
			ps.setBoolean(2, true);
			
			System.out.println(ps.toString());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ProdottoBean bean = new ProdottoBean();
	
				bean.setCodice_prod(rs.getInt("codice_prod"));
				bean.setNome_prod(rs.getString("nome_prod"));
				bean.setDescrizione_prod(rs.getString("descrizione_prod"));
				bean.setPrezzo_prod(rs.getFloat("prezzo_prod"));
				bean.setVenditore_prod(rs.getString("venditore_prod"));
				bean.setDisponibile(rs.getBoolean("disponibile"));
				bean.setSconto_prod(rs.getInt("sconto_prod"));
				products.add(bean);
				
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}		
		return products;
	}
	
	
	public ArrayList<ProdottoBean> doRetrieveVenditore(String venditore) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();
		
		String selectSQL = "SELECT * FROM " + ProdottoModelDM.TABLE_NAME + " WHERE venditore_prod = ?";
		
			
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(selectSQL);
			
			ps.setString(1, venditore);
			
		
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ProdottoBean bean = new ProdottoBean();
	
				bean.setCodice_prod(rs.getInt("codice_prod"));
				bean.setNome_prod(rs.getString("nome_prod"));
				bean.setDescrizione_prod(rs.getString("descrizione_prod"));
				bean.setPrezzo_prod(rs.getFloat("prezzo_prod"));
				bean.setVenditore_prod(rs.getString("venditore_prod"));
				bean.setDisponibile(rs.getBoolean("disponibile"));
				bean.setSconto_prod(rs.getInt("sconto_prod"));
				products.add(bean);
				
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}		
		return products;
	}

	public ArrayList<ProdottoBean> doRetrieveAll() throws SQLException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();
		
		String selectSQL = "SELECT * FROM " + ProdottoModelDM.TABLE_NAME + " WHERE disponibile = ?";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			ps.setBoolean(1, true);
						
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ProdottoBean bean = new ProdottoBean();

				bean.setCodice_prod(rs.getInt("codice_prod"));
				bean.setNome_prod(rs.getString("nome_prod"));
				bean.setDescrizione_prod(rs.getString("descrizione_prod"));
				bean.setPrezzo_prod(rs.getFloat("prezzo_prod"));
				bean.setVenditore_prod(rs.getString("venditore_prod"));
				bean.setDisponibile(rs.getBoolean("disponibile"));
				bean.setSconto_prod(rs.getInt("sconto_prod"));
				products.add(bean);
				
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
		return products;
	}
	
public ArrayList<ProdottoBean> doRetrieveAllSconto() throws SQLException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		ArrayList<ProdottoBean> products = new ArrayList<ProdottoBean>();
		
		String selectSQL = "SELECT * FROM " + ProdottoModelDM.TABLE_NAME + " WHERE disponibile = ? AND sconto_prod > 0";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			ps.setBoolean(1, true);
						
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ProdottoBean bean = new ProdottoBean();

				bean.setCodice_prod(rs.getInt("codice_prod"));
				bean.setNome_prod(rs.getString("nome_prod"));
				bean.setDescrizione_prod(rs.getString("descrizione_prod"));
				bean.setPrezzo_prod(rs.getFloat("prezzo_prod"));
				bean.setVenditore_prod(rs.getString("venditore_prod"));
				bean.setDisponibile(rs.getBoolean("disponibile"));
				bean.setSconto_prod(rs.getInt("sconto_prod"));
				products.add(bean);
				
			}
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
		return products;
	}
	

	public static void doSave(ProdottoBean product) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		String str = "INSERT INTO " + ProdottoModelDM.TABLE_NAME + 
				"(nome_prod, descrizione_prod, prezzo_prod, venditore_prod, sconto_prod, disponibile) VALUES (?,?,?,?,?,?)";
		
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(str);
			
			ps.setString(1, product.getNome_prod());
			ps.setString(2, product.getDescrizione_prod());
			ps.setFloat(3, product.getPrezzo_prod());
			ps.setString(4, product.getVenditore_prod());
			ps.setInt(5, product.getSconto_prod());
			ps.setBoolean(6, product.isDisponibile());
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

	public static void doDelete(int code) throws SQLException {
		
		
	}

	public static void buyProd(ProdottoBean prod) throws SQLException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		
		prod.setDisponibile(false);
		
		String selectSQL = "UPDATE " +ProdottoModelDM.TABLE_NAME+ " SET disponibile = ? WHERE codice_prod = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
			
			ps.setBoolean(1, prod.isDisponibile());	
			ps.setInt(2, prod.getCodice_prod());
			ps.executeUpdate();
			
			
		} finally {
			
			try{
				if(ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
		
	}
	
	public static boolean doUpdateProdotto(ProdottoBean prodotto, int oldcodice) throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;
		
		String selectSQL = "update prodotto set sconto_prod = ?, nome_prod = ?, prezzo_prod = ?, descrizione_prod = ? where codice_prod = ?;";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(selectSQL);
		
			ps.setInt(1, prodotto.getSconto_prod());
			ps.setString(2, prodotto.getNome_prod());
			ps.setFloat(3, prodotto.getPrezzo_prod());
			ps.setString(4, prodotto.getDescrizione_prod());
			ps.setInt(5, oldcodice);
					
			if(ps.executeUpdate() > 0){
				return true;
			}
		}finally{	
			try{
				if(ps != null)
					ps.close();
			}finally{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	
		return false;
	}
	
	
	
}

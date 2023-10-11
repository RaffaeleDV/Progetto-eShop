package it.unisa.model;

import java.io.Serializable;

public class UtenteBean extends AbstractBean implements Serializable {
	
	public UtenteBean() {
		this.email = this.nome = this.cognome = CAP = this.indirizzo_spedizione = this.data_nascita = this.password = null;
		this.admin = false;
	}
	
	private static final long serialVersionUID = 5348740440973049978L;
	
	String email;
	String nome;
	String cognome;
	String CAP;
	String indirizzo_spedizione;
	String data_nascita;
	boolean admin;
	String password;
		
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getCAP() {
		return CAP;
	}
	public void setCAP(String cAP) {
		CAP = cAP;
	}
	public String getIndirizzo_spedizione() {
		return indirizzo_spedizione;
	}
	public void setIndirizzo_spedizione(String indirizzo_spedizione) {
		this.indirizzo_spedizione = indirizzo_spedizione;
	}
	public String getData_nascita() {
		return data_nascita;
	}
	public void setData_nascita(String data_nascita) {
		this.data_nascita = data_nascita;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
	
	

}

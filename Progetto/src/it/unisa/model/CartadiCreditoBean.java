package it.unisa.model;

import java.io.Serializable;

public class CartadiCreditoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -762431471726793827L;
	String pin;
	String data_scadenza;
	String CVV;
	String proprietario;
	float credito;
	
	
	public CartadiCreditoBean() {
		this.pin = this.data_scadenza = this.CVV = null;
		this.credito = 0;
	}

	public String getProprietario() {
		return proprietario;
	}

	public void setProprietario(String proprietario) {
		this.proprietario = proprietario;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getData_scadenza() {
		return data_scadenza;
	}

	public void setData_scadenza(String data_scadenza) {
		this.data_scadenza = data_scadenza;
	}

	public String getCVV() {
		return CVV;
	}

	public void setCVV(String cVV) {
		CVV = cVV;
	}

	public float getCredito() {
		return credito;
	}

	public void setCredito(float credito) {
		this.credito = credito;
	}
	
	
	
	
	
}

package it.unisa.model;

import java.io.Serializable;

public class FatturaBean extends AbstractBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2136857687831552779L;
	
	String compratore_fattura;
	int prodotto_fattura;
	
	
	public FatturaBean(){
		
		this.compratore_fattura = null;
		this.prodotto_fattura = -1;		
	}

	public String getCompratore_fattura() {
		return compratore_fattura;
	}

	public void setCompratore_fattura(String compratore_fattura) {
		this.compratore_fattura = compratore_fattura;
	}

	public int getProdotto_fattura() {
		return prodotto_fattura;
	}

	public void setProdotto_fattura(int prodotto_fattura) {
		this.prodotto_fattura = prodotto_fattura;
	}

		
	

}

package it.unisa.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

public class ProdottoBean extends AbstractBean implements Serializable {

	private static final long serialVersionUID = 8813855078819227811L;
	
	int codice_prod;
	float prezzo_prod;
	String descrizione_prod;
	String venditore_prod;
	String nome_prod;
	int sconto_prod;
	boolean disponibile;
	
	
	
	
	public boolean isDisponibile() {
		return disponibile;
	}

	public void setDisponibile(boolean disponibile) {
		this.disponibile = disponibile;
	}

	public int getSconto_prod() {
		return sconto_prod;
	}

	public void setSconto_prod(int sconto_prod) {
		this.sconto_prod = sconto_prod;
	}

	public String getNome_prod() {
		return nome_prod;
	}

	public void setNome_prod(String nome_prod) {
		this.nome_prod = nome_prod;
	}

	public ProdottoBean() {
		this.prezzo_prod = -1;
		this.descrizione_prod = this.venditore_prod = null;
	}

	public int getCodice_prod() {
		return codice_prod;
	}

	public float getPrezzo_prod() {
		return prezzo_prod;
	}

	public void setPrezzo_prod(float prezzo_prod) {
		this.prezzo_prod = prezzo_prod;
	}

	public String getDescrizione_prod() {
		return descrizione_prod;
	}

	public void setDescrizione_prod(String descrizione_prod) {
		this.descrizione_prod = descrizione_prod;
	}

	public String getVenditore_prod() {
		return venditore_prod;
	}

	public void setVenditore_prod(String venditore_prod) {
		this.venditore_prod = venditore_prod;
	}

	public void setCodice_prod(int codice_prod) {
		this.codice_prod = codice_prod;
	}

	public static float getPrezzoProd(ArrayList<ProdottoBean> products){
		
		float prezzotot = 0;
		
		Iterator<ProdottoBean> it = products.iterator();
		
		while(it.hasNext()){
			
			ProdottoBean bean = it.next();			
			prezzotot =+ bean.getPrezzo_prod();
		}
		
		
		return prezzotot;
	}
	
	
	

}

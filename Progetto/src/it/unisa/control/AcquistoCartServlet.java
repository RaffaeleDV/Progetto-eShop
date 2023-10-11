package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.CartadiCreditoBean;
import it.unisa.model.CartadiCreditoModelDM;
import it.unisa.model.FatturaBean;
import it.unisa.model.FatturaModelDM;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDM;
import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;

/**
 * Servlet implementation class AcquistoCartServlet
 */
@WebServlet("/AcquistoCartServlet")
public class AcquistoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<ProdottoBean> prodd = (ArrayList<ProdottoBean>)request.getSession().getAttribute("prod-cart");
		UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
		CartadiCreditoBean cred = (CartadiCreditoBean) request.getSession().getAttribute("CartaCredito");
	
		
		
		Iterator<ProdottoBean> it = prodd.iterator();
		while(it.hasNext()){
			ProdottoBean prod = it.next();
			
			FatturaBean fat = new FatturaBean();
			fat.setCompratore_fattura(user.getEmail());
			fat.setProdotto_fattura(prod.getCodice_prod());
			
			float updateSaldo = cred.getCredito() - prod.getPrezzo_prod();
			System.out.println(updateSaldo);
			
			CartadiCreditoModelDM model = new CartadiCreditoModelDM();
			CartadiCreditoBean credV = null;
			try {
				UtenteBean userV = (UtenteBean) UtenteModelDM.loadUtente(prod.getVenditore_prod());
				credV = (CartadiCreditoBean) model.loadInfo(userV);
				float updateSaldoV = credV.getCredito() + prod.getPrezzo_prod();
				ProdottoModelDM.buyProd(prod);
				FatturaModelDM.saveFattura(fat);
				CartadiCreditoModelDM.doUpdateSaldo(updateSaldo, user);
				CartadiCreditoModelDM.doUpdateSaldo(updateSaldoV, UtenteModelDM.loadUtente(prod.getVenditore_prod()));
				request.getSession().setAttribute("prod-cart", null);
				request.getSession().setAttribute("CartaCredito", model.loadInfo(user));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

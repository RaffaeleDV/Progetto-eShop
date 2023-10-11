package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDM;
import it.unisa.model.UtenteBean;

/**
 * Servlet implementation class AggiornaProdServlet
 */
@WebServlet("/AggiornaProdServlet")
public class AggiornaProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		JSONObject json = new JSONObject(request.getParameter("obj"));
		int oldcodice = Integer.parseInt((String)request.getParameter("code"));
		
		String nome = json.getString("prodname");
		String info = json.getString("prodinfo");
		String prezzo = json.getString("prodprice");
		String sconto = json.getString("prodsale");
		
		
		ProdottoBean bean = new ProdottoBean();
		UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
		
		bean.setNome_prod(json.getString("prodname"));
		bean.setDescrizione_prod(json.getString("prodinfo"));
		bean.setPrezzo_prod(Float.parseFloat(json.getString(("prodprice"))));
		bean.setSconto_prod(json.getInt("prodsale"));
		bean.setDisponibile(true);
		bean.setVenditore_prod(user.getEmail());
		
		try {
			ProdottoModelDM.doUpdateProdotto(bean, oldcodice);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		JSONObject jsonresp = new JSONObject();
	   	
	   	jsonresp.put("change", "true");
	   	
	   	response.getWriter().print(jsonresp.toString());
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

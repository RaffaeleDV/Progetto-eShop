package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import it.unisa.model.CartadiCreditoBean;
import it.unisa.model.CartadiCreditoModelDM;
import it.unisa.model.UtenteBean;

/**
 * Servlet implementation class CredManagerServlet
 */
@WebServlet("/CredManagerServlet")
public class CredManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		String pin = request.getParameter("pin");
		String cvv = request.getParameter("cvv");
		String data_scadenza = request.getParameter("data");
		UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
		
		System.out.println("Email: "+ user.getEmail());
		
		Random rand = new Random();
		float credito = rand.nextInt(1000)+200;
		
		CartadiCreditoBean credit = new CartadiCreditoBean();
		
		credit.setPin(pin);
		credit.setCVV(cvv);
		credit.setData_scadenza(data_scadenza);
		credit.setCredito(credito);
	
		try {
			CartadiCreditoModelDM.doSaveCredito(user, credit);
			CartadiCreditoBean credits = new CartadiCreditoBean();
			CartadiCreditoModelDM model = new CartadiCreditoModelDM();
			credits = model.loadInfo(user);
			request.getSession().setAttribute("CartaCredito", credits);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject json = new JSONObject();
	   	
	   	json.put("save", "true");
	   	
	   	response.getWriter().print(json.toString());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

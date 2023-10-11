package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;

/**
 * Servlet implementation class AccManagerServlet
 */
@WebServlet("/AccManagerServlet")
public class AccManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		String type = request.getParameter("tipo");
		String dato = request.getParameter("dato");
		
		UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
				
		try {
			UtenteModelDM.doUpdateUtente(user, type, dato);
			UtenteModelDM.loadInfo(user);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject json = new JSONObject();
		   	
	   	json.put("update", "true");
	   	
	   	response.getWriter().print(json.toString());
	   	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

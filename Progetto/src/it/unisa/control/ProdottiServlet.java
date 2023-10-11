package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDM;
import it.unisa.model.UtenteBean;

/**
 * Servlet implementation class ProdottiServlet
 */
@WebServlet("/ProdottiServlet")
public class ProdottiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static ProdottoModelDM model = new ProdottoModelDM();
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
		
		if( action.equals("lista-miei-prodotti")){
			
			try {
				request.getSession().setAttribute("miei-prod", model.doRetrieveVenditore(user.getEmail()));
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rs = getServletContext().getRequestDispatcher("/products-list-page.jsp");
			rs.forward(request, response);
			
		} else if (action.equals("show-prod")){
			
			String code = request.getParameter("code");
			
			try {
				request.getSession().setAttribute("prod-selected", model.doRetrieveByKey(Integer.parseInt(code)));
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			RequestDispatcher rs = getServletContext().getRequestDispatcher("/products-page.jsp");
			rs.forward(request, response);
			
		}else if (action.equals("del-prod")){
			
			String code = request.getParameter("code");
			
			int codeint = Integer.parseInt(code);
			
			ArrayList<ProdottoBean> prodd = (ArrayList<ProdottoBean>) request.getSession().getAttribute("prod-cart");
			System.out.println(prodd.size());
			ProdottoModelDM model = new ProdottoModelDM();
			ProdottoBean prod;
					
				for(int i = 0; i < prodd.size(); i++){
					if(prodd.get(i).getCodice_prod() == codeint){
						prodd.remove(i);
						System.out.println("Rimosso");
						request.getSession().setAttribute("prod-cart", prodd);
					}
				}				
							
			System.out.println(prodd.size());
			response.sendRedirect(request.getContextPath() + "/cart-page.jsp");
		}	
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

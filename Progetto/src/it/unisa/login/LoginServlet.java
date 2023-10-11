package it.unisa.login;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.CartadiCreditoBean;
import it.unisa.model.CartadiCreditoModelDM;
import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("login-email");
		String pass = request.getParameter("login-password");
		String redirectPage = null;
		
		UtenteBean utente = new UtenteBean();
		utente.setEmail(email);
		utente.setPassword(pass);
		
		if(Validate.checkUser(utente)){
			CartadiCreditoBean credit = null;
			CartadiCreditoModelDM model = new CartadiCreditoModelDM();
			try {
				UtenteModelDM.loadInfo(utente);
				credit = model.loadInfo(utente);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("Loggato", new Boolean(true));
			request.getSession().setAttribute("SessionUser", utente);
			request.getSession().setAttribute("CartaCredito", credit);
			request.getSession().setAttribute("ErroreLogin", new Boolean(false));
			redirectPage = "/login-success.jsp";
			
		}else{
			request.getSession().setAttribute("Loggato", new Boolean(false));
			request.getSession().setAttribute("ErroreLogin", new Boolean(true));
			redirectPage = "/login-page.jsp";
				
		}	
		response.sendRedirect(request.getContextPath() + redirectPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

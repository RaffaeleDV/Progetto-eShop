package it.unisa.signup;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome, cognome, dataNascita, email, password, CAP, indirizzo;
		boolean admin;
		
		nome = request.getParameter("login-username");
		cognome = request.getParameter("login-surname");
		dataNascita = request.getParameter("date");
		email = ((UtenteBean) request.getSession().getAttribute("SessionUser")).getEmail();
		password = request.getParameter("password");
		CAP = request.getParameter("cap");
		indirizzo = request.getParameter("address");
		admin = false;
		
		System.out.println("Nome registrazione: "+nome);
		
		
		UtenteBean utente = new UtenteBean();
		
		utente.setAdmin(admin);
		utente.setCAP(CAP);
		utente.setCognome(cognome);
		utente.setNome(nome);
		utente.setEmail(email);
		utente.setData_nascita(dataNascita);
		utente.setIndirizzo_spedizione(indirizzo);
		utente.setPassword(password);
		
		
		try {
			UtenteModelDM.doSaveUtente(utente);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/login-page.jsp");
		
		
	
	
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package it.unisa.signup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import it.unisa.model.UtenteBean;



/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/EmailStepServlet")
public class EmailStepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    response.setContentType("application/json");	   
	   	String email = request.getParameter("email");
	   	Boolean remail;
	   	System.out.println(email);	   	
	   	if(Validate.emailExist(email)){	   			   		
	   		remail = true;
	   		System.out.println("exist");
	   	}else{	   		
	   		remail = false;
	   		UtenteBean user = new UtenteBean();
	   		user.setEmail(email);
	   		request.getSession().setAttribute("SessionUser", user);
	   		System.out.println("noexist");
	   	}
	   	JSONObject json = new JSONObject();
	   		   	
	   	json.put("exist", remail);
	   	System.out.println("Scrittura");
	   	response.getWriter().print(json.toString());
	   
	   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDM;

/**
 * Servlet implementation class AcquistoServlet
 */
@WebServlet("/AcquistoServlet")
public class AcquistoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProdottoModelDM model = new ProdottoModelDM();
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		String code = request.getParameter("code");
		
		ArrayList<ProdottoBean> prodd = (ArrayList<ProdottoBean>) request.getSession().getAttribute("prod-cart");
		
		ProdottoBean prod = new ProdottoBean();
		try {
			prod = model.doRetrieveByKey(Integer.parseInt(code));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(prodd != null){			
			prodd.add(prod);			
			request.getSession().setAttribute("prod-cart", prodd);
		} else {
			prodd = new ArrayList<ProdottoBean>();
			prodd.add(prod);		
			request.getSession().setAttribute("prod-cart", prodd);
			
		}
		
		JSONObject jsonresp = new JSONObject();
	   	
	   	jsonresp.put("addcart", "true");
	   	
	   	response.getWriter().print(jsonresp.toString());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

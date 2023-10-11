<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>	
	<fieldset>
	<legend>Prodotti</legend>
	<div class="table" id="table-prodotti">
		<div class="table-row">
			
			<div class="table-cell">Name </div>
			<div class="table-cell">Price</div>
			<div class="table-cell">Action</div>
		</div>
	<%
	ArrayList<?> prodotti = (ArrayList<?>) session.getAttribute("prodotti");
	ArrayList<?> mieiprod = (ArrayList<?>) session.getAttribute("miei-prod");
	System.out.println(mieiprod);
	if(prodotti != null && prodotti.size() > 0){
		Iterator<?> it = prodotti.iterator();
		while(it.hasNext()){
			
			ProdottoBean prod = (ProdottoBean) it.next();
			%> 
			<div class="table-row">
				
				<div class="table-cell"><%= prod.getNome_prod() %></div>
				<div class="table-cell"><%= prod.getPrezzo_prod()%></div>
				<div class="table-cell"> <a href="<%=request.getContextPath()%>/ProdottiServlet?action=show-prod&code=<%= prod.getCodice_prod() %>">Info</a> </div>		
			</div>
			
			<%
			
		}
		
	} else if(mieiprod != null && mieiprod.size() > 0){	
		Iterator<?> it = mieiprod.iterator();
		while(it.hasNext()){
			
			ProdottoBean prod = (ProdottoBean) it.next();
			%> 
			<div class="table-row">
				
				<div class="table-cell"> <%= prod.getNome_prod() %></div>
				<div class="table-cell"><%= prod.getPrezzo_prod() %> </div>
				<div class="table-cell"><a href="<%=request.getContextPath()%>/ProdottiServlet?action=show-prod&code=<%= prod.getCodice_prod() %>">Info</a></div>		
			</div>
			
			<% 
		}
	
	
	
	
	
	} else { %> 
		<p> Nessun prodotto trovato! </p> 
	<% } %>	
	</div>
	</fieldset>
	
	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
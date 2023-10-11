<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>
	
	
	<section id="home">
		
		
	<fieldset>
		<legend>Prodotti Primo piano</legend>
		
		<div class="table">
		<div class="table-row">
			
			<div class="table-cell">Name </div>
			<div class="table-cell">Price</div>
			<div class="table-cell">Action</div>
		</div>
	<%
	ProdottoModelDM model = new ProdottoModelDM();
	ArrayList<ProdottoBean> prodotti = (ArrayList<ProdottoBean>) model.doRetrieveAll();	
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
		
	} %></div>		
		</fieldset>
	
	</section>	
	<aside>
		<fieldset>
		<legend>Offerte</legend>
		
		<div class="table">
		<div class="table-row">
			
			<div class="table-cell">Name </div>
			<div class="table-cell">Price</div>
			<div class="table-cell">Sconto</div>
			<div class="table-cell">Action</div>
		</div>
	<%
	
	ArrayList<ProdottoBean> prodottis = (ArrayList<ProdottoBean>) model.doRetrieveAllSconto();	
	if(prodottis != null && prodottis.size() > 0){
		Iterator<?> it = prodottis.iterator();
		while(it.hasNext()){
			
			ProdottoBean prod = (ProdottoBean) it.next();
			%> 
			<div class="table-row">
				
				<div class="table-cell"><%= prod.getNome_prod() %></div>
				<div class="table-cell"><%= prod.getPrezzo_prod()%></div>
				<div class="table-cell"><%= prod.getSconto_prod()%></div>
				<div class="table-cell"> <a href="<%=request.getContextPath()%>/ProdottiServlet?action=show-prod&code=<%= prod.getCodice_prod() %>">Info</a> </div>		
			</div>
			
			<%
			
		}
		
	} %>	</div>	
		</fieldset>
		
		</aside>
	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
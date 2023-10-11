<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>	
	
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
	ProdottoModelDM model = new ProdottoModelDM();
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
	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
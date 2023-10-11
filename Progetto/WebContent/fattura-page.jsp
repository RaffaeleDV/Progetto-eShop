<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>	
	<fieldset>
	<legend>Prodotti Acquistati</legend>
	<%
	UtenteBean user = (UtenteBean) request.getSession().getAttribute("SessionUser");
	
	ArrayList<FatturaBean> fat = FatturaModelDM.doRetrieveCompratore(user);
	
	Iterator<FatturaBean> it = fat.iterator();
	
	ProdottoModelDM model = new ProdottoModelDM();
	
	while(it.hasNext()){
		
		FatturaBean bfat = it.next();
		 int codep = bfat.getProdotto_fattura();
		ProdottoBean bean =	model.doRetrieveByKey(codep); 
		%>
		
		<p> Nome prodotto: <%=bean.getNome_prod() %>
		<br>
	<%}
	
	%>
	</fieldset>
	<%@ include file = "footer.jsp"  %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>
	<fieldset>
		<legend>Info Account</legend>
		
			<% UtenteBean user = (UtenteBean) session.getAttribute("SessionUser"); %>	
		
		<p> Name: <%= user.getNome()  %> </p>
		<p>	Surname: <%= user.getCognome() %> </p>
		<p>	Email: <%= user.getEmail() %> </p>
		<p>	Date of Birth: <%= user.getData_nascita() %> </p>
		<p>	Address: <%= user.getIndirizzo_spedizione() %> </p>
		<p>	CAP: <%= user.getCAP() %> </p>
	</fieldset>
	
	<fieldset>
		<legend>Info Metodo Pagamento</legend>
			
			<% CartadiCreditoBean bean = (CartadiCreditoBean) session.getAttribute("CartaCredito"); %>	
		
		<%
		if(bean != null ){
			%>
				<p> Pin: <%= bean.getPin()  %> </p>
				<p>	CVV: <%= bean.getCVV() %> </p>
				<p>	Credito: <%= bean.getCredito() %> </p>
				<p>	Data di Scadenza: <%= bean.getData_scadenza() %> </p>
				<br>
				
			<%		
			
		}else{
		%>
		<p> Nessun metodo di pagamento trovato! <a href="credit-manager-page.jsp">Registrane</a> uno per cominciare ad acquistare. </p>
		<%
		}
		
		%>
	</fieldset>	
	
	<fieldset>
		<legend>Gestione account personale</legend>
		<ul class="manager-ul">
			<li class="manager-il"><a href="account-manager-page.jsp">Gestione informazioni account</a></li><br>
			
		</ul>
	</fieldset>	
	
	<fieldset>	
		<legend>Gestione account venditore</legend>
		<%
		if(bean != null ){
			%>
		<ul class="manager-ul">
			<li class="manager-il"><a href="<%=request.getContextPath()%>/ProdottiServlet?action=lista-miei-prodotti">Visualizza tuoi prodotti</a></li><br>	
			<li class="manager-il"><a href="products-manager-page.jsp">Gestione prodotti in vendita</a></li>
		</ul>
				<br>
				
			<%		
			
		}else{
		%>
		<p> Nessun metodo di pagamento trovato! <a href="credit-manager-page.jsp">Registrane</a> uno per cominciare a vendere. </p>
		<%
		}
		
		%>
		
	</fieldset>
	
		
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
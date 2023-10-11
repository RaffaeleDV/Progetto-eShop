<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>
	
	<%ArrayList<ProdottoBean> prod = (ArrayList<ProdottoBean>)request.getSession().getAttribute("prod-cart");
	
		CartadiCreditoBean cred = (CartadiCreditoBean) request.getSession().getAttribute("CartaCredito");
	%>
	
	<fieldset>
	<legend>Carrello</legend>
	<p><button id="cart-buy" onclick="acquistaCarrello()">Acquista Carrello</button></p>
	<div class="table" id="table-prodotti">
	<% if(prod != null && prod.size() > 0){ 
	
		Iterator<ProdottoBean> it = prod.iterator();
		
		while(it.hasNext()){
			ProdottoBean bean = it.next();
		%>
			<div class="table-row">
				<div class="table-cell"><%=bean.getNome_prod() %></div>
				<div class="table-cell"><%=bean.getPrezzo_prod()%></div>
				<div class="table-cell"><a href="<%=request.getContextPath()%>/ProdottiServlet?action=del-prod&code=<%=bean.getCodice_prod()%>">Elimina</a> </div>		
			</div>	
	<%	
		}
		if(cred != null &&(cred.getCredito() < ProdottoBean.getPrezzoProd(prod))){
			
			%>
			
			<p>Non hai credito per acquistare tutti i prodotti!</p>
			<script type="text/javascript"> $("#cart-buy").prop('disabled', true);  </script>	
			
			<%
			
		}else if(cred == null){
              %>
			
			<p>Non puoi acquistare senza una carta di credito! (Registrati per inserirne una)</p>
			<script type="text/javascript"> $("#cart-buy").prop('disabled', true);  </script>	
			
			<%
		}
		
	}else{
	%>
	<p>Non hai prodotti nel carrello!</p>
	<script type="text/javascript"> $("#cart-buy").prop('disabled', true);  </script>	
	<%} %>
	</div>
	
	
	
	<a id="aservlet" href="<%=request.getContextPath()%>/AcquistoCartServlet" hidden></a>	
	
	</fieldset>
	
	<script type="text/javascript">
	
		function acquistaCarrello(){
			console.log("click");
			var href = $('#aservlet').attr('href');
		    window.location.href = href;
		}	
		
		function disableButt(){
			 $("#cart-buy").prop('disabled', true);
			
		}
	
	</script>
		
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
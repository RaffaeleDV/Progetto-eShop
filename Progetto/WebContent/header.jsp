<%@ page import="it.unisa.model.*"%>
<header>
	<div id="div-logo">
	<p id="logo">E-shop Online</p>

	<%@ include file = "search-bar.jsp" %>
	
	</div>
	<br>
	<nav id="mynav" class="navtop">
	<a href= "index.jsp">Home</a>
	<a href="products-deal-page.jsp">Offerte</a>
	<a href="cart-page.jsp">Carrello</a>
	<% 
			boolean log = false;
			if(session.getAttribute("Loggato") != null){
			log = (boolean) session.getAttribute("Loggato");
			}
			if(log == true) {
				UtenteBean user = (UtenteBean) session.getAttribute("SessionUser");%>
			<div class="dropdown">
	  			<button class="dropbtn"><%= user.getNome() %></button>
		  			<div class="dropdown-content">
		  			<a href="account-page.jsp">Gestione Account</a>
		  			<a href="fattura-page.jsp">I miei acquisti</a>
		   			<a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
		   			
		    	</div>
			</div>
						
			<% } else { %>
			<a href="login-page.jsp">Login</a>
			<a href="signup-page-1.jsp">Sign Up</a>
			<%} %>
			<a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
	
	</nav>
</header>


<script>

function myFunction() {
    var x = document.getElementById("mynav");
    if (x.className === "navtop") {
        x.className += " responsive";
    } else {
        x.className = "navtop";
    }
}

</script>
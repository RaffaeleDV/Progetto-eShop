<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>
	
	<section>
		<div id="login-container">
			<form method="post" action="LoginServlet">
				<fieldset>
					<legend>Login</legend>
					<p id="warning-message"> <%
					boolean logErr = false;
					if(session.getAttribute("ErroreLogin") != null){
					logErr = (boolean) session.getAttribute("ErroreLogin");
					}
					if(logErr == true) { %>
					<p> Errore login: Email o Password sbagliate! </p> <% } %>				
						
					</p>
					
					<input id="username" name="login-email" type="text" placeholder="E-mail" required/>
					<input id="password" name="login-password" type="password" placeholder="Password" required/>
					<button id="submit-button" name="submit" type="submit">Submit</button>
					<br>
					<p> Non sei registrato?  <a href="signup-page-1.jsp">Registrati</a></p>
				</fieldset>
			</form>
			
		</div>
	</section>
	
	
	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
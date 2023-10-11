<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ include file = "head.jsp"  %>
<body>
<%@ include file = "header.jsp"  %>
	
	<section>
		<div id="signup-container">
			<form method="post" action="SignUpServlet">
				<fieldset>
					<legend>Sign Up</legend>
					<p id="warning-message"></p>
					<label>Name: </label>
					<br><br>
					<input id="username" name="login-username" type="text" placeholder="Name" maxlenght="15" required />
					<br><br>
					<label>Surname: </label>
					<br><br>
					<input id="surname" name="login-surname" type="text" placeholder="Surname" maxlenght="15" required />
					<br><br>
					<label>Password: </label>
					<br><br>
					<input id="password" name="password" type="password" placeholder="Password" maxlenght="15" required />
					<br><br>
					<label>Address: </label>
					<br><br>
					<input id="address" name="address" type="text" placeholder="Indirizzo" maxlenght="25" required />
					<br><br>
					<label>CAP: </label>
					<br><br>
					<input id="cap" name="cap" type="text" placeholder="CAP" maxlenght="5" required/>
					<br><br>
					<label>Birth Date: </label>
					<br><br>
					<input id="born-date" name="date" type="date" min="1920-01-01" max="2000-01-01" required />
					<br><br>					
					<button id="submit-button" name="submit" type="submit">Submit</button>
				</fieldset>
			</form>
		</div>
	</section>
	
	<script type="text/javascript">
	
	document.getElementById("username").addEventListener("input", function() {
	
		var name = /^[A-Za-z]{3,15}$/;
		
		if (name.test($("#username").val())){
			$("#submit-button").prop('disabled', false);
	    	$("#username").css('background-color', 'green');
		}else {
	    	$("#submit-button").prop('disabled', true);
	    	$("#username").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("surname").addEventListener("input", function() {
			
		var name = /^[A-Za-z\s]{3,15}$/;
	
		if (name.test($("#surname").val())){
			$("#submit-button").prop('disabled', false);
	    	$("#surname").css('background-color', 'green');
		}else {
	    	$("#submit-button").prop('disabled', true);
	    	$("#surname").css('background-color', 'red');
	    }			
	} );
	
	document.getElementById("password").addEventListener("input", function() {		
		
		var pass = /^[A-Za-z0-9]{8,15}$/;
		
		if (pass.test($("#password").val())){
			$("#submit-button").prop('disabled', false);
	    	$("#password").css('background-color', 'green');
		}else {
	    	$("#submit-button").prop('disabled', true);
	    	$("#password").css('background-color', 'red');
	    }  		
	} );
	
	document.getElementById("address").addEventListener("input", function() {
		
		
		var add = /^[A-Za-z\s,.]+\s+\d+$/;
		
		if (add.test($("#address").val())){
			$("#submit-button").prop('disabled', false);
	    	$("#address").css('background-color', 'green');
		}else {
	    	$("#submit-button").prop('disabled', true);
	    	$("#address").css('background-color', 'red');
	    }  	
	} );
	
	document.getElementById("cap").addEventListener("input", function() {	
		
		var cap = /^\d{5}$/;
		
		if (cap.test($("#cap").val())){
			$("#submit-button").prop('disabled', false);
	    	$("#cap").css('background-color', 'green');
		}else {
	    	$("#submit-button").prop('disabled', true);
	    	$("#cap").css('background-color', 'red');
	    }  
	} );
	</script>	
	
<%@ include file = "footer.jsp"  %>
</body>
</html>
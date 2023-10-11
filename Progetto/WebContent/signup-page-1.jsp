<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body onload="$('#email_submit').prop('disabled', true);">
	<%@ include file = "header.jsp"  %>
	
	<section>
		<div id="signup-container">
			<fieldset>
				<legend>Sign Up</legend>
				<p id="warning-message"></p>
				<form>
				<input type = "text"  name = "email" id="id_email" placeholder = "email@example.com" required oninput="validateEmail()">
		
				<input id="email_submit" type = "button" name = "submit" value = "Conferma" onclick="ajaxCall()" >
				</form>
			</fieldset>
		</div>
	</section>

	<script type="text/javascript">
	function validateEmail() {
	    var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	    var email = $("#id_email").val();
	    if (re.test(email)){
	    	$("#email_submit").prop('disabled', false);
	    	$("#id_email").css('background-color', 'green');
	    	
	    } else {
	    	$("#email_submit").prop('disabled', true);
	    	$("#id_email").css('background-color', 'red');
	    }
	}
	
	function ajaxCall(){	
		console.log("Ajaxcall");
		$.ajax({
			type : "POST",
			url : "/Progetto/EmailStepServlet",
			contentType: "application/x-www-form-urlencoded",
			datatype : "json", 
			data: "email="+$("#id_email").val(),
			success: function(data){
				console.log("Success");
				dispayResult(data);
			},
			error: function(error){
				console.log("Errore:"+ error);
			}
		})
	}
	
	function dispayResult(data){
		console.log(data);
		var json = data;
		console.log(json);
		var result = json.exist;
		console.log(result);
		
		if(result){
			
			$("#warning-message").text("Errore Email già esistente");
			
		}else{
			
			window.location.replace("signup-page-2.jsp");
		}	
		
	}
	
	</script>
		
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
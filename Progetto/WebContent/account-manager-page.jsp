<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%@ include file = "head.jsp"  %>
<body onload="$('.change-button').prop('disabled', true);">
	<%@ include file = "header.jsp"  %>
	
	
	<fieldset>
	<legend>Modifica informazioni Account</legend>


		
		<input id="name-change" type="radio" name="change" value="Name"  > Name<br>
		<input id="surname-change" type="radio" name="change" value="Surname"  > Surname<br>
		<input id="date-change" type="radio" name="change" value="Data di Nascita"  > Date of Birth<br>
		<input id="add-change" type="radio" name="change" value="Address"  > Address<br>
		<input id="cap-change" type="radio" name="change" value="CAP"  > CAP<br>
		<input id="pass-change" type="radio" name="change" value="Pass"  > Password<br>	
	
	
	</fieldset>
	<p id="change-view"> 
					
					<div id="div-name">
						<fieldset hidden>
						<legend hidden>Update</legend>
						<p class="check-update"></p><br>
						<label hidden>Name: </label>
						
						<br><br>
						<input id="username" name="login-username" type="text" placeholder="Name" maxlenght="15" hidden />
						<button class="change-button" name="submit" type="button" hidden onclick="ajaxCall($('#username').val(),'username')">Change</button>
						</fieldset>
					</div>
					
					<div id="div-surname">
						<fieldset hidden>
						<legend hidden>Update</legend>	
						<p class="check-update"></p><br>					
						<label hidden>Surname: </label>
						
						<br><br>
						<input id="surname" name="login-surname" type="text" placeholder="Surname" maxlenght="15" hidden />
						<button class="change-button" id="change-button" name="submit" type="button" hidden onclick="ajaxCall($('#surname').val(),'surname')">Change</button>
						</fieldset>
					</div>
					
					<div id="div-date">
						<fieldset hidden>
						<legend hidden>Update</legend>
						<p class="check-update"></p><br>
						<label hidden>Birth Date: </label>
						
						<br><br>
						<input id="born-date" name="date" type="date" min="1920-01-01" max="2000-01-01" hidden />
						<button class="change-button" id="change-date" name="submit" type="button" hidden onclick="ajaxCall($('#born-date').val(),'date')">Change</button>
						</fieldset>
					</div>
					
					<div id="div-add">
						<fieldset hidden>
						<legend hidden>Update</legend>
						<p class="check-update"></p><br>
						<label hidden>Address: </label>
						
						<br><br>
						<input id="address" name="address" type="text" placeholder="Indirizzo" maxlenght="25" hidden />
						<button class="change-button" id="change-add" name="submit" type="button" hidden onclick="ajaxCall($('#address').val(),'add')">Change</button>
						</fieldset>
					</div>
					
					<div id="div-cap">
						<fieldset hidden>
						<legend hidden>Update</legend>
						<p class="check-update"></p><br>
						<label hidden>CAP: </label>
						
						<br><br>
						<input id="cap" name="cap" type="text" placeholder="CAP" maxlenght="5" hidden/>
						<button class="change-button" id="change-cap" name="submit" type="button" hidden onclick="ajaxCall($('#cap').val(),'cap')">Change</button>
						</fieldset>
					</div>
					
					<div id="div-pass">
						<fieldset hidden>
						<legend hidden>Update</legend>
						<p class="check-update"></p><br>
						<label hidden>Password: </label>
						
						<br><br>
						<input id="password" name="password" type="password" placeholder="Password" maxlenght="15" hidden />
						<button class="change-button" id="change-pass" name="submit" type="button" hidden onclick="ajaxCall($('#password').val(),'pass')">Change</button>
						</fieldset>
					</div>
	
	 </p>	
	
	<script type="text/javascript">
	
	document.getElementById("name-change").addEventListener("change", function() {
		
		$("#div-name").children().show();
		$("#div-name").children().children().show();
		
		$("#div-surname").children().hide();
		$("#div-date").children().hide();
		$("#div-add").children().hide();
		$("#div-cap").children().hide();
		$("#div-pass").children().hide();
		$(".check-update").text("");
		
	} );
	
	document.getElementById("surname-change").addEventListener("change", function() {
		
		$("#div-surname").children().show();
		$("#div-surname").children().children().show();
		
		$("#div-name").children().hide();
		$("#div-date").children().hide();
		$("#div-add").children().hide();
		$("#div-cap").children().hide();
		$("#div-pass").children().hide();
		$(".check-update").text("");
		
	} );
	
	document.getElementById("date-change").addEventListener("change", function() {
		
		$("#div-date").children().show();
		$("#div-date").children().children().show();
		
		$("#div-surname").children().hide();
		$("#div-name").children().hide();
		$("#div-add").children().hide();
		$("#div-cap").children().hide();
		$("#div-pass").children().hide();
		$(".check-update").text("");
		
	} );
	
	document.getElementById("add-change").addEventListener("change", function() {
		
		$("#div-add").children().show();
		$("#div-add").children().children().show();
		
		$("#div-surname").children().hide();
		$("#div-date").children().hide();
		$("#div-name").children().hide();
		$("#div-cap").children().hide();
		$("#div-pass").children().hide();
		$(".check-update").text("");
		
	} );
	
	document.getElementById("cap-change").addEventListener("change", function() {
		
		$("#div-cap").children().show();
		$("#div-cap").children().children().show();
		
		$("#div-surname").children().hide();
		$("#div-date").children().hide();
		$("#div-add").children().hide();
		$("#div-name").children().hide();
		$("#div-pass").children().hide();
		$(".check-update").text("");
		
	} );
	
	document.getElementById("pass-change").addEventListener("change", function() {
		
		$("#div-pass").children().show();
		$("#div-pass").children().children().show();
		
		$("#div-surname").children().hide();
		$("#div-date").children().hide();
		$("#div-add").children().hide();
		$("#div-cap").children().hide();
		$("#div-name").children().hide();
		$(".check-update").text("");
		
	} );
	
	
	document.getElementById("username").addEventListener("input", function() {
		
		var name = /^[A-Za-z]{3,15}$/;
		
		if (name.test($("#username").val())){
			$(".change-button").prop('disabled', false);
	    	$("#username").css('background-color', 'green');
		}else {
	    	$(".change-button").prop('disabled', true);
	    	$("#username").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("surname").addEventListener("input", function() {
			
		var name = /^[A-Za-z\s]{3,15}$/;
	
		if (name.test($("#surname").val())){
			$(".change-button").prop('disabled', false);
	    	$("#surname").css('background-color', 'green');
		}else {
	    	$(".change-button").prop('disabled', true);
	    	$("#surname").css('background-color', 'red');
	    }			
	} );
	
	document.getElementById("password").addEventListener("input", function() {		
		
		var pass = /^[A-Za-z0-9]{8,15}$/;
		
		if (pass.test($("#password").val())){
			$(".change-button").prop('disabled', false);
	    	$("#password").css('background-color', 'green');
		}else {
	    	$(".change-button").prop('disabled', true);
	    	$("#password").css('background-color', 'red');
	    }  		
	} );
	
	document.getElementById("address").addEventListener("input", function() {
		
		
		var add = /^[A-Za-z\s,.]+\s+\d+$/;
		
		if (add.test($("#address").val())){
			$(".change-button").prop('disabled', false);
	    	$("#address").css('background-color', 'green');
		}else {
	    	$(".change-button").prop('disabled', true);
	    	$("#address").css('background-color', 'red');
	    }  	
	} );
	
	document.getElementById("cap").addEventListener("input", function() {	
		
		var cap = /^\d{5}$/;
		
		if (cap.test($("#cap").val())){
			$(".change-button").prop('disabled', false);
	    	$("#cap").css('background-color', 'green');
		}else {
	    	$(".change-button").prop('disabled', true);
	    	$("#cap").css('background-color', 'red');
	    }  
	} );
	
	document.getElementById("born-date").addEventListener("input", function() {
		
		$(".change-button").prop('disabled', false);
	    $("#username").css('background-color', 'green');
		 
		
	} );
	
	function ajaxCall(input, type){
		
		console.log(input);
		console.log(type);
		
		$.ajax({
			type : "POST",
			url : "/Progetto/AccManagerServlet",
			contentType: "application/x-www-form-urlencoded",
			datatype : "json", 
			data: "tipo="+type+"&dato="+input,
			success: function(data){
				console.log("Success");
				dispayResult(data);
			},
			error: function(error){
				console.log("Errore:"+ error);
			}
		})
		
		
		function dispayResult(data){
			console.log(data);
			var json = data;
			console.log(json);
			var result = json.update;
			console.log(result);
			
			if(result){
				
				$(".check-update").text("Update completata!");
				$(".change-button").prop('disabled', true);
				
			}else{
				
				console.log("Update fallita");
			}	
			
		}
		
	}
	
	
	</script>	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
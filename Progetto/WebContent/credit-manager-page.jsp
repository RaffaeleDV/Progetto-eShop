<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%@ include file = "head.jsp"  %>
<body onload="$('#submit-add').prop('disabled', true);">
	<%@ include file = "header.jsp"  %>
	
	<fieldset>
		<legend>Modifica Metodo di Pagamento</legend>

		<p id="check-add"></p>
		<label for="pin-add">Pin</label>
		<p><input id="pin-add" type="text" name="pin" placeholder="Pin" maxlenght="10" /></p>
		<label for="cvv-add">CVV</label> 
		<p><input id="cvv-add" type="text" name="cvv" placeholder="CVV" maxlenght="3" /></p> 
		<label for="data-add">Data di Scadenza</label>
		<p><input id="data-add" type="date" name="data" /></p>
		<p><input id="submit-add" type="button" name="ddd" value="Add" onclick="ajaxCall( $('#pin-add').val(), $('#cvv-add').val(), $('#data-add').val())"/></p>	
	
	</fieldset>
	<script type="text/javascript">
	
	var i = 0;
	
	document.getElementById("pin-add").addEventListener("input", function() {
		
		var name = /^[0-9]{10}$/;
		
		if (name.test($("#pin-add").val())){
			i++;
			if(i >= 3){
				$("#submit-add").prop('disabled', false);
			}
			
	    	$("#pin-add").css('background-color', 'green');
		}else {
	    	$("#submit-add").prop('disabled', true);
	    	$("#pin-add").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("cvv-add").addEventListener("input", function() {
			
		var name = /^[0-9]{3}$/;
	
		if (name.test($("#cvv-add").val())){
			i++;
			if(i >= 3){
				$("#submit-add").prop('disabled', false);
			}
	    	$("#cvv-add").css('background-color', 'green');
		}else {
	    	$("#submit-add").prop('disabled', true);
	    	$("#cvv-add").css('background-color', 'red');
	    }			
	} );
	
	document.getElementById("data-add").addEventListener("input", function() {		
		
		i++;
		if(i >= 3){
			$("#submit-add").prop('disabled', false);
		}
	    $("#data-add").css('background-color', 'green');
	} );
	
	/*$("#submit-add").click(ajaxCall( $("#pin-add").val(), $("#cvv-add").val(), $("#data-add").val()) );*/
	
	function ajaxCall(pin, cvv, data){
		
		
		$.ajax({
			type : "POST",
			url : "/Progetto/CredManagerServlet",
			contentType: "application/x-www-form-urlencoded",
			datatype : "json", 
			data: "pin="+pin+"&cvv="+cvv+"&data="+data,
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
		var result = json.save;
		console.log(result);
			
		if(result){
				
			$("#check-add").text("Aggiunta completata!");
			$("#submit-add").prop('disabled', true);
			i = 0;
				
		}else{
				
			console.log("Aggiunta fallita");
		}	
			
	}
		
	
	
	
	</script>
	
	
	<%@ include file = "footer.jsp"  %>

</body>
</html>
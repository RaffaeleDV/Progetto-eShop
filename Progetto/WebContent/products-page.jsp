<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>	
	<%ProdottoBean prodotto = (ProdottoBean) request.getSession().getAttribute("prod-selected");
	
	UtenteBean user = (UtenteBean) session.getAttribute("SessionUser");	
	String email = null;
	if (user != null){
		email = user.getEmail();
	}else{
		email = "";
	}
	
	%>
	<fieldset>
	<legend><%=prodotto.getNome_prod()%></legend>
	
		<p id="mess-prod"></p>
	
		<div id="pprod-info"><p>Descrizione: <%=prodotto.getDescrizione_prod()%></p>
		<p id="pprod-vend">Venditore: <%=prodotto.getVenditore_prod()%></p>
		<p id="pprod-vend">Sconto: <%=prodotto.getSconto_prod()%>%</p>
		</div>
		
		
		<div id="pprod-price"><p>Prezzo: <%=prodotto.getPrezzo_prod()%></p></div>
		
		<% if(prodotto.isDisponibile()){%>
		<div id="pprod-but">
			<%if( !prodotto.getVenditore_prod().equals(email) ) {%>
			<button id="pprod-buy" name="submit" onclick="acquistaProdotto(<%=prodotto.getCodice_prod()%>)">Aggiungi Al Carrello</button>
			<%} %>
			<%if(user != null &&( user.isAdmin() || user.getEmail().equals(prodotto.getVenditore_prod()))){%> 
				
				 
				<p><button id="pprod-change" name="submit" onclick="changeProdotto()">Modifica Prodotto</button></p>
			<%} %>
			
		<%}else{ %>
		
		<p>Prodotto non disponibile!</p>
		<%} %>
		</div>
	</fieldset>
	
	<fieldset id="aggiorna-prodotto" hidden>
	<legend>Aggiorna Prodotto</legend>	
		<p class="mess"></p>
		<div>
				 <br>
				<label>Nuovo Nome:</label>
				<input id="prod-name" type="text" placeholder="">
				<br>
				<label>Nuova Descrizione:</label>
				<input id="prod-info" type="text" placeholder="">
				<br>
				<label>Nuovo Prezzo:</label>
				<input id="prod-price" type="number" min="0" max="1000" placeholder="">
				<br>
				<label>Nuovo Sconto</label>
				<input id="prod-sale" type="number" min="0" max="90" placeholder="">
				<br><br>
			<!-- Il bottone dovrebbe chiamare una funziona che controlla se gli input sono validi prima -->
			<p><button class="prod-button"id="aggiorna-button" name="aggiorna" onclick="updateProdotto(obj, <%=prodotto.getCodice_prod()%> )">Aggiorna Prodotto</button></p>
		</div>
	</fieldset>
	
	<script type="text/javascript">
	
		function changeProdotto(){
			
			$("#aggiorna-prodotto").show();
			$(".prod-button").prop('disabled', true);
		}
		
		var obj = {};
	
		document.getElementById("prod-name").addEventListener("input", function() {
		
		var name = /^[A-Za-z0-9\s]{5,45}$/;
		
		if (name.test($("#prod-name").val())){
			if($("#prod-name").css('background-color') == "rgb(0, 128, 0)" && $("#prod-info").css('background-color') == "rgb(0, 128, 0)" && $("#prod-price").css('background-color') == "rgb(0, 128, 0)" && $("#prod-sale").css('background-color') == "rgb(0, 128, 0)"){
				$(".prod-button").prop('disabled', false);
			}
			obj.prodname = $("#prod-name").val();
	    	$("#prod-name").css('background-color', 'green');	    	
		}else {
	    	$(".prod-button").prop('disabled', true);
	    	$("#prod-name").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("prod-info").addEventListener("input", function() {
		
		var name = /^[A-Za-z0-9\s]{5,90}$/;
		
		if (name.test($("#prod-info").val())){
			
			if($("#prod-name").css('background-color') == "rgb(0, 128, 0)" && $("#prod-info").css('background-color') == "rgb(0, 128, 0)" && $("#prod-price").css('background-color') == "rgb(0, 128, 0)" && $("#prod-sale").css('background-color') == "rgb(0, 128, 0)"){
				$(".prod-button").prop('disabled', false);
			}
			obj.prodinfo = $("#prod-info").val();
	    	$("#prod-info").css('background-color', 'green');
		}else {
	    	$(".prod-button").prop('disabled', true);
	    	$("#prod-info").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("prod-price").addEventListener("input", function() {
		
		var name = /^[0-9]+([.]?[0-9]*)?$/;
		
		if (name.test($("#prod-price").val())){
			
			if($("#prod-name").css('background-color') == "rgb(0, 128, 0)" && $("#prod-info").css('background-color') == "rgb(0, 128, 0)" && $("#prod-price").css('background-color') == "rgb(0, 128, 0)" && $("#prod-sale").css('background-color') == "rgb(0, 128, 0)"){
				$(".prod-button").prop('disabled', false);
			}
			obj.prodprice = $("#prod-price").val();
	    	$("#prod-price").css('background-color', 'green');
		}else {
	    	$(".prod-button").prop('disabled', true);
	    	$("#prod-price").css('background-color', 'red');
	    }  
		
	} );
	
	document.getElementById("prod-sale").addEventListener("input", function() {
		
		var name = /^[0-9]{1,2}$/;
		
		if (name.test($("#prod-sale").val())){
			if($("#prod-name").css('background-color') == "rgb(0, 128, 0)" && $("#prod-info").css('background-color') == "rgb(0, 128, 0)" && $("#prod-price").css('background-color') == "rgb(0, 128, 0)" && $("#prod-sale").css('background-color') == "rgb(0, 128, 0)"){
				$(".prod-button").prop('disabled', false);
			}
			obj.prodsale = $("#prod-sale").val();
	    	$("#prod-sale").css('background-color', 'green');
		}else {
	    	$(".prod-button").prop('disabled', true);
	    	$("#prod-sale").css('background-color', 'red');
	    }  
		
	} );
	
	
	function updateProdotto(obj, oldcode){
		
		console.log(obj);
		
		
		$.ajax({
			type : "POST",
			url : "/Progetto/AggiornaProdServlet",
			
			datatype : "json", 
			data: { obj : JSON.stringify(obj),
					code : oldcode	
			},
			
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
			var result = json.change;
			console.log(result);
			
			if(result){
				
				$(".mess").text("Update completata!");
				$(".prod-button").prop('disabled', true);
				$("input").val("");
				$("input").css('background-color', 'white');
				
			}else{
				
				console.log("Update fallita");
			}	
			
		}
		
	}
		
	
	
		function acquistaProdotto(code){
			
			console.log(code);			
			
			$.ajax({
				type : "POST",
				url : "/Progetto/AcquistoServlet",				
				datatype : "json", 
				data: "code="+code,
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
				var result = json.addcart;
				console.log(result);
				
				if(result){
					
					$("#mess-prod").text("Aggiunto al carrello!");
					$("#pprod-buy").prop('disabled', true);
					$("#pprod-del").prop('disabled', true);
					
				}else{
					
					console.log("Update fallita");
				}	
				
			}
			
		}	
		
	
	</script>
	
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
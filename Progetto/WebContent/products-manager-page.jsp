<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html onload="$('.prod-button').prop('disabled', true);">
	<%@ include file = "head.jsp"  %>
<body>
	<%@ include file = "header.jsp"  %>
	
	<fieldset>
	<legend>Gestione Prodotti</legend>	
		
		<input id="prod-add" type="radio" name="prod-man" value="add-prod"> Aggiungi un prodotto<br>
		
		
	</fieldset>
	
	<div id="prod">
	
		
	
		<div id="div-add-prod">
			<fieldset hidden>
				
				<legend>Aggiunta di un prodotto</legend>
				<br>
				<p class="mess"></p>
				
				<br>
				<label>Nome</label>
				<input id="prod-name" type="text" placeholder="">
				<br>
				<label>Descrizione</label>
				<input id="prod-info" type="text" placeholder="">
				<br>
				<label>Prezzo</label>
				<input id="prod-price" type="number" min="0" max="1000" placeholder="">
				<br>
				<label>Sconto</label>
				<input id="prod-sale" type="number" min="0" max="90" placeholder="">
				<br><br>
				<button class="prod-button" id="add-butt" name="submit" type="button" onclick="ajaxCall(obj)">Add</button>
			
			</fieldset>
		
		</div>
	
		
	</div>
	
	<script type="text/javascript">
	

	
	document.getElementById("prod-add").addEventListener("change", function() {
		
		$("#div-add-prod").contents().show();
		$(".prod-button").prop('disabled', true);
	
		
		$("#div-delete-prod").contents().hide();
		$("#mess").text("");
		
	} );
	

	
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
	
	function ajaxCall(obj){
		
		console.log(obj);
		
		
		$.ajax({
			type : "POST",
			url : "/Progetto/ProdManagerServlet",
			
			datatype : "json", 
			data: { obj : JSON.stringify(obj)},
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
			var result = json.add;
			console.log(result);
			
			if(result){
				
				$(".mess").text("Aggiunta completata!");
				$(".prod-button").prop('disabled', true);
				$("input").val("");
				$("input").css('background-color', 'white');
				
			}else{
				
				console.log("Update fallita");
			}	
			
		}
		
	}
	
	</script>
		
	
	<%@ include file = "footer.jsp"  %>
</body>
</html>
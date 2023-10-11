<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<%@ include file = "head.jsp"  %>
<body onload = "setTimeout(redirect, 5000)">

	<p class="success-mess" align ="center">Logout in corso!</p>
	<br>
	<p class="success-mess" align ="center">Sarai reinderizzato alla homepage tra qualche secondo...</p>
	
	
	<script type="text/javascript">
	
	function redirect(){
	
		window.location.href="index.jsp";
		
	}
	
	</script>
		


</body>
</html>
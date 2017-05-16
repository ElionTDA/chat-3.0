
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<%
	if(user.getNick() != null){
		%>
		<jsp:forward page="chatRoom.jsp">
			<jsp:param value="Ya estas logeado." name="status"/>
		</jsp:forward>
		<%
	}
	System.out.println("El estatus es");
	if(request.getParameter("status") != null){
		%>
		<span id="status"><%= request.getParameter("status") %></span>	
		<%
	}
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="rsc/css/style.css">
		<script src="rsc/js/main.js"></script>
    </head>
    <body>
    	<!-- TODO hacer la cabecera un fichero aparte. y meter con include. -->
    	<section id="header">
    		
    	</section>
	    <div id="login-box">
	    	<div id="login-title">
	   			<h1>Login</h1>
	    	</div>
	        <form name="login" id="login-form" method="post" action="login.jsp" onsubmit="return validateForm()">
	       		<span id="login-usuario-text"></span>
	        	<input id="login-text-nick" type="text" name="nickname" value="Usuario" onfocus="quitarValue()" onblur="ponerValue()">
	        	<div id="login-buttons">
		        	<input type="submit" name="Entrar"> 
		        	<input type="reset" name="Limpiar">   
	        	</div>
	        </form> 
	    </div>
    </body>
</html>
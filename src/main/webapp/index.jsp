
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />
<%
	System.out.println("Entra al index");
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
		<%= request.getParameter("status") %>	
		<%
	}
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Login</h1>
        <form method="post" action="login.jsp">
        	<input type="text" name="nickname">
        	<input type="submit" name="enviar"> 
        	<input type="reset" name="borrar">   
        </form> 
    </body>
</html>
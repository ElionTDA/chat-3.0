<!-- TODO meter esta cabecera en un fichero común, e importarlo en todos los que se use. -->
<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<!-- TODO Comprobar que no puedan acceder usuarios cualquiera sin registrar. -->


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="main.css">
        <title>CHAT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Sala de chat de usuario</h1>
        <div id="chat">
        	<!-- TODO dar formato a esto, para que muestre los mensajes como se quiere. -->
        	<div>
        		<%
        		for (Message mess: user.getMessageList()){
        			%>
        			<span><%= mess.createMessage() %></span><br>
        			<%
        		}
        		%>
        	</div>
            <form method="post" action="sendMensaje.jsp">
			    <textarea id="textarea" rows="10" cols="50" name="mensaje" ></textarea> <br>
			    <input type="text" name="message">
			    <input type="submit" value="Enviar">
			    <input type="reset"  value="Borrar" > 
            </form> 
        </div>
        <div id="ban">
            <form method="post" action="ban-unbanUser.jsp">
                <br> Ususario <br>
                <input type="text" name="nickname">
                <input type="submit" name="ban" value="ban">
                <input type="submit" name="ban" value="unban">
            </form>
        </div>
        <div>
            <br> Volver al inicio
        </div>
    </body>
</html>
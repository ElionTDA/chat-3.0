
<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<% 
// Comprobamos que el usuario de sesion tenga nick, osea este logueado.
if(user.getNick() == null || user.getNick() == ""){
%>
	<jsp:forward page="index.jsp">
		<jsp:param value="Tienes que loguearte primero" name="status"/>
	</jsp:forward>
<%
}	
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="main.css">
        <title>CHAT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="rsc/css/styleChatRoom.css">
		<script src="rsc/js/mainChatRoom.js"></script>
    </head>
    <body onload="refresh()">
    	<div id="chatroom-content">
	        <h1>Sala de chat de <%= user.getNick() %></h1>
	        <div id="chatroom-chatzone">
		        <div id="chat">
	        		<div id="textarea">
					    <%
		        		for (Message mess: user.getMessageList()){
		        			%>
		        			<span><%= mess.createMessage() %></span><br>
		        			<%
		        		}
		        		%>
		        	</div>
		            <form name="message-form" method="post" action="sendMensaje.jsp" onsubmit="return validateMessageForm(); foco('message')">
					    <div id="botonera">
						    <input id="message" type="text" name="message" autofocus>
						    <div id="buttons">
							    <input type="submit" value="Enviar">
							    <input type="reset"  value="Borrar">
						    </div>
					    </div>
		            </form> 
		        </div>
		        <div id="ban">
		            <form method="post" action="ban-unbanUser.jsp">
		                <h2> Ususario </h2>
		                <input type="text" name="nickname">
		                <div id="ban-buttons">
			                <input type="submit" name="ban" value="Ban">
			                <input type="submit" name="ban" value="Unban">
		                </div>
		            </form>
		            <div id="connected-users">
		            	<h2>Usuarios conectados</h2>
		            	<div id="user-list">
					    <%
			        		for (es.ubu.lsi.User u: server.getUsersConnected()){
			        			%>
			        			<span><%= u.getNick() %></span><br>
			        			<%
			        		}
		        		%>
		            	</div>
		            </div>
		        </div>
		    </div>
		</div>
        <form id="logout-button" action="logout.jsp" method="post">
			<input type="submit" name="logout" value="Logout">
        </form>
    </body>
</html>
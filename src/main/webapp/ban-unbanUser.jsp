<!-- TODO meter esta cabecera en un fichero común, e importarlo en todos los que se use. -->

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

<%
String nick = request.getParameter("nickname");
String action = request.getParameter("ban");

if(action.equals("ban")){
	server.banUser(user, nick);	
%>
<jsp:forward page="chatRoom.jsp">
	<jsp:param value="Usuario baneado." name="status"/>
</jsp:forward>
<%
} else if(action.equals("unban")){
	server.unbanUser(user, nick);
%>
<jsp:forward page="chatRoom.jsp">
	<jsp:param value="Usuario desbaneado." name="status"/>
</jsp:forward>
<%
}
%>


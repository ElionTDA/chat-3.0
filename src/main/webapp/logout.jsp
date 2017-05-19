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
server.removeUser(user);
user.setNick(null);
session.invalidate();
%>

<jsp:forward page="index.jsp">
	<jsp:param value="Has salido con exito." name="status"/>
</jsp:forward>
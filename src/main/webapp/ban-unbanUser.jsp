<!-- TODO meter esta cabecera en un fichero com�n, e importarlo en todos los que se use. -->
<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<!-- TODO Comprobar que no puedan acceder usuarios cualquiera sin registrar. -->

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


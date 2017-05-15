<!-- TODO meter esta cabecera en un fichero común, e importarlo en todos los que se use. -->
<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />
<jsp:useBean id="banned" class="es.ubu.lsi.User" scope="page" />

<!-- TODO Comprobar que no puedan acceder usuarios cualquiera sin registrar. -->

<%
String nick = request.getParameter("nickname");
banned.setNick(nick);

server.banUser(user, banned);

%>
<jsp:forward page="chatRoom.jsp">
	<jsp:param value="Usuario baneado." name="status"/>
</jsp:forward>
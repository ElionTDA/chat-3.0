<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<% 
// Comprobamos que el usuario este registrado. 
if(user.getNick() == null || user.getNick() == ""){
%>
	<jsp:forward page="index.jsp">
		<jsp:param value="Tienes que loguearte primero" name="status"/>
	</jsp:forward>
<%
}	
%>

<%
	
	// TODO comprobar status, para leer mensajes del sistema en caso de que los haya

	// Tratamos los mensajes.
	String m = request.getParameter("message");

	if(m != null){
		Message message = new Message(user, m);
		server.sendMensaje(message);
	}
%>
<jsp:forward page="chatRoom.jsp"></jsp:forward>

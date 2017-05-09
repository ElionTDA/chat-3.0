Vas a mandar un mensaje! SOPUTO!

<%@page import="es.ubu.lsi.Message"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<%
	// TODO comprobar el acceso a usuarios garantizados.
	
	// TODO comprobar status, para leer mensajes del sistema en caso de que los haya

	// Tratamos los mensajes.
	String m = request.getParameter("message");
	if(m != null){
		Message message = new Message(user, m);
		server.sendMensaje(message);
	}
	
%>
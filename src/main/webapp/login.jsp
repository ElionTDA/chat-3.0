
<%@page import="java.util.Locale.Category"%>
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />

<%
	// En el caso de que el usuario no sea nulo, y su nick ni sea nulo ni este vacio,
	// es que se trata de un usuario registrado, y un usuario registrado no puede entrar
	// al login. (Redirigir a ChatRoom).
	if(user != null && user.getNick().equals(null)){
		%>
		<jsp:forward page="chatRoom.jsp" />
		<%
	}
%>

<!-- Si un usuario no registrado intenta acceder directamente a login.jsp sin pasar por index.jsp
se le echa para atrás -->
<%! String nickname = ""; %>
<%
	
	try{
	nickname = request.getParameter("nickname");
	} catch(Exception e){
		System.out.println("PeneSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs");
	}
	System.out.println(nickname);
	//TODO comprobar que el tamaño sea minimo x, y que no haya espacios o caracteres raros.
	if(nickname.equals(null) || nickname.equals("")){
		
	}
%>
<jsp:setProperty name="user" property="nick" value="<%=request.getParameter("nickname")%>" />

El nombre de usuario es: <%= user.getNick() %>

<% 
	System.out.println(user.getNick());
	if(server.existUser(user)){
		System.out.println("El usuario existe.");
		session.removeAttribute("user");
		%>
		
		<jsp:forward page="index.jsp">
		 	<jsp:param value="El nombre de usuario existe." name="nickExist"/>
		</jsp:forward>
		
		<%
	} else {
		server.addUser(user);
		System.out.println("NO EXISTE.");
	}
%>
<br><br> 
<%=	server.toStringConnectedUsers() %> 

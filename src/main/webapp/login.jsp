
<jsp:useBean id="server" class="es.ubu.lsi.Server" scope="application" />
<jsp:useBean id="user" class="es.ubu.lsi.User" scope="session" />


<!-- Si un usuario no registrado intenta acceder directamente a login.jsp sin pasar por index.jsp
se le echa para atrás -->


<%	
	// Leemos el nick que se recibe del request.
	String nickname = request.getParameter("nickname");
	// Comprobamos que se haya introducido nick y no exista ya en la base.

	// TODO comprobar cosas como si el nick es null, esta vacio, o no tiene el sufiiciente tamaño.
	System.out.println(nickname);
	System.out.println(user.getNick());
	
	// Si el nick es nulo. Vemos si hay un usuario en session o no.
	if(nickname == null){
		// Si no hay un usuario en sesion
		if(user.getNick() == null){
			// Redirigimos a index.jsp, con Acceso no permitido.
			%>
			<jsp:forward page="index.jsp">
			 	<jsp:param value="Acceso no permitido." name="status"/>
			</jsp:forward>
			<%	
			
		// Si hay un usuario en sesion
		} else {
			// Redirigimos a chatRoom, con Ya estas logueado.
			%>
			<jsp:forward page="chatRoom.jsp">
			 	<jsp:param value="Ya estas logueado." name="status"/>
			</jsp:forward>
			<%	
		}
	// Si el nick no es nulo.
	} else{
		// Si el nick existe en el servidor (usuarios activos actualmente)
		if(server.existNick(nickname)){
			// Si coincide con el nick de usuario de sesion.
			if(user.getNick() == nickname){
				// Redirige a chatRoom, con Ya estas logueado.
				%>
				<jsp:forward page="chatRoom.jsp">
				 	<jsp:param value="Ya estas logueado." name="status"/>
				</jsp:forward>
				<%	
				
			// Si no coincide con el nick de usuario de sesion.
			} else {
				// Redirige a chatRoom, con Ya estas logueado con $nombreUsuario
				%>
				<jsp:forward page="chatRoom.jsp">
				 	<jsp:param value="Ya estas logueado con <%= user.getNick() %>." name="status"/>
				</jsp:forward>
				<%	
			}
			
		// Si el nick no existe en el servidor.
		} else {
			// Si el usuario de sesion ya tiene nick.
			if(user.getNick() == nickname){
				// Redirige a chatRoom, con Ya estas logueado con $nombreUsuario
				%>
				<jsp:forward page="chatRoom.jsp">
				 	<jsp:param value="Ya estas logueado con <%= user.getNick() %>." name="status"/>
				</jsp:forward>
				<%	
				
			// Si el usuario de sesion no tiene nick
			} else { 
				// Registramos al usuario, y redirige a chatRoom.
				%>
				<jsp:setProperty name="user" property="nick" value="<%=request.getParameter("nickname")%>" />
				<%
				server.addUser(user);
				%>
				<jsp:forward page="chatRoom.jsp">
				 	<jsp:param value="Login con exito." name="status"/>
				</jsp:forward>
				<%
			}
		}
	}	
%>

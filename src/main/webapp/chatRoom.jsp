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
            <form method="post" action="sendMensaje.jsp">
			    <textarea id="textarea" rows="10" cols="50" name="mensaje" ></textarea> <br>
			    <input type="text" name="message">
			    <input type="button" value="Enviar">
			    <input type="reset"  value="Borrar" > 
            </form> 
        </div>
        <div id="ban">
            <form method="post" action="ban-unbanUser.jsp">
                <br> Ususario <br>
                <input type="text" name="nickname">
                <input type="submit" name="ban" value="Bloquear">
                <input type="submit" name="ban" value="Desbloquear">
            </form>
        </div>
        <div>
            <br> Volver al inicio
        </div>
    </body>
</html>
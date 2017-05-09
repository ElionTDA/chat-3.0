<!DOCTYPE html>
<html>
    <head>
        <title>CHAT</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Sala de chat</h1>
        <form method="post" action="login.jsp">
        	<div>
				<textarea id="textarea" rows="5" cols="30" name="textarea" ></textarea>
				</div>
				<div>
				<input type="text" name="nickname">
				<input type="button" onclick="validacion()"  value="Enviar">
				<input type="reset"  value="Borrar" >
				</div> 
        </form> 
    </body>
</html>
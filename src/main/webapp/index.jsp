
<%=request.getParameter("nickExist") %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Login</h1>
        <form method="post" action="login.jsp">
        	<input type="text" name="nickname">
        	<input type="submit" name="enviar"> 
        	<input type="reset" name="borrar">   
        </form> 
    </body>
</html>
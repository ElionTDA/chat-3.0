
<%=request.getParameter("nickExist") %>

<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="login.jsp">
        	<input type="text" name="nickname">
        	<input type="submit" name="enviar"> 
        	<input type="reset" name="borrar">   
        </form> 
    </body>
</html>
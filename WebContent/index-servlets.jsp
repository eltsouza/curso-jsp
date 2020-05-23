<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Sistema</title>
<link rel="stylesheet" type="text/css" href="resources/css/estilo.css">
</head>
<body>
	<div class="login-page">
		<center><h1>Projeto Didático</h1></center><br/>
		<center><h2>Curso JSP, Servelt + JDBC</h2></center><br/>
		<div class="form">
			<h2>Acesso ao Sistema</h2>
			<form action="LoginServlet" method="post" class="login-form">
				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="password" id="senha" name="senha"> <br />
				<button type="submit" value="acessar" >Acessar</button>
			</form>
		</div>
		<center><h3>Formação Java Web - JDev Treinamento</h3></center>
	</div>
</body>
</html>
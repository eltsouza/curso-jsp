<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	   <title>Acesso liberado</title>
	   <link rel="stylesheet" type="text/css"  href="resources/css/acesso.css"/>	   
	</head>
	<body>
      <a href="index-servlets.jsp"><img src="resources/img/logout.png" align="left" title="Logout" width="40px" height="40px"></a>
      <center style="padding-top: 10%;">
      <h2>Seja bem vindo ao sistema</h2>
      <br><br><br>
      <table>
      	<tr>
      	  <td><a href="salvarUsuario?acao=listartodos"><img src="resources/img/usuario.png" alt="Cadastrar Usuário" hspace="40" Vspace="30" title="Cadastrar Usuário" width="100px" height="100px"></a></td>
      	  <td><a href="salvarProduto?acao=listartodos"><img src="resources/img/produto.png" alt="Cadastrar Produtos" hspace="40" Vspace="30" title="Cadastrar Produtos" width="100px" height="100px"></a></td>
      	</tr>
      </table>
    </center>
	<p>Sistema de cadastro com: JavaEE + JDBC + JSP + PostgreSQL</p>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
    <p>Sistema desenvolvido - Souza Consultoria TI</p>
  </body>
</html>
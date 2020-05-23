<!-- Declarando o metodo Bean -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"> </jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Metodo Bean</title>
</head>
<body>
  
    <!-- Executando o metodo Bean --> 
    
    <h2>Executando o metodo Bean dentro de um Form</h2>   
    
    <form action="cabecalho-bean.jsp" method="post">
    
      <input type="text" id="nome" name="nome" value="elton">
      <br/>
      <input type="text" id="ano"  name="ano"  value=2019>
      <br/>
      <input type="text" id="sexo" name="sexo" value="M">
      <br/>
      <input type="submit" value="testar"/> 
    
    
    </form>
 

</body>
</html>
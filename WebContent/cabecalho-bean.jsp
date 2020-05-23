<!-- Declarando o metodo Bean -->
<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"> </jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabeçalho bean</title>
</head>
  <body>
    <!-- Setando o bean para recuperar todas as propriedades de getters and setters -->
    <jsp:setProperty property="*" name="calcula"/> 
    
    <h3>Cabeçalho Beans</h3>
    
      <jsp:getProperty property="nome" name="calcula"/> 
      <br/>
      <jsp:getProperty property="ano"  name="calcula"/> 
      <br/>
      <jsp:getProperty property="sexo" name="calcula"/>       
      <br/>
    
    
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expression Language</title>
</head>
<body>
  
    <!-- Expression Language JSP --> 
    
    <h2>Expression Language JSP</h2>   
    
    <form action="cabecalho-expression-language.jsp" method="post">
    
      <%session.setAttribute("user", "javaavancado"); %>
    
      <input type="text" id="nome" name="nome" value="elton">
      <br/>
      <input type="text" id="ano"  name="ano"  value=2019>
      <br/>
      <input type="submit" value="testar"/> 
    
    
    </form>
</body>
</html>
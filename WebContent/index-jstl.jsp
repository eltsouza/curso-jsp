<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index JSTL</title>
</head>
<body>
   <!-- Para trabalhar com JSTL é preciso declarar na pagina JSP -->
   <!-- É preciso também importar a LIB de JSTL para dentro do projeto -->
   
    <c:out value="${'Bem vindo ao JSTL'}"/>
    <c:set var="data" scope="page" value="${500*67}"/>
    <c:remove var="data"/>
    <c:out value="${data}"/>
   
    <c:catch var="error">
      <%=100/2 %>
    </c:catch>
    
    <c:if test="${error != null}">
      ${error.message}
    </c:if>
    
    <c:set var="numero" value="${1000/2}"/>
    
    <c:forEach var="n" begin="1" end="${numero}">
      <br/>
       Item : ${n};    
    </c:forEach>
    
    <c:forTokens items="Elton-Jose-Souza" delims="-" var="nome">
       <br/>
       Nome quebrado : <c:out value="${nome}"></c:out>
    </c:forTokens>

    <br/>
    <br/>
    URL:
    <c:url value="/acesso-liberado-servlets.jsp" var="acesso">
      <c:param name="param1" value="123"/>
      <c:param name="param2" value="456"/>
    </c:url>
     ${acesso}
     
    <c:if test="${numero >= 50 }">       
       <c:redirect url="http://www.uol.com.br"></c:redirect>
    </c:if>
    
    <c:if test="${numero < 50 }">       
       <c:redirect url="http://www.globo.com"></c:redirect>
    </c:if>
   
    

    <br/>
    <br/>
    <c:choose>
	  <c:when test="${numero >= 50 }">
	    <c:out value="${'Maior ou igual que 50'}"/>
	  </c:when>
	  
	  <c:when test="${numero < 50 }">
	    <c:out value="${'Menor que 50'}"/>
	  </c:when>

	 </c:choose> 

   
   <p/>
   <p/>
   <p/>
   <p/>
   
</body>
</html>
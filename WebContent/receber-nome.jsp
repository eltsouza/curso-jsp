<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receber Nome por parâmetro</title>
</head>
<body>

 <!--Tag Expressao e sem precisa utilizar java puro na pagina jsp-->
<%="Nome recebido por tag de expressão: " + request.getParameter("nome")

%>
<br/>
<% 
    String nome = "Nome recebido: " + request.getParameter("nome");
   out.print(nome); 
%>
<!-- Objeto implicito request que faz parte do HTTP Servelt request -->
<br/>
<%="Objeto implicito request.getContextPath..:" + request.getContextPath()%>
<br/>
<%="Objeto implicito request.getContentTyp3..:" + request.getContentType()%>
<br/>
<%="Objeto implicito request.getLocalAdd..:" + request.getLocalAddr()%>
<br/>
<%="Objeto implicito request.getLocalName..:" + request.getLocalName()%>
<br/>
<%="Objeto implicito request.getLocalPo..:" + request.getLocalPort()%>
<br/>
<%="Objeto implicito request.getProtocol..:" + request.getProtocol()%>
<br/>
<%="Objeto implicito request.getRemoteHost..:" + request.getRemoteHost()%>
<br/>
<%="Objeto implicito request.getRequestedSessionId..:" + request.getRequestedSessionId()%>

<br/>
<br/>
<!-- Objeto implicito response que faz parte do HTTP Servelt response que da uma resposta a requisição -->
<%//response.sendRedirect("");%>


<!--Resgatando o valor do Objeto implicito Session -->
<%="Objeto implicito de sessão.:" + session.getAttribute("curso")  %>

<!--Resgatando o erro da directivas -->
<%@ page isErrorPage="true" %>
<%= exception %>

<!-- Usando o Include no JSP para incluir uma pagina dentro de outra -->
<%@ include file="pagina-include.jsp"%>

<!-- Recebendo o paramentro do paramforward -->
<%=request.getParameter("paramforward") %>

</body>
</html>
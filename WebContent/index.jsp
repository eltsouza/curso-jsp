<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- Declarando a Tag customizada -->    
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aprendendo JSP</title>
</head>
<body>
    <h1>Bem vindo ao curso de JSP</h1>

    <!--Tag Expressao com simbolo de igual para imprimir na tela-->   
    <%="Tag Expressao com simbolo de igual"%>

    <!--Tag para imprimir na tela-->   
    <%out.print("Aprendendo JSP. Sucesso garantido"); %>
     
    <form action="receber-nome.jsp">
      <input type="text" id="nome" name="nome">
      <input type="submit" value="Enviar"></input>
    </form>
   
     <!--Usando Tag declarativa-->    
     <%! int cont = 6;    
     
        public int retorna(int n){
        	return n * 3;
        }
     
     %>
     <!-- Quebra de linha -->
     <br>
     <%="Valor fixo variável é..:" + cont %>
     <br> 
     <%="O retorno do calculo é.:" + retorna(10)%>  
    
     <br> 
     <%="Objeto implicito declarado no web.xml.:" + application.getInitParameter("estado") %>  

      <!--Objeto implicio Session. Usado para controlar dados do usario, sessão etc--> 
      
      <%session.setAttribute("curso", "curso de jsp objeto implicito de sessao"); %>
        
      <!--Directivas do JSP que são usadas para mostrar como servidor vai interpletar a pagina servelt--> 
      <br>
      <br/>
      <%@ page import="java.util.Date" %> 
      
      <%="data de hoje.:" + new Date() %> 
      
      <%@ page info="Exemplo de directvas do JSP" %>
      
      <%@ page errorPage="receber-nome.jsp" %>
      <br/>
      <br/>
      <%= 100/2 %> <!-- Vai gerar um erro -->
      
      <!-- Usando o Include no JSP para incluir uma pagina dentro de outra -->
      <%@ include file="pagina-include.jsp"%>
        
       <!-- Chamando a tag customziada -->
       <myprefix:MinhaTag/>
       
      <!-- Usando a  Tag Forward -->
      <jsp:forward page="receber-nome.jsp">
        <jsp:param value="curso de jsp site java avancado" name="paramforward"/>
      </jsp:forward>
       
      <!-- Tag JSP do include usada para paginas dinâmicas, estáticas e para recursos do Servelet -->  
      <jsp:include page="cabecalho.jsp"></jsp:include>  
        <h2>Corpo da pagina</h2>
      <jsp:include page="rodape.jsp"></jsp:include>  
        <h2>Rodape da pagina</h2>
        
</body>
</html>
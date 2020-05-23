<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Cadastro Usuários</title>
  <link rel="stylesheet" type="text/css" href="resources/css/cadastro.css">
  
  <!-- Adicionando JQuery -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
          integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
          crossorigin="anonymous"></script>  
</head>
<body>
  <a href="acesso-liberado-servlets.jsp"><img src="resources/img/home.png" alt="Inicio" title="Inicio" width="40px" height="40px"></a>
  <a href="index-servlets.jsp"><img src="resources/img/logout.png" alt="Logout" title="Logout" width="40px" height="40px"></a>
  <form action="salvarTelefones" method="post" id="formUser" onsubmit="return validarCampos() ? true : false">
    <ul class="form-style-1">
	  <li>
	    <h1>Cadastro de telefones</h1>
	    <h3 style="color: red">${msg}</h3>
	    <table> 
		  <tr>
		    <td>Id:</td>
			<td><input type="text" id="id" name="id" readonly="readonly" class="field-long" value="${userEscolhido.id}"></td>
		  </tr>
		  <tr>
		    <td>Usuário:</td>
			<td><input type="text" id="usuario" name="usuario" readonly="readonly" class="field-long" value="${userEscolhido.nome}"></td>
		  </tr>
		  <tr>
		    <td>Número:</td>
			<td><input type="text" id="numero" name="numero" class="field-long" placeholder="Informe o telefone"></td>
		    <td> 
   		      <select id = "tipo" name="tipo">
                <option>Casa</option>
                <option>Contato</option>
                <option>Celular</option>
                <option>Trabalho</option>
              </select>
		    </td>
		  </tr>
          <tr>
		    <td></td>
		    <td><input type="submit" value="Salvar"> 
		        <input type="submit" value="Voltar" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">
		    </td>
		  </tr>
		</table>
	  </li>
	</ul>
  </form>
  <div class="container">
    <table class="responsive-table">
	  <caption>Lista de Telefones cadastrados</caption>
	  <tr>
		<th>Id</th>
		<th>Número</th>
		<th>Tipo</th>
		<th>Exluir</th>
	  </tr>
	  <!--  -->
	  <c:forEach items="${telefones}" var="fone">
   	    <tr>
	      <td style="width: 100px"><c:out value="${fone.id}"></c:out></td>
	      <td style="width: 200px"><c:out value="${fone.numero}"></c:out></td>
	      <td style="width: 200px"><c:out value="${fone.tipo}"></c:out></td>
    	  <td><a href="salvarTelefones?acao=deleteFone&foneId=${fone.id}" onclick="return confirm('Confirmar a exclusão?');"><img src="resources/img/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
  	    </tr>
	   </c:forEach>
      </table>
    </div>
    <script type="text/javascript">
    	function validarCampos() {	
    		if (document.getElementById("telefone").value ==''){
    			alert('Campo telefone está vazio.');
    			return false;
    		}
    		if (document.getElementById("tipo").value ==''){
    			alert('Campo tipo está vazio.');
    			return false;
    		}
    		return true;
    </script>    		
  </body>
</html>
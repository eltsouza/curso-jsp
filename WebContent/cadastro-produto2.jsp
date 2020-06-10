<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cadastro de Produtos</title>
	<script src="resources/javascript/jquery.min.js" type="text/javascript"></script>
    <script src="resources/javascript/jquery.maskMoney.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/cadastro.css">	
  </head>
  	
  <body>
  
    <a href="acesso-liberado-servlets.jsp"><img src="resources/img/home.png" alt="Inicio" title="Inicio" width="40px" height="40px"></a>
    <a href="index-servlets.jsp"><img src="resources/img/logout.png" alt="Logout" title="Logout" width="40px" height="40px"></a>
    <!-- Formulario para cadastrar as informações dos produtos -->
    <form action="salvarProduto" method="post" id="formProduto" onsubmit="return validarCampos() ? true : false">
	  <ul class="form-style-1">
	    <li>
  	      <h1>Cadastro de Produtos</h1>
   	      <h3 style="color: red">${msg}</h3>
	      <table>
		   	<tr>
			  <td>Código:</td>
			  <td><input type="text" readonly="readonly" name="codigo" class="field-long" value="${produto.codigo}"></td>
			</tr>
            <tr>
			  <td>Produto:</td>
			  <td><input type="text" id="nome" name="nome"class="field-long" value="${produto.nome}"></td>
		    </tr>
            <tr>
              <td>Quantidade:</td>
              <td><input type="text" id="quantidade" name="quantidade" maxlength="7" class="field-long" value="${produto.quantidade}"></td>
            </tr>
  		    <tr>
				<td>Valor R$:</td>
				<td><input type="text" id="valor" name="valor" data-thousands="." data-decimal="," data-precision="2" 
							value="${produto.valorEmTexto}" maxlength="20"></td>
				<tr>
			<tr>
			<tr>
		       <td>Categoria:</td>
		       <td>
		         <select id="categorias" name="categoria_id" style="width: 175px;height: 30px;">
		         
		         	<c:forEach items="${categorias}" var="cat">
		            	<option value="${cat.id}" id="${cat.id}"
		            		<c:if test="${cat.id == produto.categoria_id }">
		            			<c:out value = "selected=selected"/>
		            		</c:if>            	
		            	>
		            	${cat.nome}
		         	</c:forEach>
		         </select>
		       </td>
			</tr>

  		      <td></td>
			  <td>
  		        <input type="submit" value="Salvar"> 
			    <input type="submit" value="Cancelar" onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'">
			  </td>
			</tr>
	      </table>
	    </li>
	  </ul>
	</form>
	
	<!-- Div para mostrar a tabela com as informações dos produtos -->
	<div class="container">
	  <table class="responsive-table">
	    <caption>Lista de Produtos cadastrados</caption>
	    <tr>
	      <th>Código</th>
	      <th>Produto</th>
	      <th>Quantidade</th>
	      <th>Valor</th>
	      <th>Excluir</th>
	      <th>Editar</th>
	    </tr>
	    <!--  -->
	    <!-- Loop pra listar os produtos cadastrados na tela -->
	    <c:forEach items="${produtos}" var="produto">
	      <tr>
		    <td style="width: 100px"><c:out value="${produto.codigo}"></c:out></td>
			<td style="width: 450px"><c:out value="${produto.nome}"></c:out></td>
			<td><fmt:formatNumber type="number" maxFractionDigits="1" value="${produto.quantidade}" /></td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${produto.valor}" /></td>
		    <!--  -->
			<td><a href="salvarProduto?acao=delete&produto=${produto.codigo}" onclick="return confirm('Confirmar a exclusão?');"><img src="resources/img/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
			<td><a href="salvarProduto?acao=editar&produto=${produto.codigo}"><img src="resources/img/editar.png" alt="Alterar" title="Editar" width="20px" height="20px"></a></td>
		  </tr>
	    </c:forEach>
	  </table>
	</div>
	<script type="text/javascript">
    	function validarCampos() {	
    		if (document.getElementById("nome").value ==''){
    			alert('Campo nome está vazio.');
    			return false;
    		}
    		else
    		if (document.getElementById("quantidade").value ==''){
    			alert('Campo quantidade está vazio.');
    			return false;
    		}
    		else
    		if (document.getElementById("valor").value ==''){
    			alert('Campo valor está vazio.');
    			return false;
    		}else
    		return true; 
    }
    </script>
  </body>
  <script type="text/javascript">
  	 $(function() {
	    $('#valor').maskMoney();
	 });
	 
	 
	 $(document).ready(function() {
	  $("#quantidade").keyup(function() {
	      $("#quantidade").val(this.value.match(/[0-9]*/));
	  });
	});
   </script>
</html>
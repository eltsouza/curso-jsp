<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Cadastro Usuários</title>
  <style type="text/css">
    #divCenter { 
				align-content: center;
				height: 20%;
				width: 111%; }
  </style>  
  <link rel="stylesheet" type="text/css" href="resources/css/cadastro_OLD.css">
  
  <!-- Adicionando JQuery -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
          integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
          crossorigin="anonymous"></script>  
</head>
<body>
  <a href="acesso-liberado-servlets.jsp"><img src="resources/img/home.png" alt="Inicio" title="Inicio" width="40px" height="40px"></a>
  <a href="index-servlets.jsp"><img src="resources/img/logout.png" alt="Logout" title="Logout" width="40px" height="40px"></a>
  <form action="salvarUsuario" method="post" id="formUser" onsubmit="return validarCampos() ? true : false"  enctype="multipart/form-data" >
    <ul class="form-style-1">
	  <li>
	    <h1><center>Cadastro de usuários</center></h1>
	    <h3 style="color: red">${msg}</h3>
	    <table>
		  <tr>
		    <td>Codigo:</td>
			<td><input type="text" readonly="readonly" name="id" class="field-long" value="${user.id}"></td>
			<td>Cep:</td>
			<td><input type="text" id="cep" name="cep" onblur="consultaCep();" value="${user.cep}" placeholder="Informe o cep"></td>			
		  </tr>
  		  <tr>
		    <td>Login:</td>
			<td><input type="text" id="login" name="login" class="field-long" value="${user.login}" placeholder="Informe o login" maxlength="10"></td>
			<td>Rua:</td>
			<td><input type="text" id="rua" name="rua" readonly="readonly" value="${user.rua}"></td>
		  </tr>
  	      <tr>
		    <td>Senha:</td>
			<td><input type="password" id="senha" name="senha" class="field-long" value="${user.senha}" placeholder="Informe a senha"></td>
		    <td>Bairro:</td>
			<td><input type="text" id="bairro" name="bairro" readonly="readonly" value="${user.bairro}"></td>
		  </tr>
          <tr>
		    <td>Nome:</td>
			<td><input type="text" id="nome" name="nome" class="field-long" value="${user.nome}" placeholder="Informe o nome"></td>
		    <td>Cidade:</td>
			<td><input type="text" id="cidade" name="cidade" readonly="readonly" value="${user.cidade}"></td>
		  </tr>
          <tr>
		    <td>UF:</td>
			<td><input type="text" id="estado" name="estado" readonly="readonly" value="${user.estado}"></td>
			<td>IBGE:</td>
			<td><input type="text" id="ibge" name="ibge" readonly="readonly" value="${user.ibge}"></td>
		  </tr>
		  <td>Ativo:</td>
		  <td><input type="checkbox" id="ativo" name="ativo"  required=true
		  <% 
			if (request.getAttribute("user") != null) {
				BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				if (user.isAtivo()){
					out.print(" ");
					out.print("checked=\"checked\"");
					out.print(" ");
				}
			}						 
		  %>
		 >
		 </td>
		 <td>Sexo:</td>
		 <td>
		 	<input type="radio" name="sexo" required=true
						 
			<% 
				if (request.getAttribute("user") != null){
  			    	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
					if (user.getSexo().equalsIgnoreCase("masculino")){
						out.print(" ");
						out.print("checked=\"checked\"");
						out.print(" ");
					}
				}
			%>
						 
			value="masculino">Masculino</input>
						  
			<input type="radio" name="sexo" 
			<% 
				if (request.getAttribute("user") != null){
				   BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
				   if (user.getSexo().equalsIgnoreCase("feminino")){
					  out.print(" ");
					  out.print("checked=\"checked\"");
					  out.print(" ");
				   }
			   }
			%>
   		    value="feminino">Feminino</input>						 
		  </td>	
          <tr>
		  	<td>Foto:</td>
		  	<td>
		  	  <input type="file" name="foto">
    		  <td>Perfil:</td>
			   <td>
				  <select id="perfil" required name="perfil" style="width: 175px;height: 30px;">
				 	<option value="nao_informado">[--SELECIONE--] </option>
						 	
				 	<option value="admistrador"
					<% 
						if (request.getAttribute("user") != null) {
									
							BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
							if (user.getPerfil().equalsIgnoreCase("admistrador")){
								out.print(" ");
								out.print("selected=\"selected\"");
								out.print(" ");
							}
						}						 
					%>
					>Administrador</option >
							 	
					<option value="secretario"   
					<% 
						if (request.getAttribute("user") != null) {
									
							BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
							if (user.getPerfil().equalsIgnoreCase("secretario")){
								out.print(" ");
								out.print("selected=\"selected\"");
								out.print(" ");
							}
						}						 
					%>
					>Secretário(a)</option >
							 	
					<option value="gerente"  
					<% 
						if (request.getAttribute("user") != null) {
									
							BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
							if (user.getPerfil().equalsIgnoreCase("gerente")){
								out.print(" ");
								out.print("selected=\"selected\"");
								out.print(" ");
							}
						}						 
					%>
							 	
					>Gerente</option >
						 	
					<option value="funcionario" 
					<% 
						if (request.getAttribute("user") != null) {
									
							BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
							if (user.getPerfil().equalsIgnoreCase("funcionario")){
								out.print(" ");
								out.print("selected=\"selected\"");
								out.print(" ");
							}
						}						 
				    %>
							 	
					>Funcionário</option >
			     </select>						 
				</td>		  
		  	</td>		  
		  </tr>
		  <tr>
		  	<td>Currículo:</td>
		  	<td><input type="file" name="curriculo"></td>		  
	    <!--<input type="text" style="display: none;" name="curriculoTemp" readonly="readonly" value="${user.curriculobase64}"/>
		  	<input type="text" style="display: none;" name="contentTypeCurriculoTemp" readonly="readonly" value="${user.contenttypecurriculo}"/>-->
		  </tr>		  
      	  <tr>
		    <td></td>
		    <td><input type="submit" value="Salvar"> <input type="submit" value="Cancelar" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
		  </tr>
		</table>
	  </li>
	</ul>
  </form>
  <div class="divCenter" id="divCenter">
	  <form method="post" action="servletPesquisa" style="width: 90%" text-align: center;>
		<ul class="form-style-1">
				<li>
					<table>
					  <tr>
					   <td>Descrição</td>
					   <td><input type="text"  id="descricaoconsulta" name="descricaoconsulta"></td>
					   <td><input type="submit" value="Pesquisar"></td>
					  </tr>
					</table>
			   </li>
			</ul>
	  </form>	 
  </div> 
  <div class="container">
    <table class="responsive-table">
	  <caption>Lista de Usuarios cadastrados</caption>
	  <tr>
		<th>Código</th>
		<th>Login</th>
		<th>Foto</th>
		<th>Documento</th>
		<th>Nome</th>
		<th>Cep</th>
		<th>Rua</th>
		<th>Cidade</th>
		<th>Bairro</th>
		<th>Uf</th>
		<th>Ibge</th>
		<th>Exluir</th>
		<th>Editar</th>
		<th>Fones</th>
	  </tr>
	  <!--  -->
	  <c:forEach items="${usuarios}" var="user">
   	    <tr>
	      <td style="width: 50px"><c:out value="${user.id}"></c:out></td>
		  <td style="width: 50px"><c:out value="${user.login}"></c:out></td>
		  <c:if test="${user.fotobase64miniatura.isEmpty() == false}">
		  
			  <td>
				<a href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}">
				   <img src='<c:out value="${user.fotobase64miniatura}"/>' alt="Imagem User" title="Imagem User" width="32px" height="32px">
				</a>
			  </td>
		  </c:if>	
		  <c:if test="${user.fotobase64miniatura == null}">
			  <td><img alt="Imagem User" src="resources/img/userpadrao.png" width="32px" height="32px" onclick="alert('Não possui imagem')"> </td>
		  </c:if>
		  <c:if test="${user.curriculobase64.isEmpty() == false}">	
			  <td><a href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img alt="Curriculo" src="resources/img/pdf.png" width="32px" height="32px"></a></td>
		  </c:if>
		  <c:if test="${user.curriculobase64 == null}">
			 <td><img alt="Curriculo" src="resources/img/pdfNotFound.png" width="32px" height="32px" onclick="alert('Não possui curriculo')"></td>
		  </c:if>
		  <td><c:out value="${user.nome}"></c:out></td>
		  <td><c:out value="${user.cep}"></c:out></td>
		  <td><c:out value="${user.rua}"></c:out></td>
		  <td><c:out value="${user.bairro}"></c:out></td>
		  <td><c:out value="${user.cidade}"></c:out></td>
		  <td><c:out value="${user.estado}"></c:out></td>
		  <td><c:out value="${user.ibge}"></c:out></td>
		  <td><a href="salvarUsuario?acao=delete&user=${user.id}" onclick="return confirm('Confirmar a exclusão?');"><img src="resources/img/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
		  <td><a href="salvarUsuario?acao=editar&user=${user.id}"><img src="resources/img/editar.png" alt="Alterar" title="Editar" width="20px" height="20px"></a></td>
		  <td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img src="resources/img/telefone.png" alt="Telefones" title="Telefones" width="20px" height="20px"></a></td>
  	    </tr>
	   </c:forEach>
      </table>
    </div>
    <script type="text/javascript">
    	function validarCampos() {	
    		if (document.getElementById("login").value ==''){
    			alert('Campo login está vazio.');
    			return false;
    		}
    		else
    		if (document.getElementById("senha").value ==''){
    			alert('Campo senha está vazio.');
    			return false;
    		}
    		else
    		if (document.getElementById("nome").value ==''){
    			alert('Campo nome está vazio.');
    			return false;
    		}
    		else
    		if (document.getElementById("fone").value ==''){
    			alert('Campo telefone está vazio.');
    			return false;
    		}else
    		return true; 
    }
    
    function consultaCep(){
    	var cep = $("#cep").val();
    
        //Consulta o webservice viacep.com.br/
        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
        
        //alert(dados.logradouro);	
        	
        if (!("erro" in dados)) {
        	//Atualiza os campos com os valores da consulta.
            $("#rua").val(dados.logradouro);
            $("#bairro").val(dados.bairro);
            $("#cidade").val(dados.localidade);
            $("#estado").val(dados.uf);
            $("#ibge").val(dados.ibge);
        } //end if.
        else {
          //CEP pesquisado não foi encontrado.
          alert("CEP não encontrado.");
          $("#rua").val('');
          $("#bairro").val('');
          $("#cidade").val('');
          $("#uf").val('');
          $("#ibge").val('');          
       }
     });
   }
    	
    </script>
    
    
  </body>
</html>
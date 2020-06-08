<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!--===============================================================================================-->	
	  <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
	  <!--===============================================================================================-->
	  <link rel="stylesheet" type="text/css" href="resources/css/utilTable.css">
	  <link rel="stylesheet" type="text/css" href="resources/css/mainTable.css">
	  <!--===============================================================================================-->	  
	  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
		
	  <title>Cadastro Usuários</title>
	  
	  <link rel="stylesheet" type="text/css" href="resources/css/usuario.css">
	 
	  <!-- Adicionando JQuery -->
	  <script src="https://code.jquery.com/jquery-3.4.1.min.js"
	          integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	          crossorigin="anonymous"></script>  
	</head>
	<body>
	  <a href="acesso-liberado-servlets.jsp"><img src="resources/img/home.png" alt="Inicio" title="Inicio" width="40px" height="40px"></a>
	  <a href="index-servlets.jsp"><img src="resources/img/logout.png" alt="Logout" title="Logout" width="40px" height="40px"></a>
		<!--header-->
		<div class="agile-header"></div>
		<!--//header-->
		<!--main-->
		<div class="agileits-main">
			<div class="wrap">
				<form action="salvarUsuario" method="post" id="formUser" onsubmit="return validarCampos() ? true : false"  enctype="multipart/form-data" >
		            <h1><center>Cadastro de usuários</center></h1>
		            <br><br>
			        <center><h3 style="color: red">${msg}</h3></center>
		            <br><br>
					<ul>
						<li class="text">Código  :</li>
						<li><input type="text" readonly="readonly" name="id" class="field-long" placeholder="Código gerado automaticamente" value="${user.id}"></li>
					</ul>
					<ul>
						<li class="text">Nome  :  </li>
						<li><input type="text" id="nome" name="nome" class="field-long" value="${user.nome}" placeholder="Informe o nome"></li>
					</ul>
					<ul>
						<li class="text">Login  :  </li>
						<li><input type="text" id="login" name="login" class="field-long" value="${user.login}" placeholder="Informe o login" maxlength="10"></li>
			   		    <li class="password">Senha  :  </li>
						<li><input type="password" id="senha" name="senha" class="field-long" value="${user.senha}" placeholder="Informe a senha"></li>
					</ul>
					<ul>
						<li class="text">Cep  :  </li>
						<li><input type="text" id="cep" name="cep" onblur="consultaCep();" value="${user.cep}" placeholder="Informe o cep"></li>
					</ul>
					<ul>
						<li class="text">Rua:  </li>
						<li><input type="text" id="rua" name="rua" readonly="readonly" value="${user.rua}"></li>
					</ul>
					<ul>
						<li class="text">Bairro  :  </li>
						<li><input type="text" id="bairro" name="bairro" readonly="readonly" value="${user.bairro}"></li>
					</ul>
					<ul>
						<li class="text">Cidade  :  </li>
						<li><input type="text" id="cidade" name="cidade" readonly="readonly" value="${user.cidade}"></li>
					</ul>
					<ul>
						<li class="text">UF  :  </li>
						<li><input type="text" id="estado" name="estado" readonly="readonly" value="${user.estado}"></li>
					</ul>
					<ul>
						<li class="text">IBGE  :  </li>
						<li><input type="text" id="ibge" name="ibge" readonly="readonly" value="${user.ibge}"></li>
					</ul>
					<ul>
						<li class="checkbox">Ativo  :  </li>
						<li><input type="checkbox" id="ativo" name="ativo"  required=true
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
						</li>
					</ul>
					<ul>
						<li class="radio">Sexo  :  </li>
						<li><input type="radio" name="sexo" required=true						 
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
						</li>
					</ul>
					<ul>
						<li class="arquivo">Foto  : </li>
						<li><input type="file" name="foto"></li>
					</ul>
					<ul>
						<li class="arquivo">Currículo  : </li>
						<li><input type="file" name="curriculo"></li>
					</ul>
					<ul>
						<li class="select">Perfil  : </li>
						<li> <select id="perfil" required name="perfil" style="width: 100px;height: 20px;">
						  	 <option value="nao_informado">[--Selecione--] </option>					 	 	
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
						</li>
					</ul>
				    <div class="clear"></div>
					<div class="agile-submit">
						<input type="submit" value="Salvar"> 
						<input type="submit" value="Cancelar" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">
					</div>
				</form>
			</div>	
		</div>
		<!--//main-->
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
	  <form method="post" action="servletPesquisa">
	  	<table>
		  <thead>
			  <tr>
				<td style="color: white;">Descrição</td>
				<td><input type="text" id="descricaoconsulta" name="descricaoconsulta"></td>
				<td><input type="submit" value="Pesquisar"></td>
			  </tr>
		   </thead>	
		</table>
	  </form>	 
	  <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
		                    <tr class="table100-head">
		                       <th class="column1">Código</th>
		                       <th class="column2">Login</th>
		                       <th class="column3">Foto</th>
		                       <th class="column4">Documento</th>
		                       <th class="column5">Nome</th>
		                       <th class="column6">Cep</th>
		                       <th class="column6">Rua</th>
		                       <th class="column6">Bairro</th>
		                       <th class="column6">Cidade</th>
		                   <!--<th>Uf</th>
		                       <th>Ibge</th> -->
		                       <th class="column6">Exluir</th>
		                       <th class="column6">Editar</th>
		                       <th class="column6">Fones</th>
		                    </tr>
		                </thead>
						<tbody>
							<c:forEach items="${usuarios}" var="user">
								<tr>
									<td class="column1" style="width: 50px"><c:out value="${user.id}"></c:out></td>
									<td class="column2" style="width: 50px"><c:out value="${user.login}"></c:out></td>
									<c:if test="${user.fotobase64miniatura.isEmpty() == false}">
										<td class="column3">
											<a href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}">
												<img src='<c:out value="${user.fotobase64miniatura}"/>' alt="Imagem User" title="Imagem User" width="32px" height="32px">
											</a>
										</td>
									</c:if>
			                        <c:if test="${user.fotobase64miniatura == null}">
										<td class="column3"><img alt="Imagem User" src="resources/img/userpadrao.png" width="32px" height="32px" onclick="alert('Não possui imagem')"> </td>
			                        </c:if>									
									<c:if test="${user.curriculobase64.isEmpty() == false}">	
										<td class="column4"><a href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img alt="Curriculo" src="resources/img/pdf.png" width="32px" height="32px"></a></td>
			                        </c:if>		
			                        <c:if test="${user.curriculobase64 == null}">
										<td class="column4"><img alt="Curriculo" src="resources/img/pdfNotFound.png" width="32px" height="32px" onclick="alert('Não possui curriculo')"></td>
			                        </c:if>
									<td class="column5"><c:out value="${user.nome}"></c:out></td>
				                    <td class="column6"><c:out value="${user.cep}"></c:out></td>
			                        <td class="column6"><c:out value="${user.rua}"></c:out></td>
			                        <td class="column6"><c:out value="${user.bairro}"></c:out></td>
			                        <td class="column6"><c:out value="${user.cidade} - ${user.estado}"></c:out></td>
			                    <!--<td class="column6"><c:out value="${user.estado}"></c:out></td>
			                        <td class="column6"><c:out value="${user.ibge}"></c:out></td> -->
			                        <td><a href="salvarUsuario?acao=delete&user=${user.id}" onclick="return confirm('Confirmar a exclusão?');"><img src="resources/img/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
			                        <td><a href="salvarUsuario?acao=editar&user=${user.id}"><img src="resources/img/editar.png" alt="Alterar" title="Editar" width="20px" height="20px"></a></td>
			                        <td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img src="resources/img/telefone.png" alt="Telefones" title="Telefones" width="20px" height="20px"></a></td>
								</tr>
	  					    </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
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
	   <!--===============================================================================================-->	
	   <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	   <!--===============================================================================================-->
	   <script src="resources/vendor/bootstrap/js/popper.js"></script>
	   <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	   <!--===============================================================================================-->
	   <script src="resources/vendor/select2/select2.min.js"></script>
	   <!--===============================================================================================-->
	   <script src="resources/js/main.js"></script>
  	</body>
</html>
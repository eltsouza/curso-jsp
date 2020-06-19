<%@page import="beans.BeanCliente"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1">
	    <title>Cadastro Clientes</title>
	    <!-- Custom Stylesheet -->
	    <link href="resources/css/style.css" rel="stylesheet">
	
	</head>
	<body>
	    <!--**********************************
	        Main wrapper start
	    ***********************************-->
	    <div id="main-wrapper">
	
	        <!--**********************************
	            Nav header start
	        ***********************************-->
	        <div class="nav-header">
	            <div class="brand-logo">
	                <a href="acesso-liberado-servlets.jsp">
	                    <b class="logo-abbr"><img src="#" alt=""> </b>
	                    <span class="logo-compact"><img src="#" alt=""></span>
	                    <span class="brand-title">
	                        <img src="resources/images/index.png" alt="">
	                    </span>
	                </a>
	            </div>
	        </div>
	        <!--**********************************
	            Nav header end
	        ***********************************-->
	
	        <!--**********************************
	            Header start
	        ***********************************-->
	        <div class="header">    
	            <div class="header-content clearfix">
	                
	                <div class="nav-control">
	                    <div class="hamburger">
	                        <span class="toggle-icon"><i class="icon-menu"></i></span>
	                    </div>
	                </div>
	                <div class="header-right">
	                    <ul class="clearfix">
	                        <li class="icons dropdown">
	                            <div class="user-img c-pointer position-relative" data-toggle="dropdown">
	                                <span class="activity active"></span>
	                                <img src="resources/images/user/perfil.jpg" height="40" width="40" alt="">
	                            </div>
	                            <div class="drop-down dropdown-profile   dropdown-menu">
	                                <div class="dropdown-content-body">
	                                    <ul>
	                                        <li>
	                                            <a href="#"><i class="icon-user"></i> <span>Profile</span></a>
	                                        </li>
	                                        <hr class="my-2">
	                                        <li><a href="index-servlets.jsp"><i class="icon-key"></i> <span>Logout</span></a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <!--**********************************
	            Header end ti-comment-alt
	        ***********************************-->
	
	        <!--**********************************
	            Sidebar start
	        ***********************************-->
	        <div class="nk-sidebar">           
	            <div class="nk-nav-scroll">
	                <ul class="metismenu" id="menu">
	                    <li class="nav-label">Menu</li>
	                    <li>
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Cadastros</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li><a href="cadastro-usuario.jsp">Usuários</a></li>
	                            <li><a href="cadastro-produto.jsp">Produtos</a></li>
	                            <li><a href="cadastro-cliente.jsp">Clientes</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        <!--**********************************
	            Sidebar end
	        ***********************************-->
	
	        <!--**********************************
	            Content body start
	        ***********************************-->
	        <div class="content-body">
	            <div class="container-fluid">
	                <h3 style="color: red">${msg}</h3>
	                <div class="row justify-content-center">
	                    <div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-body">
	                                <div class="form-validation">
										<form class="form-valide" action="salvarCliente" method="post" id="formCliente" onsubmit="return validarCampos() ? true : false"  enctype="multipart/form-data" >
										    <div class="form-group row">
										        <label class="col-lg-4 col-form-label" for="id">Código <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${cli.id}" placeholder="Código gerado automaticamente..">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="cpf">CPF <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="cpf" name="cpf" value="${cli.cpf}" placeholder="Informe o cpf do cliente"  maxlength="15">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="rg">RG <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="rg" name="rg" value="${cli.rg}" placeholder="Informe o rg do cliente"  maxlength="15">
	                                            </div>
	                                        </div>	  	                                        	                                        
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="nome">Nome <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="nome" name="nome" value="${cli.nome}" placeholder="Informe o nome do cliente">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="profissao">Profissão <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="profissao" name="profissao" value="${cli.profissao}" placeholder="Informe o nome do profissao">
	                                            </div>
	                                        </div>	                                        
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="email">Email <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="email" name="email" value="${cli.email}" placeholder="Informe o email" maxlength="40">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="dataNascimento">Data Nascimento <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="dataNascimento" name="dataNascimento" value="${cli.dataNascimento}" placeholder="Informe a data nascimento">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="foto">Foto <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="file" class="form-control" id="foto" name="foto" placeholder="">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label"><a href="#">Ativo? </a>  <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-8">
	                                                <label class="css-control css-control-primary css-checkbox" for="ativo">
	                                                    <input type="checkbox" checked id="ativo" name="ativo" class="css-control-input" value="1"
														    <% 
				                                              if (request.getAttribute("cli") != null) {
				                                              	BeanCliente user = (BeanCliente) request.getAttribute("cli");
				                                              	if (user.isAtivo()){
				                                              		out.print(" ");
				                                              		out.print("checked=\"checked\"");
				                                              		out.print(" ");
				                                              	}
				                                              }						 
				                                           %> 
				                                         >										
													<span class="css-control-indicator"></span>Ativar ou desativar cliente?</label>													
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label"><a href="#">Sexo </a>  <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-8">
	                                                <label class="css-control css-control-primary css-checkbox" for="sexo">
	                                                    <input type="radio" id="sexo" name="sexo" class="css-control-input" checked value="masculino" 
														   <% 
						                                   	  if (request.getAttribute("cli") != null){
					                                              	BeanCliente cli = (BeanCliente) request.getAttribute("cli");
						                                   		if (cli.getSexo().equalsIgnoreCase("masculino")){
						                                   			out.print(" ");
						                                   			out.print("checked=\"checked\"");
						                                   			out.print(" ");
						                                   		}
						                                   	}
						                                  %>
						                                >	
														<span class="css-control-indicator"></span>Masculino</label>
	                                                    <input type="radio" id="sexo" name="sexo" class="css-control-input" value="feminino" 
						                                   <% 
						                                   	if (request.getAttribute("cli") != null){
				                                              	BeanCliente cli = (BeanCliente) request.getAttribute("cli");
						                                   	   if (cli.getSexo().equalsIgnoreCase("feminino")){
						                                   		  out.print(" ");
						                                   		  out.print("checked=\"checked\"");
						                                   		  out.print(" ");
						                                   	   }
						                                      }
						                                   %>													   
						                                >   
													<span class="css-control-indicator"></span>Feminino</label>
	                                            </div>
	                                        </div>		
	                                        <div class="form-group row">
	                                            <div class="col-lg-8 ml-auto">
							                        <input type="submit"class="btn btn-primary" value="Salvar"> 
							                        <input type="submit"class="btn btn-primary" value="Cancelar" onclick="document.getElementById('formCliente').action = 'salvarCliente?acao=reset'">												
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- #/ container -->
	        </div>
	        <!--**********************************
	            Content body end
	        ***********************************-->
		  <div id="divCenter" style="margin-top: -60px; position:relative;left:25%;">
			  <form method="post" action="servletPesquisa">
			  	<table>
				  <tr>
					<td>Nome</td>
					<td><input type="text" hidden id="cliente" name="cliente" value="cliente"></td>
					<td><input type="text"  id="descricaoconsulta" name="descricaoconsulta"></td>
					<td><input type="submit" value="Pesquisar"></td>
				  </tr>
			   </table>
			  </form>	 
		  </div> 		
	       <!--**********************************
	            Content body start
	        ***********************************-->
	        <div class="content-body-cliente">
	            <!-- row -->
	            <div class="container-fluid-cliente">
	                <div class="row">
	                    <div class="col-12">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">Lista de Cliente</h4>
	                                <div class="table-responsive">
	                                    <table class="table table-striped table-bordered zero-configuration">
	                                        <thead>
	                                            <tr>
			                                       <th>Nome</th>
			                                       <th>CPF</th>
			                                       <th>RG</th>
			                                       <th>Profissão</th>
			                                       <th>Email</th>
			                                       <th>Data Nascimento</th>
			                                       <th>Foto</th>
			                                       <th>Fone</th>
			                                       <th>End</th>
			                                       <th>Exluir</th>
			                                       <th>Editar</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:forEach items="${clientes}" var="cli">
	   	                                              <tr>
														  <td><c:out value="${cli.nome}"></c:out></td>
														  <td><c:out value="${cli.cpf}"></c:out></td>
														  <td><c:out value="${cli.rg}"></c:out></td>
														  <td><c:out value="${cli.profissao}"></c:out></td>
														  <td><c:out value="${cli.email}"></c:out></td>
														  <td><c:out value="${cli.dataNascimento}"></c:out></td>
														  <c:if test="${cli.fotobase64miniatura.isEmpty() == false}">														  
															  <td>
																<a href="salvarCliente?acao=download&tipo=imagem&cliente=${cli.id}">
																   <img src='<c:out value="${cli.fotobase64miniatura}"/>' alt="Imagem Cliente" title="Imagem Cliente" width="32px" height="32px">
																</a>
															  </td>
														  </c:if>	
														  <c:if test="${cli.fotobase64miniatura == null}">
															  <td><img alt="Imagem Cliente" src="resources/images/userpadrao.png" width="32px" height="32px" onclick="alert('Não possui imagem')"> </td>
														  </c:if>
														  <td><a href="salvarTelefones?acao=addFoneCliente&cliente=${cli.id}"><center><img src="resources/images/telefone.png" alt="Telefones" title="Telefones" width="20px" height="20px" align="middle"></center></a></td>
														  <td><a href="salvarEnderecos?acao=addEnderecoCliente&cliente=${cli.id}"><center><img src="resources/images/endereco.png" alt="Enderecos" title="Endereços" width="30px" height="30px" align="middle"></center></a></td>
														  <td><a href="salvarCliente?acao=delete&cliente=${cli.id}" onclick="return confirm('Confirmar a exclusão?');"><center><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px" align="middle"></center></a></td>
														  <td><a href="salvarCliente?acao=editar&cliente=${cli.id}"><center><img src="resources/images/editar.png" alt="Editar" title="Editar" width="20px" height="20px" align="middle"></center></a></td>
	  	                                              </tr>
		                                          </c:forEach>
	                                            <tfoot>
	                                              <tr>
			                                       <th>Nome</th>
			                                       <th>CPF</th>
			                                       <th>RG</th>
			                                       <th>Profissão</th>
			                                       <th>Email</th>
			                                       <th>Data Nascimento</th>
			                                       <th>Foto</th>
			                                       <th>Fones</th>
			                                       <th>Endereços</th>
			                                       <th>Exluir</th>
			                                       <th>Editar</th>
	                                              </tr>
	                                        </tfoot>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- #/ container -->
	        </div>
	        <!--**********************************
	            Content body end
	        ***********************************-->        
	        
	        <!--**********************************
	            Footer start
	        ***********************************-->
	        <div class="footer">
	            <div class="copyright">
	                <p>Copyright &copy; Designed & Developed by Souza Consultoria<a href="#"> JDev Treinamento</a> 2020</p>
	            </div>
	        </div>
	        <!--**********************************
	            Footer end
	        ***********************************-->
	    </div>
	    <!--**********************************
	        Main wrapper end
	    ***********************************-->
	    <script type="text/javascript">
		    	function validarCampos() {	
		    		if (document.getElementById("nome").value ==''){
		    			alert('Campo nome está vazio.');
		    			return false;
		    		}
		    		else
		    		if (document.getElementById("cpf").value ==''){
		    			alert('Campo cpf está vazio.');
		    			return false;
		    		}
		    		else
		    		if (document.getElementById("rg").value ==''){
		    			alert('Campo rg está vazio.');
		    			return false;
		    		}
		    		else
		    		if (document.getElementById("dataNascimento").value ==''){
		    			alert('Campo Data Nascimento está vazio.');
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
		          $("#estado").val('');
		          $("#ibge").val('');          
		       }
		     });
		   }
		</script>	
	
	    <!--**********************************
	        Scripts
	    ***********************************-->
	    <script src="resources/plugins/common/common.min.js"></script>
	    <script src="resources/js/custom.min.js"></script>
	    <script src="resources/js/settings.js"></script>
	    <script src="resources/js/gleek.js"></script>
	    <script src="resources/js/styleSwitcher.js"></script>
	    <script src="resources/plugins/tables/jquery.dataTables.min.js"></script>    
	    <script src="resources/plugins/tables/datatable-basic.min.js"></script>	
  </body>
</html>
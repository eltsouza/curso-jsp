<%@page import="beans.BeanUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1">
	    <title>Cadastro Endereco</title>
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
										<form class="form-valide" action="salvarEnderecos" method="post" id="formEndereco" onsubmit="return validarCampos() ? true : false">
										    <div class="form-group row">
										        <label class="col-lg-4 col-form-label" for="id">Código <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${pessoaEscolhida.id}" placeholder="Código gerado automaticamente..">
	                                            </div>
	                                        </div>
                                            <div class="form-group row">
                                              <label class="col-lg-4 col-form-label" for="cliente">Cliente <span class="text-danger">*</span>
                                               </label>
                                            <div class="col-lg-6">
                                               <input type="text" class="form-control" readonly="readonly" id="cliente" name="cliente" value="${pessoaEscolhida.nome}">
                                            </div>
                                            </div>	                                        
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="cep">Cep <span class="text-danger">*</span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="cep" maxlength="9" name="cep" value="${updEndereco.cep}" onblur="consultaCep();" placeholder="Informe o cep..">
	                                            </div>
	                                        </div>
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="rua">Rua <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="rua" name="rua" value="${updEndereco.rua}">
	                                            </div>
	                                        </div>										
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="bairro">Bairro <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="bairro" name="bairro" value="${updEndereco.bairro}">
	                                            </div>
	                                        </div>	
	                                        <div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="cidade">Cidade <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="cidade" name="cidade" value="${updEndereco.cidade}">
	                                            </div>
	                                        </div>											
											<div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="estado">UF <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="estado" name="estado" value="${updEndereco.estado}">
	                                            </div>
	                                        </div>	
											<div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="complemento">Complemento <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="complemento" name="complemento" value="${updEndereco.complemento}">
	                                            </div>
	                                        </div>
											<div class="form-group row">
	                                            <label class="col-lg-4 col-form-label" for="ibge">IBGE <span class="text-danger"></span>
	                                            </label>
	                                            <div class="col-lg-6">
	                                                <input type="text" class="form-control" id="ibge" name="ibge" value="${updEndereco.ibge}">
	                                            </div>
	                                        </div>											
	                                        <div class="form-group row">
	                                            <div class="col-lg-8 ml-auto">
							                        <input type="submit"class="btn btn-primary" value="Salvar"> 
							                        <input type="submit"class="btn btn-primary" value="Cancelar" onclick="document.getElementById('formEndereco').action = 'salvarEnderecos?acao=voltar'">												
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
	       <!--**********************************
	            Content body start
	        ***********************************-->
	        <div class="content-body-endereco">
	            <!-- row -->
	            <div class="container-fluid-endereco">
	                <div class="row">
	                    <div class="col-12">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">Lista de Endereços</h4>
	                                <div class="table-responsive">
	                                    <table class="table table-striped table-bordered zero-configuration">
	                                        <thead>
	                                            <tr>
			                                       <th>Código</th>
			                                       <th>Cep</th>
			                                       <th>Rua</th>
			                                       <th>Bairro</th>
			                                       <th>Cidade</th>
			                                       <th>Estado</th>
			                                       <th>Complemento</th>
			                                       <th>Editar</th>
			                                       <th>Exluir</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:forEach items="${enderecos}" var="end">
	   	                                              <tr>
														  <td><c:out value="${end.id}"></c:out></td>
														  <td><c:out value="${end.cep}"></c:out></td>
														  <td><c:out value="${end.rua}"></c:out></td>
														  <td><c:out value="${end.bairro}"></c:out></td>
														  <td><c:out value="${end.cidade}"></c:out></td>
														  <td><c:out value="${end.estado}"></c:out></td>
														  <td><c:out value="${end.complemento}"></c:out></td>
														  <td><a href="salvarEnderecos?acao=atualizaEndereco&enderecoPessoa=${end.id}&cliente=${end.cliente}"><center><img src="resources/images/editar.png" alt="Editar" title="Editar" width="20px" height="20px" align="middle"></center></a></td>
														  <c:if test="${end.cliente == null}">
															  <td><a href="salvarEnderecos?acao=deleteEndereco&enderecoPessoa=${end.id}&cliente=${end.usuario}" onclick="return confirm('Confirmar a exclusão?');"><center><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px" align="middle"></center></a></td>
														  </c:if>                                              
														  <c:if test="${end.usuario == null}">
															  <td><a href="salvarEnderecos?acao=deleteEndereco&enderecoPessoa=${end.id}&cliente=${end.cliente}" onclick="return confirm('Confirmar a exclusão?');"><center><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px" align="middle"></center></a></td>
														  </c:if>                                              
	  	                                               </tr>
		                                             </c:forEach>
	                                            <tfoot>
	                                              <tr>
			                                       <th>Código</th>
			                                       <th>Cep</th>
			                                       <th>Rua</th>
			                                       <th>Bairro</th>
			                                       <th>Cidade</th>
			                                       <th>Estado</th>
			                                       <th>Complemento</th>
			                                       <th>Editar</th>
			                                       <th>Exluir</th>
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
		    		if (document.getElementById("cep.").value ==''){
		    			alert('Campo cep está vazio.');
		    			return false;
		    		}
		    		return true; 
		    }
	    </script>	
  	
		<script>    
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
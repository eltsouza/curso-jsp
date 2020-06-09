<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1">
	    <title>Cadastro Usuários</title>
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
                <a href="index.html">
                    <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="images/logo-text.png" alt="">
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
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <hr class="my-2">
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
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
                            <li><a href="./cadastro.html">Usuários</a></li>
                            <li><a href="./index.html">Produtos</a></li>

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
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
									<form class="form-valide" action="salvarUsuario" method="post" id="formUser" onsubmit="return validarCampos() ? true : false"  enctype="multipart/form-data" >
						                <center><h3 style="color: red">${msg}</h3></center>
									    <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="id">Código <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${user.id}" placeholder="Código gerado automaticamente..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nome">Nome <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nome" name="nome" value="${user.nome}" placeholder="Informe o nome do usuário..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="login">Login <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="login" name="login" value="${user.login}" placeholder="Informe o login.." maxlength="10">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="senha">Senha <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="senha" name="senha" value="${user.senha}" placeholder="Informe a senha..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="cep">Cep <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="cep" name="cep" onblur="consultaCep();" value="${user.cep}" placeholder="Informe o cep..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="rua">Rua <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="rua" name="rua" readonly="readonly" value="${user.rua}">
                                            </div>
                                        </div>										
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="bairro">Bairro <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="bairro" name="bairro" readonly="readonly" value="${user.bairro}">
                                            </div>
                                        </div>	
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="cidade">Cidade <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="cidade" name="cidade" readonly="readonly" value="${user.cidade}">
                                            </div>
                                        </div>											
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="uf">UF <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="uf" name="uf" readonly="readonly" value="${user.estado}">
                                            </div>
                                        </div>	
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="ibge">IBGE <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="ibge" name="ibge" readonly="readonly" value="${user.ibge}">
                                            </div>
                                        </div>											
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-skill">Perfil<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <select id="perfil" name="perfil" class="form-control" id="val-skill" name="val-skill">
                                                    <option value="nao_informado">[--Selecione--]</option>
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
                                            <label class="col-lg-4 col-form-label" for="curriculo">Currículo <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="file" class="form-control" id="curriculo" name="curriculo" placeholder="">
                                            </div>
                                        </div>										
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><a href="#">Ativo? </a>  <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="ativo">
                                                    <input type="checkbox" id="ativo" name="ativo" class="css-control-input" value="1"
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
													<span class="css-control-indicator"></span>Ativar ou desativar usuário?</label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><a href="#">Sexo </a>  <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox" for="sexo">
                                                    <input type="radio" id="sexo" name="sexo" class="css-control-input" value="masculino" 
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
					                                > 
													<span class="css-control-indicator"></span>Masculino</label>
                                                    <input type="radio" id="sexo" name="sexo" class="css-control-input" value="faminino" 
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
													 >  
													<span class="css-control-indicator"></span>Feminino</label>
                                            </div>
                                        </div>		
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
						                        <input type="submit"class="btn btn-primary" value="Salvar"> 
						                        <input type="submit"class="btn btn-primary" value="Cancelar" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">												
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
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by Souza Consultória<a href="#"> JDev Treinamento</a> 2020</p>
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

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>

  </body>

</html>
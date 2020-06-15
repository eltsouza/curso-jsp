<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="beans.BeanUsuario"%>
<%@page import="beans.BeanCliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	 <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width,initial-scale=1">
	 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <title>Cadastro de Telefones</title>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.maskMoney.min.js" type="text/javascript"></script>
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
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
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
                                     <form class="form-valide" action="salvarTelefones" method="post" id="formUser" onsubmit="return validarCampos() ? true : false">
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="id">Id <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                              <input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${pessoaEscolhida.id}">
                                            </div>
                                         </div>
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="usuario">Usuário <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                               <input type="text" class="form-control" readonly="readonly" id="usuario" name="usuario" value="${pessoaEscolhida.nome}">
                                            </div>
                                         </div>
                                         <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="numero">Número <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="numero" name="numero" placeholder="Informe o número de telefone..">
                                            </div>
                                         </div>
                                         <div class="form-group row">
                                             <label class="col-lg-4 col-form-label" for="tipo">Tipo:<span class="text-danger">*</span>
                                             </label>
                                             <div class="col-lg-6">
                                               <select id="tipo" name="tipo" style="width: 175px;height: 30px;">		                                        
                                                  <option>Casa</option>
                                                  <option>Contato</option>
                                                  <option>Celular</option>
                                                  <option>Trabalho</option>
                                               </select>
                                             </div>
                                         </div>
                                         <div class="form-group row">
                                             <div class="col-lg-8 ml-auto">
                                               <input type="submit"class="btn btn-primary" value="Salvar">
                                               <input type="submit"class="btn btn-primary" value="Voltar" onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'">											
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
        <div class="content-body-telefone">
            <div class="container-fluid-telefone">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Lista de Telefones</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">
                                      <thead>
                                            <tr>
                                               <th>Código</th>
                                               <th>Número</th>
                                               <th>Tipo</th>
                                               <th>Excluir</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <!-- Loop pra listar os telefones cadastrados na tela -->
                                          <c:forEach items="${telefones}" var="fone">
                                            <tr>
                                              <td style="width:100px"><c:out value="${fone.id}"></c:out></td>
                                              <td><c:out value="${fone.numero}"></c:out></td>
                                              <td style="width:100px"><c:out value="${fone.tipo}"></c:out></td>
											  <c:if test="${fone.cliente == null}">
                                           	     <td style="width:100px"><a href="salvarTelefones?acao=deleteFone&fonePessoa=${fone.id}&cliente=${fone.usuario}" onclick="return confirm('Confirmar a exclusão?');"><center><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px" align="middle"></center></a></td>
											  </c:if>                                              
											  <c:if test="${fone.usuario == null}">
                                           	     <td style="width:100px"><a href="salvarTelefones?acao=deleteFone&fonePessoa=${fone.id}&cliente=${fone.cliente}" onclick="return confirm('Confirmar a exclusão?');"><center><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px" align="middle"></center></a></td>
											  </c:if>                                              
                                            </tr>
                                          </c:forEach>
                                        </tbody>     
                                        <tfoot>
                                          <tr>
                                            <tr>
                                               <th>Código</th>
                                               <th>Número</th>
                                               <th>Tipo</th>
                                               <th>Excluir</th>
                                            </tr>
                                          </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
     <!--**********************************
     Scripts
     ***********************************-->
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
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    <script src="resources/plugins/tables/jquery.dataTables.min.js"></script>    
    <script src="resources/plugins/tables/datatable-basic.min.js"></script>
  </body>
</html>
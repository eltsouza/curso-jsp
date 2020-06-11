<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	 <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width,initial-scale=1">
	 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <title>Cadastro de Produtos</title>
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
                                   <form class="form-valide" action="salvarProduto" method="post" id="formProduto" onsubmit="return validarCampos() ? true : false">
                                     <div class="form-group row">
                                         <label class="col-lg-4 col-form-label" for="codigo">Código <span class="text-danger">*</span></label>
                                           <div class="col-lg-6">
                                             <input type="text" class="form-control" readonly="readonly" id="codigo" name="codigo" value="${produto.codigo}" placeholder="Código gerado automaticamente..">
                                           </div>
                                         </div>
                                         <div class="form-group row">
                                             <label class="col-lg-4 col-form-label" for="nome">Produto <span class="text-danger">*</span>
                                             </label>
                                             <div class="col-lg-6">
                                                 <input type="text" class="form-control" id="nome" name="nome" value="${produto.nome}" placeholder="Informe o nome do produto.." maxlength="50">
                                             </div>
                                         </div>
                                         <div class="form-group row">
                                             <label class="col-lg-4 col-form-label" for="quantidade">Quantidade <span class="text-danger">*</span>
                                             </label>
                                             <div class="col-lg-6">
                                                 <input type="text" class="form-control" id="quantidade" name="quantidade" value="${produto.quantidade}" placeholder="Informe a quantidade..">
                                             </div>
                                         </div>
                                         <div class="form-group row">
                                             <label class="col-lg-4 col-form-label" for="valor">Valor R$: <span class="text-danger">*</span>
                                             </label>
                                             <div class="col-lg-6">
                                                 <input type="text" class="form-control" id="valor" name="valor" data-thousands="." data-decimal="," data-precision="2" value="${produto.valorEmTexto}" maxlength="20" placeholder="Informe o valor"></td>
                                             </div>
                                         </div>
                                         <div class="form-group row">
                                             <label class="col-lg-4 col-form-label" for="categorias">Categoria:<span class="text-danger">*</span>
                                             </label>
                                             <div class="col-lg-6">
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
                                             </div>
                                         </div>
                                         <div class="form-group row">
                                             <div class="col-lg-8 ml-auto">
                                               <input type="submit"class="btn btn-primary" value="Salvar"> 
                                               <input type="submit"class="btn btn-primary" value="Cancelar" onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'">											
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
        <div class="content-body-produto">
            <div class="container-fluid-produto">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Lista de Produtos</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">
                                      <thead>
                                            <tr>
                                               <th>Código</th>
                                               <th>Produto</th>
                                               <th>Quantidade</th>
                                               <th>Valor</th>
                                               <th>Categoria</th>
                                               <th>Excluir</th>
                                               <th>Alterar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <!-- Loop pra listar os produtos cadastrados na tela -->
                                          <c:forEach items="${produtos}" var="produto">
                                            <tr>
                                              <td><c:out value="${produto.codigo}"></c:out></td>
                                              <td><c:out value="${produto.nome}"></c:out></td>
                                              <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${produto.quantidade}" /></td>
                                              <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${produto.valor}" /></td>
                                              <td><c:out value="${produto.categoria_id}"></c:out></td>
                                              <td><a href="salvarProduto?acao=delete&produto=${produto.codigo}" onclick="return confirm('Confirmar a exclusão?');"><img src="resources/images/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
                                              <td><a href="salvarProduto?acao=editar&produto=${produto.codigo}"><img src="resources/images/editar.png" alt="Alterar" title="Editar" width="20px" height="20px"></a></td>
                                              </tr>
                                            </c:forEach>
                                        </tbody>     
                                        <tfoot>
                                          <tr>
                                            <tr>
                                               <th>Código</th>
                                               <th>Produto</th>
                                               <th>Quantidade</th>
                                               <th>Valor</th>
                                               <th>Categoria</th>
                                               <th>Excluir</th>
                                               <th>Alterar</th> 
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
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    <script src="resources/plugins/tables/jquery.dataTables.min.js"></script>    
    <script src="resources/plugins/tables/datatable-basic.min.js"></script>
  </body>
  <script type="text/javascript">
  	 $(function() {
	    $("#valor").maskMoney();
	 });
	 $(document).ready(function() {
	  $("#quantidade").keyup(function() {
	      $("#quantidade").val(this.value.match(/[0-9]*/));
	  });
	});
   </script>
</html>
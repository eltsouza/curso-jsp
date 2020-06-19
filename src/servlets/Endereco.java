package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanUsuario;
import beans.BeanCliente;
import beans.BeanEndereco;
import beans.BeanProduto;
import dao.DaoCliente;
import dao.DaoEndereco;
import dao.DaoUsuario;

@WebServlet("/salvarEnderecos")
public class Endereco extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoEndereco daoEndereco = new DaoEndereco();
	private DaoCliente daoCliente = new DaoCliente();
	private String tipoPessoa = "";
	private String verificaAcao = "";
	private String enderecoId = "";
	   
    public Endereco() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");
			String cli = request.getParameter("cliente");
			enderecoId = request.getParameter("enderecoPessoa");
			verificaAcao = acao;
			
			if (user != null) {
				tipoPessoa = "usuario";
				BeanUsuario beanUsuario = daoUsuario.consultar(user);			    
				if(acao.equalsIgnoreCase("addEndereco")) {
					request.getSession().setAttribute("pessoaEscolhida", beanUsuario);
					request.setAttribute("pessoaEscolhida", beanUsuario);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					request.setAttribute("enderecos", daoEndereco.listar(beanUsuario.getId(),tipoPessoa));
					view.forward(request, response);
				} else if(acao.equalsIgnoreCase("deleteEndereco")) {
					daoEndereco.deleteEndereco(enderecoId);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					request.setAttribute("pessoaEscolhida", beanUsuario);
					request.setAttribute("enderecos", daoEndereco.listar(Long.parseLong(user),tipoPessoa));
					request.setAttribute("msg", "Endereço excluído com sucesso!");
					view.forward(request, response);
				}
				
			}else if (cli != null) {
				tipoPessoa = "cliente";
				BeanCliente beanCliente = daoCliente.consultarCliente(cli);                
				if(acao.equalsIgnoreCase("addEnderecoCliente")) {
					request.getSession().setAttribute("pessoaEscolhida", beanCliente);
					request.setAttribute("pessoaEscolhida", beanCliente);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					request.setAttribute("enderecos", daoEndereco.listar(beanCliente.getId(),tipoPessoa));
					view.forward(request, response);
				}else if(acao.equalsIgnoreCase("deleteEndereco")) {
					daoEndereco.deleteEndereco(enderecoId);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					request.setAttribute("pessoaEscolhida", beanCliente);
					request.setAttribute("enderecos", daoEndereco.listar(Long.parseLong(cli),tipoPessoa));
					request.setAttribute("msg", "Endereço excluído com sucesso!");
   				    verificaAcao = "addEnderecoCliente"; //valor padrao da variavel.	
					view.forward(request, response);
				}else if(acao.equalsIgnoreCase("atualizaEndereco")) {
					BeanEndereco endereco = daoEndereco.consultarEndereco(enderecoId);
  					RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					request.setAttribute("updEndereco", endereco);
					view.forward(request, response);
				}		
				
			}/*else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			
			if (tipoPessoa == "usuario"){
			    BeanUsuario beanUsuario = (BeanUsuario) request.getSession().getAttribute("pessoaEscolhida");

			    String acao = request.getParameter("acao");
			    String cep = request.getParameter("cep");
				String bairro = request.getParameter("bairro");			
				String complemento = request.getParameter("complemento");
				String cidade = request.getParameter("cidade");			
				String estado = request.getParameter("estado");			
				String ibge = request.getParameter("ibge");			
				String cliente = request.getParameter("cliente");			
				
				if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {
				
				  if (cep == null || (cep != null && cep.isEmpty())){				
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					  request.setAttribute("enderecos", daoEndereco.listar(beanUsuario.getId(),tipoPessoa));
					  request.setAttribute("msg", "O cep do usuário é obrigatório!");
					  view.forward(request, response);				
				  }else{
					  BeanEndereco beanEndereco = new BeanEndereco();
					  beanEndereco.setCep(cep);
					  beanEndereco.setBairro(bairro);
					  beanEndereco.setComplemento(complemento);
					  beanEndereco.setCidade(cidade);
					  beanEndereco.setEstado(estado);
					  beanEndereco.setIbge(ibge);
					  //beanEndereco.setCliente(beanUsuario.getId());					  
					  daoEndereco.salvarEndereco(beanEndereco,tipoPessoa);
				  	  request.getSession().setAttribute("pessoaEscolhida", beanUsuario);
					  request.setAttribute("pessoaEscolhida", beanUsuario);			
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					  request.setAttribute("enderecos", daoEndereco.listar(beanUsuario.getId(),tipoPessoa));
					  request.setAttribute("msg", "Endereço cadastrado com sucesso!");
					  view.forward(request, response);
	 			   }
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
					request.setAttribute("usuarios", daoUsuario.listar());
					view.forward(request, response);
				}
			}else if (tipoPessoa == "cliente"){
			    BeanCliente beanCliente = (BeanCliente) request.getSession().getAttribute("pessoaEscolhida");
				
			    String acao = request.getParameter("acao");
			    String cep = request.getParameter("cep");
				String rua = request.getParameter("rua");
				String bairro = request.getParameter("bairro");		
				String complemento = request.getParameter("complemento");
				String cidade = request.getParameter("cidade");			
				String estado = request.getParameter("estado");			
				String ibge = request.getParameter("ibge");			
			  //String cliente = request.getParameter("cliente");	

				boolean podeProcessar = true;
			    if (verificaAcao == null) {
  				  verificaAcao = "addEnderecoCliente";	
			    }
				if (acao == null) {
				   acao = verificaAcao;
				}
				if (acao.equalsIgnoreCase("voltar")) {
				   podeProcessar = false;
				   RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				   request.setAttribute("clientes", daoCliente.listar());
				   view.forward(request, response);	
				}
				
				if (!acao.equalsIgnoreCase("voltar")) {
				   if (cep == null ||cep.isEmpty()){				
					   podeProcessar = false;
	  				  RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
					  request.setAttribute("enderecos", daoEndereco.listar(beanCliente.getId(),tipoPessoa));
					  request.setAttribute("msg", "O cep do cliente é obrigatório!");
   				      view.forward(request, response);	
					}
				    if (podeProcessar == true) {
					   BeanEndereco beanEndereco = new BeanEndereco();
					   beanEndereco.setCep(cep);
					   beanEndereco.setRua(rua);
					   beanEndereco.setBairro(bairro);
					   beanEndereco.setComplemento(complemento);
					   beanEndereco.setCidade(cidade);
					   beanEndereco.setEstado(estado);
					   beanEndereco.setIbge(ibge);
					   beanEndereco.setCliente(beanCliente.getId());						  
					   
					   if (acao.equalsIgnoreCase("addEnderecoCliente")) {
						 verificaAcao = "addEnderecoCliente";  
					     daoEndereco.salvarEndereco(beanEndereco,tipoPessoa);
						 request.getSession().setAttribute("pessoaEscolhida", beanCliente);
						 request.setAttribute("pessoaEscolhida", beanCliente);			
						 RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
						 request.setAttribute("enderecos", daoEndereco.listar(beanCliente.getId(),tipoPessoa));
						 request.setAttribute("msg", "Endereço cadastrado com sucesso!");
						 view.forward(request, response);
					  }
					  if (verificaAcao.equalsIgnoreCase("atualizaEndereco")) {
 					     String endId = enderecoId;
  					     beanEndereco.setId(Long.parseLong(endId));// so vou precisar do ID do endereço para atualizar
						 daoEndereco.updateEndereco(beanEndereco);
		     			 request.setAttribute("msg", "Endereço atualizado com sucesso!");
						 RequestDispatcher view = request.getRequestDispatcher("/cadastro-endereco.jsp");
						 request.setAttribute("enderecos", daoEndereco.listar(beanCliente.getId(),tipoPessoa));
						 view.forward(request, response);
					   }
					} 
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

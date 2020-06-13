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
import beans.BeanTelefones;
import dao.DaoCliente;
import dao.DaoTelefone;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class Telefones extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoTelefone daoTelefone = new DaoTelefone();
	private DaoCliente daoCliente = new DaoCliente();
	private String tipoPessoa = "";
	   
    public Telefones() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");
			String cli = request.getParameter("cliente");
			String foneId = request.getParameter("fonePessoa");
			
			if (user != null) {
				tipoPessoa = "usuario";
				BeanUsuario beanUsuario = daoUsuario.consultar(user);			    
				if(acao.equalsIgnoreCase("addFone")) {
					request.getSession().setAttribute("pessoaEscolhida", beanUsuario);
					request.setAttribute("pessoaEscolhida", beanUsuario);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("telefones", daoTelefone.listar(beanUsuario.getId(),tipoPessoa));
					view.forward(request, response);
				} else if(acao.equalsIgnoreCase("deleteFone")) {
					//String foneId = request.getParameter("fonePessoa");
					daoTelefone.deleteTelefone(foneId);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("pessoaEscolhida", beanUsuario);
					request.setAttribute("telefones", daoTelefone.listar(Long.parseLong(user),tipoPessoa));
					request.setAttribute("msg", "Telefone excluído com sucesso!");
					view.forward(request, response);
				}
				
			}else if (cli != null) {
				tipoPessoa = "cliente";
				BeanCliente beanCliente = daoCliente.consultarCliente(cli);                
				if(acao.equalsIgnoreCase("addFoneCliente")) {
					request.getSession().setAttribute("pessoaEscolhida", beanCliente);
					request.setAttribute("pessoaEscolhida", beanCliente);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("clientes", daoTelefone.listar(beanCliente.getId(),tipoPessoa));
					view.forward(request, response);
				}else if(acao.equalsIgnoreCase("deleteFone")) {
					//String foneId = request.getParameter("fonePessoa");
					daoTelefone.deleteTelefone(foneId);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("pessoaEscolhida", beanCliente);
					request.setAttribute("telefones", daoTelefone.listar(Long.parseLong(user),tipoPessoa));
					request.setAttribute("msg", "Telefone excluído com sucesso!");
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
				
			    String numero = request.getParameter("numero");
				String tipo = request.getParameter("tipo");			
				String acao = request.getParameter("acao");
				
				if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {
				
				  if (numero == null || (numero != null && numero.isEmpty())){				
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					  request.setAttribute("telefones", daoTelefone.listar(beanUsuario.getId(),tipoPessoa));
					  request.setAttribute("msg", "Informe o número do telefone!");
					  view.forward(request, response);				
				  }else{
					  BeanTelefones beanTelefone = new BeanTelefones();
				  	  beanTelefone.setNumero(numero);
					  beanTelefone.setTipo(tipo);
					  beanTelefone.setUsuario(beanUsuario.getId());
					  daoTelefone.salvarTelefone(beanTelefone,tipoPessoa);
				  	  request.getSession().setAttribute("pessoaEscolhida", beanUsuario);
					  request.setAttribute("pessoaEscolhida", beanUsuario);			
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					  request.setAttribute("telefones", daoTelefone.listar(beanUsuario.getId(),tipoPessoa));
					  request.setAttribute("msg", "Telefone cadastrado com sucesso!");
					  view.forward(request, response);
	 			   }
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
					request.setAttribute("usuarios", daoUsuario.listar());
					view.forward(request, response);
				}
			}else if (tipoPessoa == "cliente"){
			    BeanCliente beanCliente = (BeanCliente) request.getSession().getAttribute("pessoaEscolhida");
				
			    String numero = request.getParameter("numero");
				String tipo = request.getParameter("tipo");			
				String acao = request.getParameter("acao");
				
				if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {
				
				  if (numero == null || (numero != null && numero.isEmpty())){				
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					  request.setAttribute("telefones", daoTelefone.listar(beanCliente.getId(),tipoPessoa));
					  request.setAttribute("msg", "Informe o número do telefone!");
					  view.forward(request, response);				
				  }else{
					  BeanTelefones beanTelefone = new BeanTelefones();
				  	  beanTelefone.setNumero(numero);
					  beanTelefone.setTipo(tipo);
					  beanTelefone.setCliente(beanCliente.getId());
					  daoTelefone.salvarTelefone(beanTelefone,tipoPessoa);
				  	  request.getSession().setAttribute("pessoaEscolhida", beanCliente);
					  request.setAttribute("pessoaEscolhida", beanCliente);			
					  RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					  request.setAttribute("telefones", daoTelefone.listar(beanCliente.getId(),tipoPessoa));
					  request.setAttribute("msg", "Telefone cadastrado com sucesso!");
					  view.forward(request, response);
	 			   }
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
					request.setAttribute("clientes", daoCliente.listar());
					view.forward(request, response);
				}
			}

			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

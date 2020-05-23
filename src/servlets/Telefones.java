package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.BeanTelefones;
import dao.DaoTelefone;
import dao.DaoUsuario;

@WebServlet("/salvarTelefones")
public class Telefones extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoTelefone daoTelefone = new DaoTelefone();
       
    public Telefones() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");
			
			if (user != null) {
			BeanCursoJsp beanCursoJsp = daoUsuario.consultar(user);
			
				if(acao.equalsIgnoreCase("addFone")) {
					request.getSession().setAttribute("userEscolhido", beanCursoJsp);
					request.setAttribute("userEscolhido", beanCursoJsp);
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("telefones", daoTelefone.listar(beanCursoJsp.getId()));
					view.forward(request, response);
				} else if(acao.equalsIgnoreCase("deleteFone")) {
					String foneId = request.getParameter("foneId");
					daoTelefone.deleteTelefone(foneId);
					
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
					request.setAttribute("userEscolhido", beanCursoJsp);
					request.setAttribute("telefones", daoTelefone.listar(Long.parseLong(user)));
					request.setAttribute("msg", "Excluído Com Sucesso!");
					view.forward(request, response);
				}
				
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");
			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");
			
			String acao = request.getParameter("acao");
			
			if (acao == null || (acao != null && !acao.equalsIgnoreCase("voltar"))) {
			
			if (numero == null || (numero != null && numero.isEmpty())){
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
				request.setAttribute("telefones", daoTelefone.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Informe o numero do telefone!");
				view.forward(request, response);
				
			}else {
			
				BeanTelefones beanTelefone = new BeanTelefones();
				beanTelefone.setNumero(numero);
				beanTelefone.setTipo(tipo);
				beanTelefone.setUsuario(beanCursoJsp.getId());
				daoTelefone.salvarTelefone(beanTelefone);
				request.getSession().setAttribute("userEscolhido", beanCursoJsp);
				request.setAttribute("userEscolhido", beanCursoJsp);
			
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-telefones.jsp");
				request.setAttribute("telefones", daoTelefone.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Salvo Com Sucesso!");
				view.forward(request, response);
			
			}
			
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}

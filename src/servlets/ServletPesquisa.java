package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCliente;
import beans.BeanCursoJsp;
import dao.DaoCliente;
import dao.DaoUsuario;

@WebServlet("/servletPesquisa")
public class ServletPesquisa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoCliente daoCliente = new DaoCliente();


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String descricaoPesquisa = request.getParameter("descricaoconsulta");
		String acao = request.getParameter("cliente");
		if (descricaoPesquisa != null && !descricaoPesquisa.trim().isEmpty()){
			try {
				if (acao.equalsIgnoreCase("cliente")){
					List<BeanCliente> listaPesquisa = daoCliente.listar(descricaoPesquisa);					
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
					request.setAttribute("clientes", listaPesquisa);
					view.forward(request, response);					
				}else{
					List<BeanCursoJsp> listaPesquisa = daoUsuario.listar(descricaoPesquisa);					
					RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
					request.setAttribute("usuarios", listaPesquisa);
					view.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			try {
				if (acao.equalsIgnoreCase("cliente")){
				  RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				  request.setAttribute("clientes", daoCliente.listar());
				  view.forward(request, response);
				}else {
  				  RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				  request.setAttribute("usuarios", daoUsuario.listar());
				  view.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

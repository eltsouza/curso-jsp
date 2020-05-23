package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoLogin;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoLogin daoLogin = new DaoLogin();

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		try {
			//AcessoSistema acessoSistema = new AcessoSistema();

			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			if (login != null && !login.isEmpty()
					&& senha != null && !senha.isEmpty()){
				if (daoLogin.validarLogin(login, senha)) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("acesso-liberado-servlets.jsp");
					dispatcher.forward(request, response); // request e response são parametros do metodo doPost
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("acesso-negado-servlets.jsp");
					dispatcher.forward(request, response); // request e response são parametros do metodo doPost
				}
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("index-servlets.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// validacao usuario e senha fixo
		/*
		 * if(acessoSistema.validarLoginSenha(login,senha)) { RequestDispatcher
		 * dispatcher = request.getRequestDispatcher("acesso-liberado-servlets.jsp");
		 * dispatcher.forward(request, response); //request e response são parametros do
		 * metodo doPost }else { RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("acesso-negado-servlets.jsp");
		 * dispatcher.forward(request, response); //request e response são parametros do
		 * metodo doPost }
		 */
	}
}
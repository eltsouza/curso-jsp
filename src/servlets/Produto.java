package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.BeanProduto;
import dao.DaoProduto;

@WebServlet("/salvarProduto")
public class Produto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoProduto daoProduto = new DaoProduto();

	public Produto() {
		super();
	}

	// nomalmente é executada apartir de um link
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
           
		try 
		{			
		  String acao = request.getParameter("acao") != null ? request.getParameter("acao") : "listartodos";
		  String produto = request.getParameter("produto");
		  
          RequestDispatcher view = request.getRequestDispatcher("/cadastro-produto.jsp");

		  
		  if (acao.equalsIgnoreCase("delete")) {
			  daoProduto.deleteProduto(produto);			
			  request.setAttribute("produtos", daoProduto.listar());
		  }else if (acao.equalsIgnoreCase("editar")) {
			  BeanProduto produtos = daoProduto.consultar(produto);
			  request.setAttribute("produto", produtos);
		 }else if (acao.equalsIgnoreCase("listartodos")) {
			  request.setAttribute("produtos", daoProduto.listar());
		 }
     	 request.setAttribute("categorias", daoProduto.listarCategoria());
		 view.forward(request, response);
 
		}catch(Exception e) {
			e.printStackTrace();
		}
	  
	
	}

	// nomalmente é executado apartir de um formulário
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doGet(request, response);

		String acao = request.getParameter("acao");
		
		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-produto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				view.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else
		{
			String codigo = request.getParameter("codigo");
			String nome = request.getParameter("nome");
			String quantidade = request.getParameter("quantidade").replace(",", ".");
			String valor = request.getParameter("valor");
			String categoria = request.getParameter("categoria_id");

			BeanProduto produto = new BeanProduto();
			produto.setCodigo(!codigo.isEmpty() ? Long.parseLong(codigo) : 0);
			produto.setNome(nome);
			produto.setCategoria_id(Long.parseLong(categoria));
			
			if (quantidade != null && !quantidade.isEmpty()) {
				produto.setQuantidade(Double.parseDouble(quantidade));
			}
			if (valor != null && !valor.isEmpty()){
				String valorParse = valor.replaceAll("\\.", "");// 10500,20
				valorParse = valorParse.replaceAll("\\,", ".");//10500.20
				valor = valorParse;
				produto.setValor(Double.parseDouble(valor)); 
			}
			
			try {
				boolean podeInserir = true;
				String msg = null;
				
				if (nome == null || nome.isEmpty()) {
					msg = "O nome do produto deve ser informado";
					podeInserir = false;
				}else if (quantidade == null || quantidade.isEmpty() || Double.parseDouble(quantidade) <= 0) {
					msg = "Informe um valor válido para o campo quantidade";
					podeInserir = false;
				}else if (valor == null || valor.isEmpty() || Double.parseDouble(valor) <= 0) {
					msg = "Informe um valor válido para o campo valor";
					podeInserir = false;
				}else if (codigo == null || codigo.isEmpty() && !daoProduto.validarProduto(nome)) {
					msg = "Produto já cadastrado no sistema.";
					podeInserir = false;
				}
				if (msg != null) {
					request.setAttribute("msg", (Object) msg);
				}
				if (codigo == null || codigo.isEmpty() && daoProduto.validarProduto(nome) && podeInserir) {
					try {
						daoProduto.salvarProduto(produto);
						request.setAttribute("msg", "Salvo Com Sucesso!");

					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else if (codigo != null && !codigo.isEmpty() && podeInserir) {
					daoProduto.updateProduto(produto);
					request.setAttribute("msg", "Atualizado Com Sucesso!");

				}
				
				// se gerou alguma exceção, a pagina e recarregada com os dados na tela
				if (podeInserir == false) {
					request.setAttribute("produto", produto);
				}
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-produto.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				request.setAttribute("categorias", daoProduto.listarCategoria());
				view.forward(request, response);
	
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		
		
		
	}//fim metodo post

}//fim classe

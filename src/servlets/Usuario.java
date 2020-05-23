package servlets;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import beans.BeanCursoJsp;
import dao.DaoUsuario;

/**
 * Servlet implementation class DaoUsuario
 */
@WebServlet("/salvarUsuario")
@MultipartConfig
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public Usuario() {
		super();
	}

	// nomalmente é executada apartir de um link
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		try {

			String acao = request.getParameter("acao");
			String user = request.getParameter("user");

			if (acao != null && acao.equalsIgnoreCase("delete")) {
				daoUsuario.delete(user);
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("editar")) {
				BeanCursoJsp beanCursoJsp = daoUsuario.consultar(user);
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("user", beanCursoJsp);
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("listartodos")) {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("download")){
				BeanCursoJsp usuario = daoUsuario.consultar(user);
				if (usuario != null){
					String contentType = "";
					byte[] fileBytes = null; 
					
					String tipo = request.getParameter("tipo");
					
					if (tipo.equalsIgnoreCase("imagem")){
						contentType = usuario.getContenttype();
						fileBytes = new Base64().decodeBase64(usuario.getFotobase64());
					}else if (tipo.equalsIgnoreCase("curriculo")){
						contentType = usuario.getContenttypecurriculo();
						fileBytes = new Base64().decodeBase64(usuario.getCurriculobase64());
					}
					
					response.setHeader("Content-Disposition", "attachment;filename=arquivo."
				   + contentType.split("\\/")[1]);
					
					
					/*Coloca os bytes em um objeto de entrada para processar*/
					InputStream is = new ByteArrayInputStream(fileBytes);
					
					/*inicio da resposta para o navegador*/
					int read= 0;
					byte[] bytes = new byte[1024];
					OutputStream os = response.getOutputStream();					
					
					while ((read = is.read(bytes)) != -1) {
						os.write(bytes, 0, read);
					}
					
					os.flush();//finaliza
					os.close();//fecha
					
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

	// normalmente é executada atraves de um formulario
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {

				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} else {

			String id = request.getParameter("id");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String nome = request.getParameter("nome");
			String fone = request.getParameter("fone");
			String cep = request.getParameter("cep");
 	        String rua  = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");
			String ibge = request.getParameter("ibge");	
			String sexo = request.getParameter("sexo");
			String perfil = request.getParameter("perfil");

			BeanCursoJsp usuario = new BeanCursoJsp();
			usuario.setId(!id.isEmpty() ? Long.parseLong(id) : 0);
			usuario.setLogin(login);
			usuario.setSenha(senha);
			usuario.setNome(nome);
			usuario.setFone(fone);
			usuario.setCep(cep);
			usuario.setRua(rua);
			usuario.setBairro(bairro);
			usuario.setCidade(cidade);
			usuario.setEstado(estado);
			usuario.setIbge(ibge);
			usuario.setSexo(sexo);
			usuario.setPerfil(perfil);

			//
			if (request.getParameter("ativo") != null 
					&& request.getParameter("ativo").equalsIgnoreCase("on")){
				usuario.setAtivo(true);
			}else {
				usuario.setAtivo(false);
			}			
			try {
				
				//Inicio - File upload de imagens e pdf
				
				if(ServletFileUpload.isMultipartContent(request)) { // valida se o formulario da requisicao é de upload
					
					Part imageFoto = request.getPart("foto");
					
					if (imageFoto != null && imageFoto.getInputStream().available() > 0 ) {
						
						byte[] bytesImagem = convertStreemToByte(imageFoto.getInputStream());
						
						String fotobase64 = new Base64().
								encodeBase64String(bytesImagem);

						usuario.setFotobase64(fotobase64);
						usuario.setContenttype(imageFoto.getContentType());
						
						/*Inicio miniatura imagem*/
						 
						/*Transforma emum bufferedImage*/
						 byte[] imageByteDecode = new Base64().decodeBase64(fotobase64);
						 BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imageByteDecode));
						 
						 /*Pega o tipo da imagem*/
						 int type = bufferedImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB: bufferedImage.getType();
						 
						 /*Cria imagem em miniatura*/
						  BufferedImage resizedImage = new BufferedImage(100, 100, type);
						  Graphics2D g = resizedImage.createGraphics();
						  g.drawImage(bufferedImage, 0, 0, 100, 100, null);
						  g.dispose();
						  
						  /*Escrever imagem novamente*/
						  ByteArrayOutputStream baos = new ByteArrayOutputStream();
						  ImageIO.write(resizedImage, "png", baos);
						  
						  
						  String miniaturaBase64 = "data:image/png;base64," + DatatypeConverter.printBase64Binary(baos.toByteArray());
						
						  usuario.setFotobase64miniatura(miniaturaBase64);
						/*Fim miniatura imagem*/
						
						
					}else {
						usuario.setAtualizarImage(false);
						//usuario.setFotobase64(request.getParameter("fotoTemp"));
						//usuario.setContenttype(request.getParameter("contentTypeTemp"));
					}
					//processa pdf					
					Part curriculoPdf = request.getPart("curriculo");
					
					if (curriculoPdf != null && curriculoPdf.getInputStream().available() > 0 ) {
						String curriculoBase64 = new Base64().
								encodeBase64String(convertStreemToByte(curriculoPdf.getInputStream()));

						usuario.setCurriculobase64(curriculoBase64);
						usuario.setContenttypecurriculo(curriculoPdf.getContentType());
					}else {
						usuario.setAtualizarPdf(false);
						//usuario.setCurriculobase64(request.getParameter("curriculoTemp"));
						//usuario.setContenttypecurriculo(request.getParameter("contentTypeCurriculoTemp"));
					}
				}
				
				//Fim - File upload de imagens e pdf

				boolean podeInserir = true;
				String msg = null;
				
				if(login == null || login.isEmpty()) {
					msg = "Login Deve Ser Informado!";
					podeInserir = false;
				} else if(senha == null || senha.isEmpty()) {
					msg = "Senha Deve Ser Informada!";
					podeInserir = false;
				} else if(nome == null || nome.isEmpty()) {
					msg = "Nome Deve Ser Informado!";
					podeInserir = false;
				} else if(id == null || id.isEmpty() && !daoUsuario.validarLogin(login)) {
					request.setAttribute("msg", "Este Login Pertence a Um Usuário!");
					podeInserir = false;
				} else if(id == null || id.isEmpty() && !daoUsuario.validarSenha(senha)) {
					request.setAttribute("msg", "Esta Senha Pertence a Um Usuário!");
					podeInserir = false;
				}
				
				if(msg != null) {
					request.setAttribute("msg", msg);
				} else if(id == null || id.isEmpty() && daoUsuario.validarLogin(login) && daoUsuario.validarSenha(senha) && podeInserir) {
					daoUsuario.salvar(usuario);
					request.setAttribute("msg", "Salvo Com Sucesso!");
				}
				
				if(id != null && !id.isEmpty() && podeInserir) {
					if (!daoUsuario.validarLoginUpdate(login, id)){
						request.setAttribute("msg", "Login já existe para outro usuário");
					}else {
					 daoUsuario.atualizar(usuario);
     				 request.setAttribute("msg", "Atualizado Com Sucesso!");
					}
				}
				
				if(!podeInserir) {
					request.setAttribute("user", usuario);
				}
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-usuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				//request.setAttribute("msg", "Salvo Com Sucesso!");
				view.forward(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} // fim else
	}// fim metodo Post
	
	//Converte a entrada de fluxo de dados da imagem para um array de bytes.
	private byte[] convertStreemToByte(InputStream imagem) throws Exception {
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int reads = imagem.read();
		
		while(reads != -1) {
			baos.write(reads);
			reads = imagem.read();
		}
		return baos.toByteArray();
	}
	
}// fim classe

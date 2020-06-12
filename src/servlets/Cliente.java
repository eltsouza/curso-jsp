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

import beans.BeanCliente;
import dao.DaoCliente;

@WebServlet("/salvarCliente")
@MultipartConfig
public class Cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoCliente daoCliente = new DaoCliente();

	public Cliente() {
		super();
	}

	// nomalmente é executada apartir de um link
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		try {

			String acao = request.getParameter("acao");
			String cli = request.getParameter("cliente");
			BeanCliente beanCliente = new BeanCliente();

			if (acao != null && acao.equalsIgnoreCase("delete")) {
				daoCliente.deleteCliente(cli);
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("clientes", daoCliente.listar());
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("editar")) {
				beanCliente = daoCliente.consultarCliente(cli);
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("cli", beanCliente);
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("listartodos")) {
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("clientes", daoCliente.listar());
				view.forward(request, response);
			} else if (acao != null && acao.equalsIgnoreCase("download")){
				beanCliente = daoCliente.consultarCliente(cli);
				if (beanCliente != null){
					String contentType = "";
					byte[] fileBytes = null; 
					
					String tipo = request.getParameter("tipo");
					
					if (tipo.equalsIgnoreCase("imagem")){
						contentType = beanCliente.getContenttype();
						fileBytes = new Base64().decodeBase64(beanCliente.getFotobase64());
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
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("clientes", daoCliente.listar());
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

				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("clientes", daoCliente.listar());
				view.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} else {

			String id = request.getParameter("id");
			String cpf = request.getParameter("cpf");
			String rg = request.getParameter("rg");
			String nome = request.getParameter("nome");
			String profissao = request.getParameter("profissao");
			String email = request.getParameter("email");
 	        String dataNascimento  = request.getParameter("dataNascimento");
			String sexo = request.getParameter("sexo");

			BeanCliente beanCliente = new BeanCliente();
			beanCliente.setId(!id.isEmpty() ? Long.parseLong(id) : null);
			beanCliente.setCpf(cpf);
			beanCliente.setRg(rg);
			beanCliente.setNome(nome);
			beanCliente.setProfissao(profissao);
			beanCliente.setEmail(email);
			beanCliente.setDataNascimento(dataNascimento);
			beanCliente.setSexo(sexo);
			//
			if (request.getParameter("ativo") != null 
					&& request.getParameter("ativo").equalsIgnoreCase("on")){
				beanCliente.setAtivo(true);
			}else {
				beanCliente.setAtivo(false);
			}			
			try {
				
				//Inicio - File upload de imagens e pdf
				
				if(ServletFileUpload.isMultipartContent(request)) { // valida se o formulario da requisicao é de upload
					
					Part imageFoto = request.getPart("foto");
					
					if (imageFoto != null && imageFoto.getInputStream().available() > 0 ) {
						
						byte[] bytesImagem = convertStreemToByte(imageFoto.getInputStream());
						
						String fotobase64 = new Base64().
								encodeBase64String(bytesImagem);

						beanCliente.setFotobase64(fotobase64);
						beanCliente.setContenttype(imageFoto.getContentType());
						
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
						
						  beanCliente.setFotobase64miniatura(miniaturaBase64);
						/*Fim miniatura imagem*/
					}else {
						beanCliente.setAtualizarImage(false);
					}
				}
				
				//Fim - File upload de imagens

				boolean podeInserir = true;
				String msg = null;
				
				if(nome == null || nome.isEmpty()) {
					msg = "Nome do cliente ser informado!";
					podeInserir = false;
				} else if(cpf == null || cpf.isEmpty()) {
					msg = "Cpf do cliente ser informado!";
					podeInserir = false;
				} else if(rg == null || rg.isEmpty()) {
					msg = "Rg do cliente ser informado!";
					podeInserir = false;
				} else if(id == null || id.isEmpty() && !daoCliente.validarCpfDuplicado(cpf)) {
					msg = "Este CPF já pertence a um cliente!";
					podeInserir = false;
				} 
				if(msg != null) {
					request.setAttribute("msg", msg);
				} else if(id == null || id.isEmpty() && daoCliente.validarCpfDuplicado(cpf) && podeInserir) {
					daoCliente.salvarCliente(beanCliente);
					request.setAttribute("msg", "Cliente cadastrado com sucesso!");
				}
				
				if(id != null && !id.isEmpty() && podeInserir) {
					if (!daoCliente.validarCpfUpdate(cpf, id)){
						request.setAttribute("msg", "CPF já existe para outro cliente!");
					}else {
					 daoCliente.atualizarCliente(beanCliente);
     				 request.setAttribute("msg", "Cliente atualizado com sucesso!");
					}
				}
				
				if(!podeInserir) {
					request.setAttribute("cli", beanCliente);
				}
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastro-cliente.jsp");
				request.setAttribute("clientes", daoCliente.listar());
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

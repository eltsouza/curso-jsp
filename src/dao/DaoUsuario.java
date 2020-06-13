package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.BeanUsuario;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;

	public DaoUsuario() {

		connection = SingleConnection.getConnection();

	}
	// criando o metodo para salvar os registros no banco de dados
	public void salvar(BeanUsuario usuario) throws SQLException {
		try {
			String sql = "insert into usuario(login,senha,nome,telefone,cep,rua,bairro,cidade,estado,ibge,fotobase64,contenttype,curriculobase64,contenttypecurriculo,fotobase64miniatura,ativo,sexo,perfil) " 
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, usuario.getLogin());
			insert.setString(2, usuario.getSenha());
			insert.setString(3, usuario.getNome());
			insert.setString(4,usuario.getFone());
			insert.setString(5,usuario.getCep());
			insert.setString(6,usuario.getRua());
			insert.setString(7,usuario.getBairro());
			insert.setString(8,usuario.getCidade());
			insert.setString(9,usuario.getEstado());
			insert.setString(10,usuario.getIbge());
			insert.setString(11,usuario.getFotobase64());
			insert.setString(12,usuario.getContenttype());
			insert.setString(13,usuario.getCurriculobase64());
			insert.setString(14,usuario.getContenttypecurriculo());	
			insert.setString(15, usuario.getFotobase64miniatura());
			insert.setBoolean(16, usuario.isAtivo());
			insert.setString(17, usuario.getSexo());
			insert.setString(18, usuario.getPerfil());
			insert.execute();
			
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}
	
	/*
	 * Método listar() Responsável Por Listar Todos os Usuários do Sistema
	 */
	
	
	public List<BeanUsuario> listar (String descricaoconsulta) throws SQLException{
		String sql = "SELECT * FROM usuario where login <> 'admin' and nome like '%"+descricaoconsulta+"%'";
		return consultarUsuarios(sql);
	}
	
	
	public List<BeanUsuario> listar() throws Exception {
		String sql = "SELECT * FROM usuario where login <> 'admin'";
		return consultarUsuarios(sql);
	}

	private List<BeanUsuario> consultarUsuarios(String sql)
			throws SQLException {
		List<BeanUsuario> listar = new ArrayList<BeanUsuario>();
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			BeanUsuario beanUsuario = new BeanUsuario();
			beanUsuario.setId(resultSet.getLong("id"));
			beanUsuario.setLogin(resultSet.getString("login"));
			beanUsuario.setSenha(resultSet.getString("senha"));
			beanUsuario.setNome(resultSet.getString("nome"));
			beanUsuario.setFone(resultSet.getString("telefone"));
			beanUsuario.setCep(resultSet.getString("cep"));
			beanUsuario.setRua(resultSet.getString("rua"));
			beanUsuario.setBairro(resultSet.getString("bairro"));
			beanUsuario.setCidade(resultSet.getString("cidade"));
			beanUsuario.setEstado(resultSet.getString("estado"));
			beanUsuario.setIbge(resultSet.getString("ibge"));
			beanUsuario.setContenttype(resultSet.getString("contenttype"));
			// beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
			beanUsuario.setFotobase64miniatura(resultSet
					.getString("fotobase64miniatura"));
			beanUsuario.setCurriculobase64(resultSet
					.getString("curriculobase64"));
			beanUsuario.setContenttypecurriculo(resultSet
					.getString("contenttypecurriculo"));
			
			beanUsuario.setAtivo(resultSet.getBoolean("ativo"));
			beanUsuario.setSexo(resultSet.getString("sexo"));
			beanUsuario.setPerfil(resultSet.getString("perfil"));
			listar.add(beanUsuario);
		}
		
		return listar;
	}	
	//criando metodo para deletar um usuario
	public void delete (String id) {
		
  	  try {
			String sql = "delete from usuario where id = '" + id + "' and login <> 'admin'";
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();
	  } catch (SQLException e) {
		    try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		    e.printStackTrace();
	  }
		
	}

	public BeanUsuario consultar(String id){

		try {
			String sql = "select * from usuario where id = '" + id + "' and login <> 'admin'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){
				
				BeanUsuario beanUsuario = new BeanUsuario();
				beanUsuario.setId(resultset.getLong("id"));
				beanUsuario.setLogin(resultset.getString("login"));
				beanUsuario.setSenha(resultset.getString("senha"));
				beanUsuario.setNome(resultset.getString("nome"));
                beanUsuario.setFone(resultset.getString("telefone"));
                beanUsuario.setCep(resultset.getString("cep"));
                beanUsuario.setRua(resultset.getString("rua"));
                beanUsuario.setBairro(resultset.getString("bairro"));
                beanUsuario.setCidade(resultset.getString("cidade"));
                beanUsuario.setEstado(resultset.getString("estado"));
                beanUsuario.setIbge(resultset.getString("ibge"));          
                beanUsuario.setFotobase64(resultset.getString("fotobase64"));
                beanUsuario.setFotobase64miniatura(resultset.getString("fotobase64miniatura"));
                beanUsuario.setContenttype(resultset.getString("contenttype"));
                beanUsuario.setCurriculobase64(resultset.getString("curriculobase64"));
                beanUsuario.setContenttypecurriculo(resultset.getString("contenttypecurriculo"));
    			beanUsuario.setAtivo(resultset.getBoolean("ativo"));
    			beanUsuario.setSexo(resultset.getString("sexo"));
    			beanUsuario.setPerfil(resultset.getString("perfil"));
				return beanUsuario;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;		
	}

	//rotina para validar login duplicado
	public boolean validarLogin(String login){

		try {
			String sql = "select count(1) as qtd from usuario where login = '" + login + "'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){
				
				return resultset.getInt("qtd") <=0;//return true
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}
	
	//rotina para validar login durante atualizacao
	public boolean validarLoginUpdate(String login, String id){

		try {
			String sql = "select count(1) as qtd from usuario where login = '" + login + "' and id <> " + id;
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){
				
				return resultset.getInt("qtd") <=0;//return true
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}	
	
	//rotina para validar Senha durante atualizacao
	public boolean validarSenhaUpdate(String senha, String id){

		try {
			String sql = "select count(1) as qtd from usuario where senha = '" + senha + "' and id <> " + id;
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){				
				return resultset.getInt("qtd") <=0;//return true
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}

	//rotina para validar login durante atualizacao
	public boolean validarSenha	(String senha){

		try {
			String sql = "select count(1) as qtd from usuario where senha = '" + senha + "'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){
				
				return resultset.getInt("qtd") <=0;//return true
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}	
	/*
	 * Método atualizar() Método Responsável Por Atualizar os Dados (UPDATE) no
	 * BD
	 * 
	 * @param BeanUsuario usuario = Objeto usuario da Classe BeanUsuario
	 */
	public void atualizar(BeanUsuario usuario) {
		try {
			StringBuilder sql = new StringBuilder();

			sql.append(" UPDATE usuario SET login = ?, senha = ?, nome = ?, telefone = ");
			sql.append(" ?, cep = ?, rua = ?, bairro = ?, cidade = ?, ");
			sql.append(" estado = ?, ibge = ?, ativo = ?, sexo = ?, perfil = ?");

			if (usuario.isAtualizarImage()) {
				sql.append(", fotobase64 =?, contenttype = ? ");
			}

			if (usuario.isAtualizarPdf()) {
				sql.append(", curriculobase64 = ?, contenttypecurriculo = ? ");
			}

			if (usuario.isAtualizarImage()) {
				sql.append(", fotobase64miniatura = ? ");
			}

			sql.append(" WHERE id = " + usuario.getId());

			// fotobase64, contenttype, curriculobase64, contenttypecurriculo
			PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, usuario.getLogin());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setString(3, usuario.getNome());
			preparedStatement.setString(4, usuario.getFone());
			preparedStatement.setString(5, usuario.getCep());
			preparedStatement.setString(6, usuario.getRua());
			preparedStatement.setString(7, usuario.getBairro());
			preparedStatement.setString(8, usuario.getCidade());
			preparedStatement.setString(9, usuario.getEstado());
			preparedStatement.setString(10, usuario.getIbge());
			preparedStatement.setBoolean(11, usuario.isAtivo());
			preparedStatement.setString(12, usuario.getSexo());
			preparedStatement.setString(13, usuario.getPerfil());

			if (usuario.isAtualizarImage()) {
				preparedStatement.setString(14, usuario.getFotobase64());
				preparedStatement.setString(15, usuario.getContenttype());
			}

			if (usuario.isAtualizarPdf()) {
				
				if (usuario.isAtualizarPdf() && !usuario.isAtualizarImage()){
					preparedStatement.setString(14, usuario.getCurriculobase64());
					preparedStatement.setString(15,
							usuario.getContenttypecurriculo());
				}else {
					preparedStatement.setString(16, usuario.getCurriculobase64());
					preparedStatement.setString(17,
							usuario.getContenttypecurriculo());
				}

			}else {
				if (usuario.isAtualizarImage()) {
					preparedStatement.setString(16,
							usuario.getFotobase64miniatura());
				}
			}

			if (usuario.isAtualizarImage() && usuario.isAtualizarPdf()) {
				preparedStatement.setString(18,
						usuario.getFotobase64miniatura());
			}

			preparedStatement.executeUpdate();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
/*	public void atualizar(BeanUsuario usuario) {

	   try {
			//String sql = "update usuario " + "set login = ?" + "where id   = " + usuario.getId();
			String sql = "update usuario set login = ? , "+
		                                	"senha = ?,  "+
					                        "nome  = ? ,  "+
		                                	"telefone = ?,"+
					                        "cep = ?, "+
		                                	"rua = ?, "+
					                        "bairro = ?,"+
		                                	"cidade = ? ,"+
					                        "estado = ? ,"+
					                        "ibge = ? ,"+
		                                	"fotobase64 = ?,"+" "+ 
											"contenttype = ?,"+" "+
											"curriculobase64 = ?,"+" "+ 
											"contenttypecurriculo = ?,"+""+
                                            "fotobase64miniatura = ?"+			
											"where id = " + usuario.getId();
			
			System.out.println("sql..:"+sql);
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, usuario.getLogin());
			statement.setString(2, usuario.getSenha());
			statement.setString(3, usuario.getNome());
            statement.setString(4, usuario.getFone());
            statement.setString(5,usuario.getCep());
            statement.setString(6,usuario.getRua());
            statement.setString(7,usuario.getBairro());
            statement.setString(8,usuario.getCidade());
            statement.setString(9,usuario.getEstado());
            statement.setString(10,usuario.getIbge());    
            statement.setString(11,usuario.getFotobase64());
            statement.setString(12,usuario.getContenttype());
            statement.setString(13,usuario.getCurriculobase64());
            statement.setString(14,usuario.getContenttypecurriculo());
            statement.setString(15, usuario.getFotobase64miniatura());
            statement.execute();
			connection.commit();
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}*/
	
	
	
	
}

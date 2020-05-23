package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.BeanCursoJsp;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;

	public DaoUsuario() {

		connection = SingleConnection.getConnection();

	}
	// criando o metodo para salvar os registros no banco de dados
	public void salvar(BeanCursoJsp usuario) throws SQLException {
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
	
	
	public List<BeanCursoJsp> listar (String descricaoconsulta) throws SQLException{
		String sql = "SELECT * FROM usuario where login <> 'admin' and nome like '%"+descricaoconsulta+"%'";
		return consultarUsuarios(sql);
	}
	
	
	public List<BeanCursoJsp> listar() throws Exception {
		String sql = "SELECT * FROM usuario where login <> 'admin'";
		return consultarUsuarios(sql);
	}

	private List<BeanCursoJsp> consultarUsuarios(String sql)
			throws SQLException {
		List<BeanCursoJsp> listar = new ArrayList<BeanCursoJsp>();
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setFone(resultSet.getString("telefone"));
			beanCursoJsp.setCep(resultSet.getString("cep"));
			beanCursoJsp.setRua(resultSet.getString("rua"));
			beanCursoJsp.setBairro(resultSet.getString("bairro"));
			beanCursoJsp.setCidade(resultSet.getString("cidade"));
			beanCursoJsp.setEstado(resultSet.getString("estado"));
			beanCursoJsp.setIbge(resultSet.getString("ibge"));
			beanCursoJsp.setContenttype(resultSet.getString("contenttype"));
			// beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
			beanCursoJsp.setFotobase64miniatura(resultSet
					.getString("fotobase64miniatura"));
			beanCursoJsp.setCurriculobase64(resultSet
					.getString("curriculobase64"));
			beanCursoJsp.setContenttypecurriculo(resultSet
					.getString("contenttypecurriculo"));
			
			beanCursoJsp.setAtivo(resultSet.getBoolean("ativo"));
			beanCursoJsp.setSexo(resultSet.getString("sexo"));
			beanCursoJsp.setPerfil(resultSet.getString("perfil"));
			listar.add(beanCursoJsp);
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

	public BeanCursoJsp consultar(String id){

		try {
			String sql = "select * from usuario where id = '" + id + "' and login <> 'admin'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery(); 
			
			if (resultset.next()){
				
				BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
				beanCursoJsp.setId(resultset.getLong("id"));
				beanCursoJsp.setLogin(resultset.getString("login"));
				beanCursoJsp.setSenha(resultset.getString("senha"));
				beanCursoJsp.setNome(resultset.getString("nome"));
                beanCursoJsp.setFone(resultset.getString("telefone"));
                beanCursoJsp.setCep(resultset.getString("cep"));
                beanCursoJsp.setRua(resultset.getString("rua"));
                beanCursoJsp.setBairro(resultset.getString("bairro"));
                beanCursoJsp.setCidade(resultset.getString("cidade"));
                beanCursoJsp.setEstado(resultset.getString("estado"));
                beanCursoJsp.setIbge(resultset.getString("ibge"));          
                beanCursoJsp.setFotobase64(resultset.getString("fotobase64"));
                beanCursoJsp.setFotobase64miniatura(resultset.getString("fotobase64miniatura"));
                beanCursoJsp.setContenttype(resultset.getString("contenttype"));
                beanCursoJsp.setCurriculobase64(resultset.getString("curriculobase64"));
                beanCursoJsp.setContenttypecurriculo(resultset.getString("contenttypecurriculo"));
    			beanCursoJsp.setAtivo(resultset.getBoolean("ativo"));
    			beanCursoJsp.setSexo(resultset.getString("sexo"));
    			beanCursoJsp.setPerfil(resultset.getString("perfil"));
				return beanCursoJsp;
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
	 * @param BeanCursoJsp usuario = Objeto usuario da Classe BeanCursoJsp
	 */
	public void atualizar(BeanCursoJsp usuario) {
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
/*	public void atualizar(BeanCursoJsp usuario) {

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

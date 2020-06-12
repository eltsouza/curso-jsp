package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.BeanCliente;
import beans.BeanCursoJsp;
import connection.SingleConnection;

public class DaoCliente {

	private Connection connection;

	public DaoCliente() {

		connection = SingleConnection.getConnection();

	}
	// criando o metodo para salvar os registros no banco de dados
	public void salvarCliente(BeanCliente cliente) throws SQLException {
		try {
			String sql = "insert into cliente(cpf,rg,nome,profissao,email,dataNascimento,fotobase64,fotobase64miniatura,contenttype,sexo,ativo) " 
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1,cliente.getCpf());
			insert.setString(2,cliente.getRg());
			insert.setString(3,cliente.getNome());
			insert.setString(4,cliente.getProfissao());
			insert.setString(5,cliente.getEmail());
			insert.setString(6,cliente.getDataNascimento());
			insert.setString(7,cliente.getFotobase64());
			insert.setString(8,cliente.getFotobase64miniatura());
			insert.setString(9,cliente.getContenttype());
			insert.setString(10,cliente.getSexo());
			insert.setBoolean(11,cliente.isAtivo());
			insert.execute();
			
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}
	
	/*
	 * Método listar() Responsável Por Listar Todos os clientes do Sistema
	 */
	public List<BeanCliente> listar (String descricaoconsulta) throws SQLException{
		String sql = "SELECT * FROM cliente where upper(nome) like upper('%"+descricaoconsulta+"%')";
		return consultarClientes(sql);
	}
	
	
	public List<BeanCliente> listar() throws Exception {
		String sql = "SELECT * FROM cliente";
		return consultarClientes(sql);
	}

	private List<BeanCliente> consultarClientes(String sql)
			throws SQLException {
		List<BeanCliente> listar = new ArrayList<BeanCliente>();
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			BeanCliente beanCliente = new BeanCliente();
			beanCliente.setId(resultSet.getLong("id"));
			beanCliente.setCpf(resultSet.getString("cpf"));
			beanCliente.setRg(resultSet.getString("rg"));
			beanCliente.setNome(resultSet.getString("nome"));
			beanCliente.setProfissao(resultSet.getString("profissao"));
			beanCliente.setEmail(resultSet.getString("email"));
			beanCliente.setDataNascimento(resultSet.getString("datanascimento"));
			beanCliente.setContenttype(resultSet.getString("contenttype"));
			beanCliente.setFotobase64miniatura(resultSet.getString("fotobase64miniatura"));		
			beanCliente.setAtivo(resultSet.getBoolean("ativo"));
			beanCliente.setSexo(resultSet.getString("sexo"));
			listar.add(beanCliente);
		}
		
		return listar;
	}	
	//criando metodo para deletar um cliente
	public void deleteCliente (String id) {
		
  	  try {
			String sql = "delete from cliente where id = '" + id +"'";
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

	public BeanCliente consultarCliente(String id){

		try {
			String sql = "select * from cliente where id = '" + id +"'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery(); 
			
			if (resultSet.next()){
				
				BeanCliente beanCliente = new BeanCliente();
				beanCliente.setId(resultSet.getLong("id"));
				beanCliente.setCpf(resultSet.getString("cpf"));
				beanCliente.setRg(resultSet.getString("rg"));
				beanCliente.setNome(resultSet.getString("nome"));
				beanCliente.setProfissao(resultSet.getString("profissao"));
				beanCliente.setEmail(resultSet.getString("email"));
				beanCliente.setDataNascimento(resultSet.getString("dataNascimento"));
				beanCliente.setContenttype(resultSet.getString("contenttype"));
				beanCliente.setFotobase64miniatura(resultSet
						.getString("fotobase64miniatura"));		
				beanCliente.setAtivo(resultSet.getBoolean("ativo"));
				beanCliente.setSexo(resultSet.getString("sexo"));				
				return beanCliente;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;		
	}

	//rotina para validar cpf duplicado
	public boolean validarCpfDuplicado(String cpf){

		try {
			String sql = "select count(1) as qtd from cliente where cpf = '" + cpf + "'";
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
	public boolean validarCpfUpdate(String cpf, String id){

		try {
			String sql = "select count(1) as qtd from cliente where cpf = '" + cpf + "' and id <> " + id;
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
	public void atualizarCliente(BeanCliente cliente) {
		try {
			StringBuilder sql = new StringBuilder();

			sql.append(" UPDATE cliente SET cpf = ?, rg = ?, nome = ?, profissao = ");
			sql.append(" ?, email = ?, datanascimento = ?, ativo = ? , sexo = ?");

			if (cliente.isAtualizarImage()) {
				sql.append(", fotobase64 =?, contenttype = ? ");
			}

			if (cliente.isAtualizarImage()) {
				sql.append(", fotobase64miniatura = ? ");
			}

			sql.append(" WHERE id = " + cliente.getId());

			PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, cliente.getCpf());
			preparedStatement.setString(2, cliente.getRg());
			preparedStatement.setString(3, cliente.getNome());
			preparedStatement.setString(4, cliente.getProfissao());
			preparedStatement.setString(5, cliente.getEmail());
			preparedStatement.setString(6, cliente.getDataNascimento());
			preparedStatement.setBoolean(7, cliente.isAtivo());
			preparedStatement.setString(8, cliente.getSexo());

			if (cliente.isAtualizarImage()) {
				preparedStatement.setString(9, cliente.getFotobase64());
				preparedStatement.setString(10, cliente.getContenttype());
 			    preparedStatement.setString(11,cliente.getFotobase64miniatura());
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

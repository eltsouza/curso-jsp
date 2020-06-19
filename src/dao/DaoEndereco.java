package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanEndereco;
import connection.SingleConnection;

public class DaoEndereco {

	private Connection connection;

	public DaoEndereco() {
		connection = SingleConnection.getConnection();
	}

	// Metodo para salvar os endereco
	public void salvarEndereco(BeanEndereco endereco, String tipoPessoa) throws SQLException {
		try {
			if (tipoPessoa=="usuario") {
			   String sql = "insert into endereco(cep, rua, bairro, complemento, cidade, estado, ibge, cliente) values(?,?,?,?,?,?,?,?)";
			   PreparedStatement insert = connection.prepareStatement(sql);
			   insert.setString(1,endereco.getCep());
			   insert.setString(2,endereco.getRua());
			   insert.setString(3,endereco.getBairro());
			   insert.setString(4,endereco.getComplemento());
			   insert.setString(5,endereco.getCidade());
			   insert.setString(6,endereco.getEstado());
			   insert.setString(7,endereco.getIbge());
			   insert.setLong(8,endereco.getCliente());
 			   insert.execute();
			   connection.commit();
			}else if (tipoPessoa=="cliente") {
			   String sql = "insert into endereco(cep, rua, bairro, complemento, cidade, estado, ibge, cliente) values(?,?,?,?,?,?,?,?)";
			   PreparedStatement insert = connection.prepareStatement(sql);
			   insert.setString(1,endereco.getCep());
			   insert.setString(2,endereco.getRua());
			   insert.setString(3,endereco.getBairro());
			   insert.setString(4,endereco.getComplemento());
			   insert.setString(5,endereco.getCidade());
			   insert.setString(6,endereco.getEstado());
			   insert.setString(7,endereco.getIbge());
			   insert.setLong(8,endereco.getCliente());
			   insert.execute();
			   connection.commit();
			}
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

	// Medodo para listar os telefones dos usuarios
	public List<BeanEndereco> listar(Long pessoa, String tipoPessoa) throws Exception {

		List<BeanEndereco> lista = new ArrayList<BeanEndereco>();

		if (tipoPessoa == "cliente") {
			String sql = "select * from endereco where cliente = " + pessoa;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
			  BeanEndereco listaEndereco = new BeanEndereco();
			  listaEndereco.setId(resultSet.getLong("id"));
			  listaEndereco.setCep(resultSet.getString("cep"));
			  listaEndereco.setRua(resultSet.getString("rua"));
			  listaEndereco.setBairro(resultSet.getString("bairro"));
			  listaEndereco.setComplemento(resultSet.getString("complemento"));
			  listaEndereco.setCidade(resultSet.getString("cidade"));
			  listaEndereco.setEstado(resultSet.getString("estado"));
			  listaEndereco.setIbge(resultSet.getString("ibge"));
			  listaEndereco.setCliente(resultSet.getLong("cliente"));
			  lista.add(listaEndereco);
			}
			return lista;			
		}else if(tipoPessoa == "usuario") {
			String sql = "select * from endereco where cliente = " + pessoa;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
			  BeanEndereco listaEndereco = new BeanEndereco();
			  listaEndereco.setId(resultSet.getLong("id"));
			  listaEndereco.setCep(resultSet.getString("cep"));
			  listaEndereco.setBairro(resultSet.getString("bairro"));
			  listaEndereco.setComplemento(resultSet.getString("complemento"));
			  listaEndereco.setCidade(resultSet.getString("cidade"));
			  listaEndereco.setEstado(resultSet.getString("estado"));
			  listaEndereco.setIbge(resultSet.getString("ibge"));
			  listaEndereco.setCliente(resultSet.getLong("cliente"));
			  lista.add(listaEndereco);
			}
			return lista;			
		}
        return null;
	}

	// Metodo para deletar um endereco
	public void deleteEndereco(String id) throws Exception {
		try {
			String sql = "delete from endereco where id = '" + id + "'";
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}
	public void updateEndereco(BeanEndereco endereco) throws Exception {

		try {
			String sql = "update endereco set cep = ?, rua = ?, bairro = ?, complemento = ?, cidade = ?, estado = ?, ibge = ? , cliente = ? where id = " + endereco.getId();
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, endereco.getCep());
			preparedStatement.setString(2, endereco.getRua());
			preparedStatement.setString(3, endereco.getBairro());
			preparedStatement.setString(4, endereco.getComplemento());
			preparedStatement.setString(5, endereco.getCidade());
			preparedStatement.setString(6, endereco.getEstado());
			preparedStatement.setString(7, endereco.getIbge());
			preparedStatement.setLong(8, endereco.getCliente());
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// Metodo para consultar o endereço
	public BeanEndereco consultarEndereco(String codigo) {

		try {
			String sql = "select * from endereco where id = '" + codigo + "'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				BeanEndereco endereco = new BeanEndereco();
				endereco.setId(resultSet.getLong("id"));
				endereco.setCep(resultSet.getString("cep"));
				endereco.setRua(resultSet.getString("rua"));
				endereco.setBairro(resultSet.getString("bairro"));
				endereco.setComplemento(resultSet.getString("complemento"));
				endereco.setCidade(resultSet.getString("cidade"));
				endereco.setEstado(resultSet.getString("estado"));
				endereco.setIbge(resultSet.getString("ibge"));
				return endereco;
			}
		} catch (Exception e) {
			e.printStackTrace();
	 }
	 return null;
   }
	
}

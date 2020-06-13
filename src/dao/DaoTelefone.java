package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanTelefones;
import connection.SingleConnection;

public class DaoTelefone {

	private Connection connection;

	public DaoTelefone() {
		connection = SingleConnection.getConnection();
	}

	// Metodo para salvar os telefones
	public void salvarTelefone(BeanTelefones telefone, String tipoPessoa) throws SQLException {
		try {
			if (tipoPessoa=="usuario") {
			   String sql = "insert into telefones(numero,tipo,usuario) values(?,?,?)";
			   PreparedStatement insert = connection.prepareStatement(sql);
			   insert.setString(1, telefone.getNumero());
			   insert.setString(2, telefone.getTipo());
			   insert.setLong(3, telefone.getUsuario());
			   insert.execute();
			   connection.commit();
			}else if (tipoPessoa=="cliente") {
			   String sql = "insert into telefones(numero,tipo,cliente) values(?,?,?)";
			   PreparedStatement insert = connection.prepareStatement(sql);
			   insert.setString(1, telefone.getNumero());
			   insert.setString(2, telefone.getTipo());
			   insert.setLong(3, telefone.getCliente());
			   insert.execute();
			   connection.commit();
			}
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

	// Medodo para listar os telefones dos usuarios
	public List<BeanTelefones> listar(Long pessoa, String tipoPessoa) throws Exception {

		List<BeanTelefones> lista = new ArrayList<BeanTelefones>();
		
		if (tipoPessoa == "cliente") {
			String sql = "select * from telefones where cliente = " + pessoa;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				BeanTelefones listaTelefone = new BeanTelefones();
				listaTelefone.setId(resultSet.getLong("id"));
				listaTelefone.setNumero(resultSet.getString("numero"));
				listaTelefone.setTipo(resultSet.getString("tipo"));
				listaTelefone.setCliente(resultSet.getLong("cliente"));
				lista.add(listaTelefone);
			}
			return lista;			
		}else if(tipoPessoa == "usuario") {
			String sql = "select * from telefones where usuario = " + pessoa;
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				BeanTelefones listaTelefone = new BeanTelefones();
				listaTelefone.setId(resultSet.getLong("id"));
				listaTelefone.setNumero(resultSet.getString("numero"));
				listaTelefone.setTipo(resultSet.getString("tipo"));
				listaTelefone.setUsuario(resultSet.getLong("usuario"));
				lista.add(listaTelefone);
			}
			return lista;			
		}
        return null;
	}

	// Metodo para deletar um telefone
	public void deleteTelefone(String id) throws Exception {
		try {
			String sql = "delete from telefones where id = '" + id + "'";
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

}

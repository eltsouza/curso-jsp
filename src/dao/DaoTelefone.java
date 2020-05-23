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
	public void salvarTelefone(BeanTelefones telefone) throws SQLException {
		try {
			String sql = "insert into telefones(numero,tipo,usuario) values(?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, telefone.getNumero());
			insert.setString(2, telefone.getTipo());
			insert.setLong(3, telefone.getUsuario());
			insert.execute();
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

	// Medodo para listar os telefones dos usuarios
	public List<BeanTelefones> listar(Long user) throws Exception {

		List<BeanTelefones> lista = new ArrayList<BeanTelefones>();

		String sql = "select * from telefones where usuario = " + user;
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

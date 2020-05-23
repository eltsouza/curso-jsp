package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCategoria;
import beans.BeanProduto;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	// Metodo para salvar os produtos
	public void salvarProduto(BeanProduto produto) throws SQLException {
		try {
			String sql = "insert into produtos(nome,quantidade,valor,categoria_id) values(?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setDouble(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());
			insert.setLong(4, produto.getCategoria_id());
			insert.execute();
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

	// Medodo para listar os dados dos produtos
	public List<BeanProduto> listar() throws Exception {

		List<BeanProduto> lista = new ArrayList<BeanProduto>();
		String sql = "select * from produtos";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			BeanProduto listaProduto = new BeanProduto();
			listaProduto.setCodigo(resultSet.getLong("codigo"));
			listaProduto.setNome(resultSet.getString("nome"));
			listaProduto.setQuantidade(resultSet.getInt("quantidade"));
			listaProduto.setValor(resultSet.getDouble("valor"));
			listaProduto.setCategoria_id(resultSet.getLong("categoria_id"));
			lista.add(listaProduto);
		}
		return lista;
	}
	// Medodo para listar categoria dos produtos
	public List<BeanCategoria> listarCategoria() throws Exception {

		List<BeanCategoria> listaCategoria = new ArrayList<BeanCategoria>();
		String sql = "select * from categoria";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			BeanCategoria listaCateg = new BeanCategoria();
			listaCateg.setId(resultSet.getLong("id"));
			listaCateg.setNome(resultSet.getString("nome"));			
			listaCategoria.add(listaCateg);
		}
		return listaCategoria;
	}

	// Metodo para consultar o produto
	public BeanProduto consultar(String codigo) {

		try {
			String sql = "select * from produtos where codigo = '" + codigo + "'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				BeanProduto produto = new BeanProduto();
				produto.setCodigo(resultSet.getLong("codigo"));
				produto.setNome(resultSet.getString("nome"));
				produto.setQuantidade(resultSet.getInt("quantidade"));
				produto.setValor(resultSet.getDouble("valor"));
				produto.setCategoria_id(resultSet.getLong("categoria_id"));

				return produto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// Metodo para deletar um produto
	public void deleteProduto(String codigo) throws Exception {
		try {
			String sql = "delete from produtos where codigo = '" + codigo + "'";
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			connection.rollback();
			e.printStackTrace();
		}
	}

	public void updateProduto(BeanProduto produto) throws Exception {

		try {
			String sql = "update produtos set nome = ? , quantidade = ? , valor = ? , categoria_id = ? where codigo = "
					+ produto.getCodigo();
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setDouble(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.setLong(4, produto.getCategoria_id());
			preparedStatement.execute();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// rotina para validar produto duplicado
	public boolean validarProduto(String nome) {

		try {
			String sql = "select count(1) as qtd from produtos where nome = '" + nome + "'";
			PreparedStatement statement;
			statement = connection.prepareStatement(sql);
			ResultSet resultset = statement.executeQuery();

			if (resultset.next()) {

				return resultset.getInt("qtd") <= 0;// return true
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}

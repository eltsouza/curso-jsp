package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {

	private static String url = "jdbc:postgresql://localhost:5432/cursojsp?autoReconnect=true";
	private static String user = "postgres";
	private static String password = "admin";
	private static Connection connection = null;
	
    //Criando um static direto para chamar o metodo conectar de qualquer lugar
	static {
	  conectar();
	}
	
	//Criando o metodo construtor da conexao
	public SingleConnection(){
	  conectar();
	}
	
	//OBS: Conexao é aberta e fechada no banco de dados apenas uma vez. 
	//O que são abertas e fechadas posteriormente são as sessões
	
	//Metodo privado para conexao
	private static void conectar() {
		
		try {
			if (connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(url, user, password);
				connection.setAutoCommit(false); // com esta instruação, o desenvolvedor decide quando efetuar o COMMIT nas transações
				System.out.println("Conectou com sucesso ao banco de dados");
			}
			
		
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar no banco de dados.");
		}
		
		
		
		
	}
	//Metodo publico para retornar a conexao
	public static Connection getConnection() {
		return connection;
	}
	
	
}

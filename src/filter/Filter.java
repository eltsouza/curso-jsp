package filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import connection.SingleConnection;
import java.sql.Connection;
import java.sql.SQLException;

//Existe uma configuracao no webxml de filter antes de implementar essa classe.

@WebFilter(urlPatterns="/*") //mapeamento para intereceptar todas as urls de requests e reponse
public class Filter implements javax.servlet.Filter {

	private static Connection connection;

	@Override //doFilter filtra tudo que vem das telas
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		try {
			arg2.doFilter(arg0, arg1); // intercepta os request e da o response
			connection.commit();
		} catch (Exception e) {
			try {
				e.printStackTrace();
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	@Override
	public void destroy() {

	}

	// é sempre executado
	@Override
	public void init(FilterConfig arg0) throws ServletException {

		connection = SingleConnection.getConnection();

	}

}

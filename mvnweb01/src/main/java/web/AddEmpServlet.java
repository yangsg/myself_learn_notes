package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEmpServlet")
public class AddEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddEmpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/mydb01?useUnicode=true&characterEncoding=utf8",
							"root", "1234");
			System.out.println(conn);
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

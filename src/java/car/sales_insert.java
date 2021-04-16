package car;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sales_insert
 */
@WebServlet("/sales_insert")
public class sales_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sales_insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//String no = request.getParameter("no");
		String name = request.getParameter("name");
		String pname = request.getParameter("pnm");
		String qty = request.getParameter("qty");
		String price = request.getParameter("prc");
		//String total = request.getParameter("ttl");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		// loads mysql driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ami_car", "root", ""); // create new connection with test database
		
		//String query="insert into sales values(?,?,?,?,?,?)";
		String query="{call update_sales('"+name+"','"+pname+"','"+qty+"','"+price+"')}";
		
		PreparedStatement ps=con.prepareStatement(query);  // generates sql query
		
//		ps.setInt(1, Integer.parseInt(no));
//		ps.setString(2,name);
//		ps.setString(3,pname);
//		ps.setString(4, qty);
//		ps.setString(5,price);
//		ps.setString(6,total);

		
		ps.executeUpdate(); // execute it on test database
		System.out.println("successfuly inserted");
		ps.close();
		con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		

	}

}

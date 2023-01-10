
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addCart")
public class AddCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String prodname="";
		String quantity="";
		String loginmail="";
		String dataprodno="";
		Cookie[] cookies = request.getCookies();
		prodname = String.valueOf(request.getParameter("prodname"));
		quantity = String.valueOf(request.getParameter("quantity"));
		for (Cookie c : cookies) {
			  if (c.getName().equals("username")) {
			    loginmail = c.getValue();
			  }
			}
	    response.setContentType("text/plain;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String sql = "";
		String sql1 = "";
		String sql2 = "";
		conn = db.getconn();
		
	    if(conn != null)
	    {
	    	try {
				stmt = conn.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		 
		 }
//	    else 
//	    {
//	    	out.print("<h1 style='color:red'>資料庫連線失敗</h1>");
//	    	
//	    }
	    
	    try {
	    sql="INSERT INTO cart(mem_no) select mem_no from member where email = '"+loginmail+"' ON DUPLICATE KEY UPDATE cart.mem_no=cart.mem_no;";
	    stmt.executeUpdate(sql);
	    sql1="SELECT comm_no FROM nw_select.commodity WHERE comm_name='"+prodname+"';";
	    rs = stmt.executeQuery(sql1);
	    if(rs.next()) {
	    	dataprodno=String.format("%05d",rs.getInt(1));
	    }
	    sql2= "INSERT INTO cart_data(cart_no,comm_no,qty)" + 
	    		"SELECT cart_no ,'"+dataprodno+"','"+quantity+"'"+
	    		" FROM cart" + 
	    		" where cart_no=(select cart_no from cart where mem_no=(SELECT mem_no FROM member WHERE email='"+loginmail+"'))"+
	    		"ON DUPLICATE KEY UPDATE qty=qty+"+quantity+";";
	    stmt.executeUpdate(sql2);
	    
	    }

		catch(Exception e){
			System.out.print(e);
		}
		
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	
}

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/getCart")
public class GetCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginmail=null;
		String dataname=null;
		String dataprice=null;	
		String quantity=null;
		String commno=null;
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			  if (c.getName().equals("username")) {
			    loginmail = c.getValue();
			  }
			}
		
	    response.setContentType("text/plain;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    HttpSession httpSession=request.getSession(true);
	    
   try {
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    String sql = "";
		String sql1 = "";
		String sql2 = "";
		conn = db.getconn();
		
		sql="SELECT * FROM cart_data WHERE cart_no=(SELECT cart_no FROM cart WHERE mem_no=(SELECT mem_no FROM member WHERE email='"+loginmail+"');";
	    rs = stmt.executeQuery(sql);
	    if(rs.next()) {
	    	commno=String.format("%05d",rs.getInt("comm_no"));
	    	quantity=String.valueOf(rs.getInt("qty"));
	    }
	    sql1="SELECT * FROM commodity WHERE comm_no='"+commno+"';";
	    rs = stmt.executeQuery(sql1);
	    if(rs.next()) {
	    	dataname=String.valueOf(rs.getInt("comm_name"));
	    	dataprice=String.valueOf(rs.getInt("price"));
	    }
	    
    	httpSession.setAttribute("prodname",dataname);
    	httpSession.setAttribute("prodprice",dataprice);
    	httpSession.setAttribute("quantity",quantity);

        rs.close();
        stmt.close();
        
}
	catch (SQLException e) {


        e.printStackTrace();
    }
}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
		
	}
	
}
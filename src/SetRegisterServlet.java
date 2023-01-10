
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/setRegister")
public class SetRegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mail="";
		String passwd="";
		String name="";
		String birth="";
		String phone="";
		mail = String.valueOf(request.getParameter("mail"));
		passwd = String.valueOf(request.getParameter("passwd"));
		name = String.valueOf(request.getParameter("name"));
		birth = String.valueOf(request.getParameter("birth"));
		phone = String.valueOf(request.getParameter("phone"));
	    response.setContentType("text/plain;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
		String sql = "";
		StringBuffer sb = new StringBuffer();
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
	    sql= "insert into nw_select.member (email,passwd,mem_name,phone,birth) values ('" + mail +"', '"+passwd+"', '"+name+"','"+phone+"','"+birth+"');";
        stmt.executeUpdate(sql);
	    }

		catch(Exception e){}
		
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
		doGet(request, response);
	}
	
}
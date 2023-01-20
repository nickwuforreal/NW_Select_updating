
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
	    
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    Statement stmt = null;
		String sql = "";
		conn = db.getconn();
		
	    if(conn != null){
	    	try {
				stmt = conn.createStatement();
			} 
	    	catch (SQLException e) {
				e.printStackTrace();
			}		 
		 }
	    
	    try {
	    sql= "insert into nw_select.member (email,passwd,mem_name,phone,birth) values ('" + mail +"', '"+passwd+"', '"+name+"','"+phone+"','"+birth+"');";
        stmt.executeUpdate(sql);
	    }
		catch(Exception e){}
		try {
			stmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
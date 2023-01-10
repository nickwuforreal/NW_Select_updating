
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editCart")
public class EditCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String quantity="";
		String prodno="";
		String cartno="";

		cartno = String.valueOf(request.getParameter("cartno"));
		prodno = String.valueOf(request.getParameter("prodno"));
		quantity = String.valueOf(request.getParameter("prodquan"));

		String[] commquan = quantity.split(",");
		String[] commno = prodno.split(",");
//		System.out.print(cartno+"***"+prodno+"***"+quantity+"***"+loginmail);
	    response.setContentType("text/plain;charset=utf-8");
	    
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    Statement stmt = null;
	    String [] sql = new String[50];
	    for (int i = 0; i < 50; i++) {
	    	sql[i] = "sql"+Integer.toString(i + 1);
	    	}
	    for (String no : commquan) {
	    	  System.out.println(no);
	    }
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
	    
	    try {
	    	for(int i=0;i<commno.length;i++) {
	    	//	if(commquan[i]!="0")
	    sql[i]="UPDATE cart_data SET qty = '"+commquan[i]+"' WHERE comm_no='"+commno[i]+"';";
	    stmt.executeUpdate(sql[i]);
	    	}
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
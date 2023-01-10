
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

@WebServlet("/doProdDetail")
public class GetProdDetailServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodname=null;
		String dataname=null;
		String dataprice=null;	
		String datastock=null;
		String datacon=null;
		String datapic=null;
		
        prodname = request.getParameter("title");
		//System.out.print(prodname);
	    response.setContentType("text/plain;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    HttpSession httpSession=request.getSession(true);
	    
   try {
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
		conn = db.getconn();
		//System.out.print(prodname);
		String sql= "select * from nw_select.commodity INNER JOIN nw_select.comm_pic ON commodity.comm_no=comm_pic.comm_no where comm_name=?;";
	    stmt = conn.prepareStatement(sql);
	    stmt.setString(1,prodname);
	    rs = stmt.executeQuery();
	    if(!rs.next()) 
        {
	    	System.out.print("找不到商品！請稍候再試");
	    	response.sendRedirect("product_top.jsp");
        }else 
        {
        	dataprice = rs.getString("price");
        	dataname = rs.getString("comm_name");
        	datastock = rs.getString("stock");
        	datacon = rs.getString("contect");
        	datapic = rs.getString("pic_name");
        	httpSession.setAttribute("prodname",dataname);
        	httpSession.setAttribute("prodprice",dataprice);
        	httpSession.setAttribute("prodstock",datastock);
        	httpSession.setAttribute("prodcon",datacon);
        	httpSession.setAttribute("prodpic",datapic);
        	response.sendRedirect("product_details.jsp");
            }

        
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

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@WebServlet("/setDelivery")
public class SetDeliveryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String deliverymail=null;
		String deliveryname=null;
		String deliveryphone=null;
		String deliverypayment=null;
		String deno=null;
		String loginmail=null;
		String cartno=null;
		String memno=null;
		String odno=null;
		String prodprice = null;
		String commno=null;
		String quantity = null;
	    int quan=0;
	    int pri=0;
	    String count=null;
	    int tot=0;
	    String total=null;
		Cookie[] cookies = request.getCookies();
		Calendar cal = Calendar.getInstance();
		
		deliverymail = String.valueOf(request.getParameter("mail"));
		deliveryname = String.valueOf(request.getParameter("name"));
		deliveryphone = String.valueOf(request.getParameter("phone"));
		deliverypayment = String.valueOf(request.getParameter("payment"));
		cartno = String.valueOf(request.getParameter("cartno"));
		String year = String.format("%02d",cal.get(Calendar.YEAR));
	    String month = String.format("%02d",cal.get(Calendar.MONTH) + 1); // Calendar months are zero-based
	    String day = String.format("%02d",cal.get(Calendar.DAY_OF_MONTH));
	    String hour = String.format("%02d",cal.get(Calendar.HOUR_OF_DAY));
	    String minute = String.format("%02d",cal.get(Calendar.MINUTE));
	    String second = String.format("%02d",cal.get(Calendar.SECOND));
	    String ordertime = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		for (Cookie c : cookies) {
			  if (c.getName().equals("username")) {
			    loginmail = c.getValue();
			  }
			}
		
	    response.setContentType("text/plain;charset=utf-8");
	    PrintWriter out=response.getWriter();
	    
	    System.out.println(deliverymail+"/"+deliveryname+"/"+deliveryphone+"/"+deliverypayment+"/"+cartno);
	    System.out.println("Current date and time: " +ordertime);
	    
	    com.ted.SQLBean db = new com.ted.SQLBean();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
		String sql = "";
		String sql1 = "";
		String sql2 = "";
		String sql3 = "";
		String sql4 = "";
		String sql5 = "";
		String sql6 = "";
		StringBuffer sb = new StringBuffer();
		conn = db.getconn();
	    
	    try {
        sql2="SELECT * FROM member WHERE email=?;";
		stmt = conn.prepareStatement(sql2);
		stmt.setString(1,loginmail);
		rs = stmt.executeQuery();
	    while(rs.next()) {
	    	memno=String.format("%05d",rs.getInt("mem_no"));
	    }

	    sql= "insert into delivery (mem_no,de_name,de_phone,de_pay) values ('"+memno+"', '"+deliveryname+"', '"+deliveryphone+"', '"+deliverypayment+"');";
	    stmt = conn.prepareStatement(sql);
	    stmt.executeUpdate();
	    
	    sql6="INSERT INTO order (cart_no,mem_no)"
	    		+ " SELECT cart_no,mem_no"
	    		+ " FROM cart;"
	    		+ " UPDATE order"
	    		+ " SET de_no=(SELECT de_no FROM delivery "
	    		+ "WHERE delivery.mem_no=order.mem_no);"
	    		+ "mem_no,"
	    		+ "de_no"
	    		+ ")";
	    
	    sql1="SELECT de_no FROM delivery WHERE mem_no='"+memno+"';";
	    stmt = conn.prepareStatement(sql1);
	    rs = stmt.executeQuery();
	    while(rs.next()) {
	    	deno=String.format("%05d",rs.getInt("de_no"));
	    }
	    
        sql3="select * from cart_data inner join ("+
				"(SELECT * ,(SELECT mem_no FROM member WHERE email='"+loginmail+"') as mem_no FROM commodity WHERE commodity.comm_no in"+ 
				"(SELECT comm_no FROM cart_data "+
				"WHERE cart_no=(SELECT cart_no FROM cart "+
				"WHERE mem_no='"+memno+"')) "+
				")) as temp"+
				" on temp.comm_no=cart_data.comm_no;";
        rs = stmt.executeQuery(sql3);
        while(rs.next()) {
	    	cartno=String.format("%05d",rs.getInt("cart_no"));
	    	commno=String.format("%05d",rs.getInt("comm_no"));
	    	quan=rs.getInt("qty");
	    	quantity=String.valueOf(quan);
	    	pri=rs.getInt("price");
	    	prodprice=String.valueOf(pri);
	    	count=String.valueOf(quan*pri);
	    	tot+=(quan*pri);
	    	total=String.valueOf(tot);
        }
        
        sql4="INSERT INTO order (od_date,cart_no,mem_no,de_no,total) values('"+ordertime+"', '"+cartno+"', '"+memno+"', '"+deno+"', '"+total+"');";
        stmt = conn.prepareStatement(sql4);
	    stmt.executeUpdate();
	    
	    sql5="SELECT od_no FROM order WHERE cart_no='"+cartno+"';";
	    rs = stmt.executeQuery(sql5);
        while(rs.next()) {
        	odno=String.format("%05d",rs.getInt("od_no"));
        }
        
        
        
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
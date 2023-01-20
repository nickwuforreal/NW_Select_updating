
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

@WebServlet("/doLogin")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String logmail="";
		String logpasswd="";

		logmail = request.getParameter("loginmail");
		logpasswd = request.getParameter("loginpwd");
	    response.setContentType("text/plain;charset=utf-8");
	    //防止非法登入    得到session
        HttpSession httpSession=request.getSession(true);
        //修改session的存在時間為20s
        httpSession.setMaxInactiveInterval(20);
        httpSession.setAttribute("pass","ok");
	   try {
		    com.ted.SQLBean db = new com.ted.SQLBean();
		    Connection conn = null;
		    PreparedStatement stmt = null;
		    ResultSet rs = null;
			conn = db.getconn();
			
			String sql= "select email,passwd from nw_select.member where email=? and passwd=?;";
		    stmt = conn.prepareStatement(sql);
		    stmt.setString(1,logmail);
	        stmt.setString(2,logpasswd);
		    rs = stmt.executeQuery();
		    if(!rs.next()) {
		    	httpSession.setAttribute("errorlogin","登入失敗！帳號或密碼錯誤");
		    	response.sendRedirect("login.jsp");
	        }
		    else {
	        	String remember = request.getParameter("remember");
	            //勾選了保持登入
	            if (remember != null) {
	                //建立cookie
	                Cookie cookie1 = new Cookie("username", logmail);
	               // Cookie cookie2 = new Cookie("password", logpasswd);
	                //設定關聯路徑
	                cookie1.setPath(request.getContextPath());
	                //cookie2.setPath(request.getContextPath());
	                //設定cookie的消亡時間  兩週
	                cookie1.setMaxAge(2 * 7 * 24 * 60 * 60);
	               // cookie2.setMaxAge(2 * 7 * 24 * 60 * 60);
	                //把cookie資訊寫給瀏覽器
	                response.addCookie(cookie1);
	               // response.addCookie(cookie2);
	            }
	            else {
	            	Cookie cookie1 = new Cookie("username", logmail);
	            	cookie1.setPath(request.getContextPath());
	            	cookie1.setMaxAge(24 * 60 * 60);
	            	response.addCookie(cookie1);
	            }
	            //跳轉到首頁
	            response.sendRedirect("home.jsp");
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
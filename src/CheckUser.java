
import java.util.Optional;
import java.util.stream.Stream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckUser
 */
@WebServlet("/checkUser")
public class CheckUser extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
        Optional<Object> token = Optional.ofNullable(session.getAttribute("login"));
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if(token.isPresent()) 
        {
        	String sessionid = request.getSession(false).getId();
        	response.sendRedirect("login.jsp");
        	Cookie userCookie = new Cookie("usersid",sessionid);
        	response.addCookie(userCookie);
        }
        else 
        {
            response.sendRedirect("login.jsp");
        }
	}
	
	private void userHtml(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String sessionid = request.getSession(false).getId();
        out.print(sessionid);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

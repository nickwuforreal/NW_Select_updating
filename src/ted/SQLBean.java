package ted;

import java.sql.Connection;
import java.sql.DriverManager;

public class SQLBean {

	private Connection conn;
	private String driver="com.mysql.cj.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/nw_select";
 
	private String user="root";
	private String password="1234";

	public Connection getconn(){
	
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
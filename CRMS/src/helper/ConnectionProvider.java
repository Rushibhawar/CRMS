package helper;

import java.sql.*;

public class ConnectionProvider {
	private static  Connection con;
	
	public static Connection getMysqlConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/crms";
			String user = "root";
			String password = "Mysql@123";
			con = DriverManager.getConnection(url, user, password);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside connection provider");
		}
		
		return con;
	}
}

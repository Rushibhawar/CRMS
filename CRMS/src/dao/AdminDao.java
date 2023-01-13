package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.Admin;
import entity.Student;


public class AdminDao {
	Connection con;

	public AdminDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int insertAdmin(Admin admin){
		int rs = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("insert into admin_table (admin_name,admin_email,admin_password,admin_contact) values(?,?,?,?)");
			ps.setString(1,admin.getAdminName());
			ps.setString(2,admin.getAdminEmail());
			ps.setString(3,admin.getAdminPassword());
			ps.setString(4,admin.getAdminContact());

			rs=ps.executeUpdate(); 

		}catch(Exception e){
			System.out.println(e+"inside insert  admin dao ");
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public Admin getStudentrByEmailAndPassword(String email,String password) {
		Admin admin = null;
		
		try {
			String query = "SELECT * FROM admin_table WHERE admin_email=? AND admin_password=?";
			
			//prepare statement
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
		
			if(set.next()) {
				int admin_id = set.getInt("admin_id");
				String admin_name =set.getString("admin_name");
				String admin_email =set.getString("admin_email");
				String admin_password =set.getString("admin_password");
				String admin_contact =set.getString("admin_contact");

				
				admin = new Admin(admin_id, admin_name, admin_email, admin_password, admin_contact);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("User not found");
			e.printStackTrace();
		}
		
		return admin;
		
	}
	
}

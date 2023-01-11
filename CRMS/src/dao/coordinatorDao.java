package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.Coordinator;
import entity.Job;
import entity.Student;

public class coordinatorDao {

	Connection con;

	public coordinatorDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int insertCoordinator(Coordinator coordinator) {
		int rs = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("insert into coordinator_table (coordinator_name,coordinator_email,coordinator_password,coordinator_address,coordinator_contact) values(?,?,?,?,?)");
			ps.setString(1,coordinator.getCoordinatorName());
			ps.setString(2,coordinator.getCoordinatorEmail());
			ps.setString(3,coordinator.getCoordinatorPassword());
			ps.setString(4,coordinator.getCoordinatorAddress());
			ps.setString(5,coordinator.getCoordinatorContact());
			rs=ps.executeUpdate(); 

		}catch(Exception e){
			System.out.println(e+"inside coordi insert servlet");
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public Coordinator getStudentrByEmailAndPassword(String email,String password) {
		Coordinator coordinator = null;
		
		try {
			String query = "SELECT * FROM coordinator_table WHERE coordinator_email=? AND coordinator_password=?";
			
			//prepare statement
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
		
			if(set.next()) {
				String coordinatorName =set.getString("coordinator_name");
				String coordinatorEmail =set.getString("coordinator_email");
				String coordinatorPassword =set.getString("coordinator_password");
				String coordinatorAddress =set.getString("coordinator_address");
				String coordinatorContact =set.getString("coordinator_contact");

				coordinator = new Coordinator(coordinatorName, coordinatorEmail, coordinatorPassword, coordinatorAddress, coordinatorContact);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("User not found");
			e.printStackTrace();
		}
		
		return coordinator;
		
	}

	
	public void insertJob(Job job) {
		
	}
}

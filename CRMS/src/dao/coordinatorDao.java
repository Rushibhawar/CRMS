package dao;

import helper.ConnectionProvider;

import java.sql.*;

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
	
	public Coordinator getCoordinatorByEmailAndPassword(String email,String password) {
		Coordinator coordinator = null;
		
		try {
			String query = "SELECT * FROM coordinator_table WHERE coordinator_email=?";
			
			//prepare statement
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);

			
			ResultSet set = pstmt.executeQuery();
			
		
			if(set.next()) {
				 int coordinatorId = set.getInt("coordinator_id");
				String coordinatorName =set.getString("coordinator_name");
				String coordinatorEmail =set.getString("coordinator_email");
				String coordinatorPassword =set.getString("coordinator_password");
				String coordinatorAddress =set.getString("coordinator_address");
				String coordinatorContact =set.getString("coordinator_contact");

				coordinator = new Coordinator(coordinatorId, coordinatorName, coordinatorEmail, coordinatorPassword, coordinatorAddress, coordinatorContact);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("User not found");
			e.printStackTrace();
		}
		
		return coordinator;
		
	}

	public ResultSet getAllCoordinatorDetails() {
		ResultSet rs = null;
		try {
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM coordinator_table";
			rs = stmt.executeQuery(query);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getcountrydetails function dao");
		}
		
		
		return rs;
	}
	
	
	
	public int deleteCoordinatorDetails(int coordinator_id){
		int rs = 0;
		
		try {
			String query = "DELETE FROM coordinator_table WHERE coordinator_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,coordinator_id);

			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside dao delete coordinator details method");
		}
		
		
		return rs;
	}

}

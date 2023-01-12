package dao;

import helper.ConnectionProvider;

import java.sql.*;

import entity.ApplyJobFormApplication;
import entity.Job;

public class JobDao {
	Connection con;

	public JobDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int insertJob(Job job){
		int rs = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("insert into job_table ( job_title,job_company,job_description,coordinator_id,coordinator_name) values(?,?,?,?,?)");
			ps.setString(1,job.getJobTitle());
			ps.setString(2,job.getJobCompany());
			ps.setString(3,job.getJobDescription());
			ps.setInt(4,job.getCoordinatorId());
			ps.setString(5,job.getCoordinatorName());
			System.out.println(job.getJobTitle()+""+job.getJobCompany()+""+job.getJobDescription()+""+job.getCoordinatorId());
			rs=ps.executeUpdate(); 

		}catch(Exception e){
			System.out.println("inside insert  job post dao ");
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public int insertApplyJobForm(ApplyJobFormApplication applyJobForm){
		int rs = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("insert into  applied_job_table (applied_job_title,applied_job_company,applied_job_student_name,applied_job_student_email,applied_job_student_phone,applied_job_student_about,job_id) values(?,?,?,?,?,?,?)");
			ps.setString(1,applyJobForm.getApplied_job_title());
			ps.setString(2,applyJobForm.getApplied_job_company());
			ps.setString(3,applyJobForm.getApplied_job_student_name());
			ps.setString(4,applyJobForm.getApplied_job_student_email());
			ps.setString(5,applyJobForm.getApplied_job_student_phone());
			ps.setString(6,applyJobForm.getApplied_job_student_about());
			ps.setInt(7, applyJobForm.getJobId());
			rs=ps.executeUpdate(); 

		}catch(Exception e){
			System.out.println("inside insert  job post dao ");
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public ResultSet getAllJobDetails() {
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT * FROM job_table";
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobdetails function dao");
		}
		
		return rs;
	}
	
	public ResultSet getAllAppliedJobDetails() {
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT * FROM applied_job_table";
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobdetails function dao");
		}
		
		return rs;
	}
	
	public ResultSet getJobDetails(int coordinatorId,String coordinatorName) {
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT * FROM job_table WHERE coordinator_id=? AND coordinator_name=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,coordinatorId);
			ps.setString(2,coordinatorName);
			rs = ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobdetails function dao");
		}
		
		return rs;
	}
	
	public int getAllJobCount() {
		int count = 0;
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT COUNT(job_id) FROM job_table ";
			PreparedStatement ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobcount function dao");
		}
		
		return count;
	}
	
	public int getAllAppliedJobCount() {
		int count = 0;
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT COUNT(applied_job_id) FROM applied_job_table  ";
			PreparedStatement ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobcount function dao");
		}
		
		return count;
	}
	
	
	public int getAllAppliedJobCountForStudent(int currentStudentId,String currentStudentName){
		int count = 0;
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT COUNT(applied_job_id) FROM applied_job_table WHERE student_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,currentStudentId);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getstudnetjobcount function dao");
		}
		
		return count;
	}
	public int getJobCount(int coordinatorId,String coordinatorName) {
		int count = 0;
		ResultSet rs = null;
		try {
			Connection con = ConnectionProvider.getMysqlConnection();
			String query = "SELECT COUNT(*) FROM job_table WHERE coordinator_id=? AND coordinator_name=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,coordinatorId);
			ps.setString(2,coordinatorName);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside getjobcount function dao");
		}
		
		return count;
	}
	
	public int deleteJobDetails(int job_id){
		int rs = 0;
		
		try {
			String query = "DELETE FROM job_table WHERE job_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,job_id);

			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside dao delete Job details method");
		}
		
		
		return rs;
	}
	
	public int deleteAppliedJobDetails(int applied_job_id){
		int rs = 0;
		
		try {
			String query = "DELETE FROM applied_job_table WHERE applied_job_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,applied_job_id);

			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside dao delete Job details method");
		}
		
		
		return rs;
	}
	
	
}

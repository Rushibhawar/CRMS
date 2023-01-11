package dao;

import helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.Student;

public class StudentDao {

	Connection con;

	public StudentDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public int insertStudent(Student student){
		int rs = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("insert into student_table (student_name,student_email,student_password,student_college,student_course,student_contact,student_address) values(?,?,?,?,?,?,?)");
			ps.setString(1,student.getStudentName());
			ps.setString(2,student.getStudentEmail());
			ps.setString(3,student.getStudentPassword());
			ps.setString(4,student.getStudentCollege());
			ps.setString(5,student.getStudentCourse());
			ps.setString(6,student.getStudentPhone());
			ps.setString(7,student.getStudentAddress());

			rs=ps.executeUpdate(); 

		}catch(Exception e){
			System.out.println(e+"inside insert servlet");
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public int fetchLoginStudent(Student student){
		ResultSet rs = null;
		int count = 0;
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(student_name) FROM student_table WHERE student_email = ?  ");
			ps.setString(1,student.getStudentEmail());
			rs=ps.executeQuery(); 
			rs.next();
			count = rs.getInt(1);
		}catch(Exception e){
			System.out.println(e+"inside insert servlet");
			e.printStackTrace();
			
		}
		return count;
	}
	
	public Student getStudentrByEmailAndPassword(String email,String password) {
		Student student = null;
		
		try {
			String query = "SELECT * FROM student_table WHERE student_email=? AND student_password=?";
			
			//prepare statement
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
		
			if(set.next()) {
				String studentName =set.getString("student_name");
				String studentEmail =set.getString("student_email");
				String studentPassword =set.getString("student_password");
				String studentCollege =set.getString("student_college");
				String studentCourse =set.getString("student_course");
				String studentPhone =set.getString("student_contact");
				String studentAddress =set.getString("student_address");
				

				
				student = new Student(studentEmail, studentPassword, studentName, studentCourse, studentCollege, studentPhone, studentAddress);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("User not found");
			e.printStackTrace();
		}
		
		return student;
		
	}

	
}

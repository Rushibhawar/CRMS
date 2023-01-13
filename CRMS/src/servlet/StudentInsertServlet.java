package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDao;
import entity.Student;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudenInsertServlet")
public class StudentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String studentName =request.getParameter("studentName");
		String studentEmail =request.getParameter("studentEmail");
		String studentPassword =request.getParameter("studentPassword");
		String studentCollege =request.getParameter("studentCollege");
		String studentCourse =request.getParameter("studentCourse");
		String studentPhone =request.getParameter("studentPhone");
		String studentAddress =request.getParameter("studentAddress");
		
		Student student = new Student(studentEmail, studentPassword, studentName, studentCourse, studentCollege, studentPhone, studentAddress);

		
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			StudentDao studentDao = new StudentDao(con);
			int rs = studentDao.insertStudent(student);
				
			if(rs > 0)
			{
				System.out.println("stored successfully."+rs);
				response.sendRedirect("studentlogin.jsp");
			}else
			{
				System.out.println("Failed to store.");
				response.sendRedirect("studentRegister.jsp");
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside insert servlet");
		}
	}

}

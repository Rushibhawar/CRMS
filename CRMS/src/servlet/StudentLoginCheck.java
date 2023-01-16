package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDao;
import entity.Message;
import entity.Student;

/**
 * Servlet implementation class StudentLoginCheck
 */
@WebServlet("/StudentLoginCheck")
public class StudentLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		System.out.println("post");
		
		String studentName =request.getParameter("studentName");
		String studentEmail =request.getParameter("studentEmail");
		String studentPassword =request.getParameter("studentPassword");

		System.out.println("post");
		
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			StudentDao studentDao = new StudentDao(con);
			Student student = studentDao.getStudentrByEmailAndPassword(studentEmail, studentPassword);
			
			System.out.println("post");
			if(student == null) {
				Message msg = new Message("Invalid Details!  User does not exist","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("message", msg);
				/*RequestDispatcher rd = request.getRequestDispatcher("studentlogin.jsp");
				rd.forward(request, response);*/
				System.out.println("error");
				response.sendRedirect("studentlogin.jsp");
			}
			else {
				//login success
				System.out.println("success");
				HttpSession session =request.getSession();
				session.setAttribute("currentUser", student);
				session.setAttribute("success", "success");
				response.sendRedirect("studentDashBoard.jsp?studentId="+student.getStudentId()+"&studentName="+student.getStudentName());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside check student login servlet");
		}
	}

}

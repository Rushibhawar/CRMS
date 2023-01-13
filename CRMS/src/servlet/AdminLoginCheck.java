package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.StudentDao;
import entity.Admin;
import entity.Message;
import entity.Student;

/**
 * Servlet implementation class AdminLoginCheck
 */
@WebServlet("/AdminLoginCheck")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginCheck() {
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
		System.out.println("post");
		
		String adminName =request.getParameter("adminName");
		String adminEmail =request.getParameter("adminEmail");
		String adminPassword =request.getParameter("adminPassword");

		System.out.println("post");
		
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			AdminDao adminDao = new AdminDao(con);
			Admin admin = adminDao.getStudentrByEmailAndPassword(adminEmail, adminPassword);
			
			System.out.println("post");
			if(admin == null) {
				Message msg = new Message("Invalid Details!  User does not exist","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("message", msg);
				/*RequestDispatcher rd = request.getRequestDispatcher("studentlogin.jsp");
				rd.forward(request, response);*/
				System.out.println("error");
				response.sendRedirect("adminLogin.jsp");
			}
			else {
				//login success
				System.out.println("success");
				HttpSession session =request.getSession();
				session.setAttribute("currentUser", admin);
				session.setAttribute("success", "success");
				response.sendRedirect("adminDashboard.jsp?adminId="+admin.getAdminId()+"&adminName="+admin.getAdminName());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside check student login servlet");
		}
	}

}

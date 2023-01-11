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

import dao.AdminDao;
import dao.StudentDao;
import entity.Admin;
import entity.Student;

/**
 * Servlet implementation class AdminInsertServlet
 */
@WebServlet("/AdminInsertServlet")
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertServlet() {
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
		
		String adminName =request.getParameter("adminName");
		String adminEmail =request.getParameter("adminEmail");
		String adminPassword =request.getParameter("adminPassword");
		String adminPhone =request.getParameter("adminPhone");
		
		Admin admin = new Admin(adminName, adminEmail, adminPassword, adminPhone);
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			AdminDao adminDao = new AdminDao(con);
			int rs = adminDao.insertAdmin(admin);
				
			if(rs > 0)
			{
				System.out.println("stored successfully."+rs);
				response.sendRedirect("adminLogin.jsp");
			}else
			{
				System.out.println("Failed to store.");
				response.sendRedirect("adminRegisterForm.jsp");
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside insert servlet");
		}
	}

}

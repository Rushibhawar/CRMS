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

import dao.StudentDao;
import dao.coordinatorDao;
import entity.Coordinator;
import entity.Student;

/**
 * Servlet implementation class CoordinatorServlet
 */
@WebServlet("/CoordinatorServlet")
public class CoordinatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoordinatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get coo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post coo");
		PrintWriter out = response.getWriter();
		
		String coordinatorName = request.getParameter("coordinatorName");
		String coordinatorEmail = request.getParameter("coordinatorEmail");
		String coordinatorPassword = request.getParameter("coordinatorPassword");
		String coordinatorAddress = request.getParameter("coordinatorAddress");
		String coordinatorContact = request.getParameter("coordinatorContact");
		
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			coordinatorDao coordinatordao = new coordinatorDao(con);
			Coordinator coordinator = new Coordinator(coordinatorName, coordinatorEmail, coordinatorPassword, coordinatorAddress, coordinatorContact);
			
			int rs = coordinatordao.insertCoordinator(coordinator);
				
			if(rs > 0)
			{
				System.out.println("stored successfully."+rs);
				//response.sendRedirect("companyLogin.jsp");
			}else
			{
				System.out.println("Failed to store.");
				//response.sendRedirect("CompanyRegisterForm.jsp");
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside insert servlet");
		}
	}

}

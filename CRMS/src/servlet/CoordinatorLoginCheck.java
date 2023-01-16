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

import dao.StudentDao;
import dao.coordinatorDao;
import entity.Coordinator;
import entity.Message;
import entity.Student;

/**
 * Servlet implementation class CoordinatorLoginCheck
 */
@WebServlet("/CoordinatorLoginCheck")
public class CoordinatorLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoordinatorLoginCheck() {
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
		
		String coordinatorName =request.getParameter("coordinatorName");
		String coordinatorEmail =request.getParameter("coordinatorEmail");
		String coordinatorPassword =request.getParameter("coordinatorPassword");

		
		try{
			Connection con = ConnectionProvider.getMysqlConnection();
			coordinatorDao coordinatordao = new coordinatorDao(con);
			Coordinator coordinator = coordinatordao.getCoordinatorByEmailAndPassword(coordinatorEmail, coordinatorPassword);

			if(coordinator == null) {
				Message msg = new Message("Invalid Details!  Coordinator does not exist","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("message", msg);
				/*RequestDispatcher rd = request.getRequestDispatcher("studentlogin.jsp");
				rd.forward(request, response);*/
				System.out.println("error");
				response.sendRedirect("companyLogin.jsp");
			}
			else {
				//login success
				System.out.println("success");
				HttpSession session =request.getSession();
				session.setAttribute("currentUser", coordinator);
				session.setAttribute("success", "success");
				response.sendRedirect("http://localhost:8080/CRMS/coordinatorDashBoard.jsp?coordinatorId="+coordinator.getCoordinatorId()+"&coordinatorName="+coordinator.getCoordinatorName() );
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e+"inside check coordinator login servlet");
		}
	}

}
